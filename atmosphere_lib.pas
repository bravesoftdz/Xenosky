unit atmosphere_lib;

interface
uses math,table_func_lib,classes,streaming_class_lib;
type
Yxy=record
  L,x,y: Real;
end;
(*
TAbstractAtmosphere=class(stremingClass)
  public
*)
//TAtmosphere=class(streamingClass)
TAtmosphere=class(TPersistent)
  private
    // эмпирическа€ модель земной атмосферы от A. J. Preetham Peter Shirley Brian Smits
    //University of Utah
    //к сожалению, подогнана конкретно к земной атмосфере под нашим —олнцем. ƒл€ других планет может выдавать полнейший бред
      Al,Bl,Cl,Dl,El: Real; //коэф. дл€ распределени€ €ркости
      Ax,Bx,Cx,Dx,Ex: Real; //компонент цвета x
      Ay,By,Cy,Dy,Ey: Real; //компонент цвета y
      Lz,xz,yz: Real; //€ркость и цветность в зените

      Fl0,Fx0,Fy0 :Real;

//      x_matrix, y_matrix: array [1..4,1..3] of Real;
      function Fl(costheta,xi: Real): Real;
      function Fx(costheta,xi: Real): Real;
      function Fy(costheta,xi: Real): Real;

  public
    optical_mass_filename: string;
    relative_optical_mass: table_func;
    turbidity: Real; //затуманенность
    relative_density: Real; //плотность отн. «емной атм.
    ozone_absorb,mixed_gases_absorb,water_vapor_absorb: table_func; //поглощение разными газами

    ozone_amount,water_vapour_amount :Real;

    result_extinction: table_func;
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure Compute_extinction(angle: Real);
    procedure Compute_skydome_model(angle: Real; vmag: Real; x: Real; y: Real);
    function Skydome(costheta,xi: Real): Yxy; 
end;

var
   x_matrix: array [1..3,1..4] of Real =
   ((0.00166, -0.00375, 0.00209, 0),
    (-0.02903, 0.06377, -0.03202, 0.00394),
     (0.11693, -0.21196, 0.06052, 0.25886));

    y_matrix: array [1..3,1..4] of Real =
    ((0.00275, -0.00610, 0.00317, 0),
      (-0.04214, 0.08970, -0.04153, 0.00516),
      (0.15346, -0.26756, 0.06670, 0.26688));



implementation

constructor TAtmosphere.Create;
begin
  Inherited Create;
  optical_mass_filename:='data\relative_optical_mass\standart_relative_optical_mass.txt';
  relative_optical_mass:=table_func.Create(optical_mass_filename);
  turbidity:=2; //€сна€ погода
  relative_density:=1; //точь в точь как на «емле
  ozone_amount:=0.35;
  water_vapour_amount:=2;
  ozone_absorb:=table_func.Create('data\absorption\ozone_absorption.txt');
  mixed_gases_absorb:=table_func.Create('data\absorption\mixed_gases_absorption.txt');
  water_vapor_absorb:=table_func.Create('data\absorption\water_vapour_absorption.txt');

  result_extinction:=table_func.Create;
  result_extinction.order:=1;


end;


destructor TAtmosphere.Destroy;
begin
  relative_optical_mass.Free;
  result_extinction.Free;
  ozone_absorb.Free;
  mixed_gases_absorb.Free;
  water_vapor_absorb.Free;
  Inherited Destroy;
end;

procedure TAtmosphere.Assign(Source: TPersistent);
var t: TAtmosphere;
begin
  if Source is TAtmosphere then begin
    t:=TAtmosphere(Source);
    optical_mass_filename:=t.optical_mass_filename;
    relative_optical_mass.assign(t.relative_optical_mass);
    turbidity:=t.turbidity;
    relative_density:=t.relative_density;
    ozone_absorb.assign(t.ozone_absorb);
    water_vapor_absorb.assign(t.water_vapor_absorb);
    mixed_gases_absorb.assign(t.mixed_gases_absorb);
    ozone_amount:=t.ozone_amount;
    water_vapour_amount:=t.water_vapour_amount;
  end
  else Inherited Assign(Source);

end;



procedure TAtmosphere.Compute_extinction(angle: Real);
var arg: Real; //показатель экспоненты
    lambda: Real; //длина волны
    beta,m: Real; //затуманенность дл€ закона јнгстрЄма и воздушна€ масса
    w_w,vg,tmp1: Real;
begin
  beta:=0.04608*turbidity-0.04586;
  m:=relative_density*relative_optical_mass[angle];
  result_extinction.Clear;
  lambda:=0.780;
  while lambda>0.380 do begin
    //начнем с –елеевского рассе€ни€
    arg:=-0.008735*m/power(lambda,4.08);
    //теперь рассе€ние јнгстрЄма, завис€щее от "затуманенности"
    arg:=arg-beta*m/power(lambda,1.3);
    //поглощение озоном
    arg:=arg-ozone_absorb[lambda*1000]*m*ozone_amount;
    //поглощение капельками воды
    w_w:=water_vapor_absorb[lambda*1000]*water_vapour_amount*m;
    tmp1:=1+20.07*w_w;
    w_w:=-0.2385*w_w/power(tmp1,0.45);
    arg:=arg+w_w;
    //поглощение другими газами
    vg:=mixed_gases_absorb[lambda*1000]*m;
    tmp1:=1+118.93*vg;
    vg:=-1.41*vg/power(tmp1,0.45);
    arg:=arg+vg;
    //уфф.
    result_extinction.addpoint(round(lambda*1000),exp(arg));
    lambda:=lambda-0.001;
  end;
end;

procedure TAtmosphere.Compute_skydome_model(angle: Real; vmag: Real; x: Real; y: Real);
var T,xi: Real;
    i,j: Integer;
    arxi: array [1..4] of Real;
    arT: array [1..3] of Real;
begin
  T:=turbidity;
  Al:=0.1787*T-1.4630;
  Bl:=-0.3554*T+0.4275;
  Cl:=-0.0227*T+5.3251;
  Dl:=0.1206*T-2.5771;
  El:=-0.0670*T+0.3703;

  Ax:=-0.0193*T-0.2592;
  Bx:=-0.0665*T+0.0008;
  Cx:=-0.0004*T+0.2125;
  Dx:=-0.0641*T-0.8989;
  Ex:=-0.0033*T+0.0452;

  Ay:=-0.0167*T-0.2608;
  By:=-0.0950*T+0.0092;
  Cy:=-0.0079*T+0.2102;
  Dy:=-0.0441*T-1.6537;
  Ey:=-0.0109*T+0.0529;

  xi:=(4/9-T/120)*(pi-2*angle);
  Lz:=((4.0453*T-4.9710)*tan(xi)-0.2155*T+2.4192)*relative_density/power(2.51,(vmag+26.74)); //€ркость в килоканделах на кв. метр
  //не мудрству€ лукаво, будем считать, что при более разреженной атмосфере ее €ркость тупо упадет, а цвет останетс€ тем же
  arxi[4]:=1;
  for i:=3 downto 1 do
    arxi[i]:=arxi[i+1]*angle;

  arT[3]:=1;
  for i:=2 downto 1 do
    arT[i]:=arT[i+1]*T;

    xz:=0;
    yz:=0;
  for i:=1 to 3 do begin
    for j:=1 to 4 do begin
      xz:=xz+arxi[j]*arT[i]*x_matrix[i,j];
      yz:=yz+arxi[j]*arT[i]*y_matrix[i,j];
    end;
  end;

  xz:=xz*x/0.317; //некий костыль, чтобы моделировать другие спектр. классы
  yz:=yz*y/0.326; //очень грубо, но иначе надо вообще всю эту модель выкидывать, считать самосто€тельно
  //мне очень, очень стыдно :((

  Fl0:=Fl(1,angle);
  Fx0:=Fx(1,angle);
  Fy0:=Fy(1,angle);

  //итак, вроде посчитали все коэф.

end;

function TAtmosphere.Fl(costheta,xi: Real): Real;
begin
  Fl:=(1+Al*exp(Bl/costheta))*(1+Cl*exp(Dl*xi)+El*cos(xi)*cos(xi));
end;

function TAtmosphere.Fx(costheta,xi: Real): Real;
begin
  Fx:=(1+Ax*exp(Bx/costheta))*(1+Cx*exp(Dx*xi)+Ex*cos(xi)*cos(xi));
end;

function TAtmosphere.Fy(costheta,xi: Real): Real;
begin
  Fy:=(1+Ay*exp(By/costheta))*(1+Cy*exp(Dy*xi)+Ey*cos(xi)*cos(xi));
end;

function TAtmosphere.Skydome(costheta,xi: Real): Yxy;
begin
  Skydome.L:=Lz*Fl(costheta,xi)/Fl0;
  Skydome.x:=xz*Fx(costheta,xi)/Fx0;
  Skydome.y:=yz*Fy(costheta,xi)/Fy0;
end;

end.
