unit Spectator_lib;

interface
uses graphics,atmosphere_lib,colorimetry_lib,math,sysUtils,optic_aberrations;
type
  xycoord=record
    x,y: Integer;
  end;
  xyzcoord=record
    x,y,z: Real;
  end;
  type Exposure_type=(et_ave,et_peak);
  TSpectator=class
    private
      _az,_al :Integer;
      raz,ral: Real;
      siaz,coaz,sial,coal: Real; //синусы и косинусы от угла места и азимута
      _fov: Real;
      _resX,_resY: Integer; //разрешение
      _resX2,_resY2: Integer; //половинное разр - для быстрого рендеринга
      ang_coef: Real; //для перевода углов небесн. свода в пиксели
      procedure change_az(a: Integer);
      procedure change_al(a: Integer);
      procedure change_fov(a: Real);
    public
      height: Real; //наша высота
      img: TBitmap;
      collib: colorimetry_funcs;
      eye: TOpticAberrations;
      X_img, Y_img, Z_img: array of array of Real;
      expos: Exposure_type;
      expo_corr: Real;
      constructor Create;
      destructor Destroy;
      procedure SetResolution(resX,resY: Integer);
      function angles2coord(aaz,aal: Real): xyzcoord;
      function coord2sphere(x,y: Integer): xyzcoord;
      procedure draw_circle(baz,bal,ang_size: Real); //нарисовать окр. в данном месте, данного размера
      procedure cls; //стереть экран
      procedure Draw_dome(at: TAtmosphere; suncord: xyzcoord); //нарисовать небо
      procedure Draw_sun_as_circle(baz,bal,ang_size: Real;col: CIE1931); //нарисовать солнышко или другое небесное тело

      procedure Exposure; //выставить экспозицию


      property az: Integer read _az write change_az;
      property al: Integer read _al write change_al;
      property fov: Real read _fov write change_fov;
      property resX: Integer read _resX;
      property resY: Integer read _resY;

  end;



implementation

constructor TSpectator.Create;
begin
  inherited Create;
  img:=TBitmap.Create;
  FOV:=pi/3;
  az:=0;
  al:=0;
  expos:=et_ave;
end;

destructor TSpectator.Destroy;
begin
  img.Free;
  inherited Destroy;
end;

procedure TSpectator.change_az(a: Integer);
begin
  _az:=a;
  raz:=a*pi/180;
  siaz:=sin(raz);
  coaz:=cos(raz);
end;

procedure TSpectator.change_al(a: Integer);
begin
  _al:=a;
  ral:=a*pi/180;
  sial:=sin(ral);
  coal:=cos(ral);
end;

procedure TSpectator.change_fov(a: Real);
begin
  if a<>0 then begin
    _fov:=a;
    ang_coef:=_resX/_FOV;
  end;
end;

procedure TSpectator.SetResolution(resX,resY: Integer);
begin
  _resX:=resX;
  _resY:=resY;
  img.Height:=resY;
  img.Width:=resX;
  SetLength(X_img,_resX,_resY);
  SetLength(Y_img,_resX,_resY);
  SetLength(Z_img,_resX,_resY);
  _resX2:=resX div 2;
  _resY2:=resY div 2;
  ang_coef:=_resX/FOV;
end;

function TSpectator.angles2coord(aaz,aal: Real): xyzcoord;
var x,y,z,c: Real;
  x1,y1 :Real;
begin
  //находим координаты на небесной сфере (единичной)
  y:=sin(aal);
  c:=cos(aal);
  x:=sin(aaz)*c;
  z:=cos(aaz)*c;
  //преобразуем к нашему полю зрения
  angles2coord.x:=x*coaz+z*siaz;//оконч. значение x
  //x1:=x*coaz+z*siaz;
  z:=-x*siaz+z*coaz; //поскольку сам x не поменялся, не нужна доп. перем

  angles2coord.y:=y*coal-z*sial; //оконч. значение y
  angles2coord.z:=y*sial+z*coal;
  //x1,y1 - новые коорд.
//  angles2coord.x:=_resX2+Round(x1*ang_coef);
//  angles2coord.y:=_resY2-Round(y*ang_coef);
end;

function TSpectator.coord2sphere(x,y: Integer): xyzcoord;
var al,be,x1,y1,z1: Real;
begin

  be:=(x-_resX2)/ang_coef; //угол в радианах
  al:=(_resY2-y)/ang_coef; //еще один угол в радианах

  x1:=cos(al)*sin(be);
  y1:=sin(al);
  z1:=cos(al)*cos(be);

(*
  x1:=sin(be);
  y1:=sin(al);
  z1:=sqrt(1-x1*x1-y1*y1);
  *)
  //точка на сфере
  //пересчитаем ее назад
  //первое преобр.
  coord2sphere.y:=y1*coal+z1*sial;
  z1:=-y1*sial+z1*coal;
  //второе преобр
  coord2sphere.x:=x1*coaz-z1*siaz;
  coord2sphere.z:=x1*siaz+z1*coaz;
end;

procedure TSpectator.draw_circle(baz,bal,ang_size: Real);
var coo: xyzcoord;
  ra,x,y: Integer;
begin
  coo:=angles2coord(baz,bal);
  if coo.z>0 then begin
    x:=_resX2+Round(arcsin(coo.x)*ang_coef);
    y:=_resY2-Round(arcsin(coo.y)*ang_coef);
    ra:=Round(ang_size*ang_coef);
    img.Canvas.Ellipse(x-ra,y-ra,x+ra,y+ra);
  end;
end;

procedure TSpectator.cls;
var i,j: Integer;
begin
  img.Canvas.Brush.Color:=clWhite;
  img.Canvas.FillRect(img.Canvas.ClipRect);
  for i:=0 to _resX-1 do
    for j:=0 to _resY-1 do begin
      X_img[i,j]:=0;
      Y_img[i,j]:=0;
      Z_img[i,j]:=0;
    end;

end;

procedure TSpectator.Draw_dome(at: TAtmosphere; suncord: xyzcoord);
var i,j: Integer;
  xyz: xyzcoord;
  xyzcol: Yxy;
  X,Z: Real;
  xi: Real;
begin
  for j:=0 to _resY-1 do begin
    for i:=0 to _resX-1 do begin
      xyz:=coord2sphere(i,j);
      if xyz.y>0 then begin
        xi:=xyz.x*suncord.x+xyz.y*suncord.y+xyz.z*suncord.z;
        assert((xi<=1) and (xi>=-1),'xi='+FloatToStr(xi)+'|xyz|='+FloatToStr(sqrt(xyz.x*xyz.x+xyz.y*xyz.y+xyz.z*xyz.z))+'|suncoord|='+FloatToStr(sqrt(suncord.x*suncord.x+suncord.y*suncord.y+suncord.z*suncord.z)));
        xi:=arccos(xi);

        xyzcol:=at.Skydome(xyz.y,xi);
        X:=xyzcol.x*xyzcol.L/xyzcol.y;
        Z:=1-xyzcol.x-xyzcol.y;
        Z:=Z*xyzcol.L/xyzcol.y;

        X_img[i,j]:=X_img[i,j]+X;
        Y_img[i,j]:=Y_img[i,j]+xyzcol.L;
        Z_img[i,j]:=Z_img[i,j]+Z;

        //color:=collib.ColorFromYxy(xyzcol.L,xyzcol.x,xyzcol.y);
        //img.Canvas.Pixels[i,j]:=color;
      end;
    end;
  end;
end;

procedure TSpectator.Exposure;
var ave: Real;
    i,j: Integer;
begin
  if expos=et_ave then begin
    ave:=0;
    for i:=0 to _resX-1 do
      for j:=0 to _resY-1 do
        ave:=ave+Y_img[i,j];
    ave:=2*ave/_resX/_resY/power(2,expo_corr); //нашли среднюю яркость
    //она будет соотв. 128, т.е серому цвету
    for i:=0 to _resX-1 do
      for j:=0 to _resY-1 do begin
        img.Canvas.Pixels[i,j]:=collib.ColorFromNormedXYZ(X_img[i,j]/ave,Y_img[i,j]/ave,Z_img[i,j]/ave);
      end;





  end
  else if expos=et_peak then begin
    ave:=0;
    for i:=0 to _resX-1 do
      for j:=0 to _resY-1 do
        if ave<Y_img[i,j] then ave:=Y_img[i,j];

    for i:=0 to _resX-1 do
      for j:=0 to _resY-1 do begin
        img.Canvas.Pixels[i,j]:=collib.ColorFromNormedXYZ(X_img[i,j]/ave,Y_img[i,j]/ave,Z_img[i,j]/ave);
      end;

  end;

end;

procedure TSpectator.Draw_sun_as_circle(baz,bal,ang_size: Real; col: CIE1931);
var coo: xyzcoord;
  ra,x,y: Integer;
  i,j,ra2,xmin,ymin,xmax,ymax: Integer;
  scattering: Real;
  sigma,sigma2,coef: Real;
  difra,arg: Integer;
begin
  coo:=angles2coord(baz,bal);
  if coo.z>0 then begin
    x:=_resX2+Round(arcsin(coo.x)*ang_coef);
    y:=_resY2-Round(arcsin(coo.y)*ang_coef);
    ra:=Round(ang_size*ang_coef/2);
//    img.Canvas.Ellipse(x-ra,y-ra,x+ra,y+ra);
    ra2:=ra*ra;
    xmin:=x-ra;
    if xmin<0 then xmin:=0;
    xmax:=x+ra;
    if xmax>=_resX then xmax:=_resX-1;
    ymin:=y-ra;
    if ymin<0 then ymin:=0;
    ymax:=y+ra;
    if ymax>=_resY then ymax:=_resY-1;

    for i:=xmin to xmax do begin
      for j:=ymin to ymax do begin
        if (i-x)*(i-x)+(j-y)*(j-y)<=ra2 then begin
          X_img[i,j]:=X_img[i,j]+col.X;
          Y_img[i,j]:=Y_img[i,j]+col.Y;
          Z_img[i,j]:=Z_img[i,j]+col.Z;
        end;
      end;
    end;
    //теперь примитивная дифракция (аппрокс. гауссовой кривой, со ср. кв=lambda/D
    sigma:=555e-6/eye.aperture*ang_coef;
    sigma2:=1/2/sigma/sigma;
    difra:=Round(sigma*20);
    xmin:=x-difra;
    if xmin<0 then xmin:=0;
    xmax:=x+difra;
    if xmax>=_resX then xmax:=_resX-1;
    ymin:=y-difra;
    if ymin<0 then ymin:=0;
    ymax:=y+difra;
    if ymax>=_resY then ymax:=_resY-1;

    for i:=xmin to xmax do begin
      for j:=ymin to ymax do begin
        arg:=round(sqrt(sqr(i-x)+sqr(j-y)))-ra;
        if arg>=0 then begin
          coef:=exp(-arg*arg*sigma2);
          X_img[i,j]:=X_img[i,j]+coef*col.X;
          Y_img[i,j]:=Y_img[i,j]+coef*col.Y;
          Z_img[i,j]:=Z_img[i,j]+coef*col.Z;
        end;
      end;
    end;




    //теперь добавляем рассеяный свет, если надо
    if (coo.x<sin(eye.block_angle_right)) and (coo.x>-sin(eye.block_angle_left)) and (coo.y<sin(eye.block_angle_top)) and (coo.y>-sin(eye.block_angle_bottom)) then begin
      scattering:=pi/4*ra*ra/_resX/_resY*eye.scattering;
      col.X:=col.X*scattering;
      col.Y:=col.Y*scattering;
      col.Z:=col.Z*scattering;
      for i:=0 to _resX-1 do
        for j:=0 to _resY-1 do begin
          X_img[i,j]:=X_img[i,j]+col.X;
          Y_img[i,j]:=Y_img[i,j]+col.Y;
          Z_img[i,j]:=Z_img[i,j]+col.Z;
        end;
    end;


  end;



end;



end.
