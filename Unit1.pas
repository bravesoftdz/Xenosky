unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2,Celestial_body_lib,table_func_lib_0_70,unit3,
  ExtCtrls,unit4, AppEvnts,atmosphere_lib, TeEngine, Series, TeeProcs,
  Chart, ComCtrls,Spectator_lib,colorimetry_lib_0_05,math,optic_aberrations,unit5,
  fractal_terrain,unit6,unit7;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    lblDensity: TLabel;
    lblTurbidity: TLabel;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    lstBodies: TListBox;
    btnAddBody: TButton;
    btnDeleteBody: TButton;
    btnEditBody: TButton;
    GroupBox3: TGroupBox;
    txtResX: TLabeledEdit;
    txtResY: TLabeledEdit;
    Button2: TButton;
    GroupBox4: TGroupBox;
    txtAzimuth: TLabeledEdit;
    txtAltitude: TLabeledEdit;
    txtFOV: TLabeledEdit;
    ApplicationEvents1: TApplicationEvents;
    CheckBox1: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Image1: TImage;
    txtHeight: TLabeledEdit;
    Button3: TButton;
    TabSheet3: TTabSheet;
    txtLog: TMemo;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox5: TGroupBox;
    txtScatter: TLabeledEdit;
    txtBlockHoriz: TLabeledEdit;
    txtBlockTop: TLabeledEdit;
    txtBlockBottom: TLabeledEdit;
    txtExpoCorr: TLabeledEdit;
    txtAperture: TLabeledEdit;
    Button4: TButton;
    Button5: TButton;
    SaveDialog1: TSaveDialog;
    Button6: TButton;
    Button7: TButton;
    OpenDialog1: TOpenDialog;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    dlgTxt: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lstBodiesClick(Sender: TObject);
    procedure btnEditBodyClick(Sender: TObject);
    procedure btnAddBodyClick(Sender: TObject);
    procedure btnDeleteBodyClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure TabSheet1Resize(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure txtAzimuthChange(Sender: TObject);
    procedure txtAltitudeChange(Sender: TObject);
    procedure txtFOVChange(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure txtScatterChange(Sender: TObject);
    procedure txtBlockHorizChange(Sender: TObject);
    procedure txtBlockTopChange(Sender: TObject);
    procedure txtBlockBottomChange(Sender: TObject);
    procedure txtExpoCorrChange(Sender: TObject);
    procedure txtApertureChange(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure txtHeightChange(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  coord=record
    x,y,z: Real;
  end;

var
  Form1: TForm1;
  bodies: array of TCelestialBody;
  at: TAtmosphere;
  use_keyboard: Boolean;
  previewer: TSpectator;
  cloudy_atm: TSpectator;
  collibs: colorimetry_funcs;
  eye: Topticaberrations;
  clouds: TFractal;
  cloud_density: Real;
  clouds_enable: boolean;

  terrain: TFractal;
  ter_type: boolean;
  diffuse_refl: Real;
  mirror_refl: Real;
  terr_sp: table_func;

  chart_spectrum: table_func;
implementation

{$R *.dfm}
(*
function coord_conversion(a: coord): coord;
begin

  coord_conversion.x:=a.x*coaz-a.z*siaz; //окончательный результат
  a.z:=a.x*siaz+a.z*coaz; //это было преобр. по азимуту
  coord_conversion.y:=a.y*coal-a.z*sial;
  coord_conversion.z:=a.y*sial+a.z*coal;

end;
*)
(*
procedure init_sico;
var raz,ral :Real;
begin
  raz:=az*pi/180;
  ral:=al*pi/180;
  siaz:=sin(raz);
  coaz:=cos(raz);
  sial:=sin(ral);
  coal:=cos(ral);
end;
*)
procedure update_atm;
begin
  with form1 do begin
    lblDensity.Caption:='отн. плотность: '+FloatToStr(at.relative_density);
    lblTurbidity.Caption:='затуманенность: '+FloatToStr(at.turbidity);
  end;
end;

procedure update_bodies_list;
var i,j: Integer;
begin
  with Form1.lstBodies do begin
    Clear;
    j:=Length(bodies)-1;
    for i:=0 to j do begin
      AddItem(bodies[i].title,bodies[i]);
    end;

    if j=-1 then begin
      form1.btnEditBody.Enabled:=false;
      form1.btnDeleteBody.Enabled:=false;
    end
    else ItemIndex:=0;

  end;


end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  atm.Assign(at);
  if Form2.ShowModal=mrOk then begin
    at.Assign(atm);
    update_atm;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  SetLength(bodies,1);
  bodies[0]:=TCelestialBody.Create;
  bodies[0].spectrum.loadFromFile('data\spectra\Solar_spectrum.txt');
  bodies[0].vmag:=-26.74;
  bodies[0].title:='Солнце';
  bodies[0].description:='Солнце нашей солнечной системы, класс G2V';
  bodies[0].azimuth:=0;
  bodies[0].altitude:=pi/2;
  bodies[0].ang_size:=0.5*pi/180;
  bodies[0].img.LoadFromFile('data\img\sun.bmp');

  update_bodies_list;
  update_atm;

  txtBlockBottomChange(Form1);
  txtBlockTopChange(Form1);
  txtBlockHorizChange(Form1);
  txtScatterChange(Form1);
  txtExpoCorrChange(Form1);
  txtApertureChange(Form1);

  cloud_density:=10;
  clouds.roughness:=0.3;
  clouds_enable:=true;

  ter_type:=false;
  diffuse_refl:=0.5;
  mirror_refl:=0.5;
  terrain.roughness:=0.3;

  txtHeightChange(Form1);

  txtAltitudeChange(Form1);
  //previewer.SetResolution(Image1.Width,Image1.Height);
end;

procedure TForm1.lstBodiesClick(Sender: TObject);
begin
  if lstBodies.ItemIndex>-1 then begin
    btnEditBody.Enabled:=true;
    btnDeleteBody.Enabled:=true;
  end;
end;

procedure TForm1.btnEditBodyClick(Sender: TObject);
begin
  body.Assign(bodies[lstBodies.itemIndex]);
  if Form3.ShowModal=mrOk then begin
    bodies[lstBodies.ItemIndex].assign(body);
    lstBodies.Items[lstBodies.ItemIndex]:=body.title;
  end;

end;

procedure TForm1.btnAddBodyClick(Sender: TObject);
var i,j: Integer;
begin
  j:=Length(bodies);
  SetLength(bodies,j+1);
  bodies[j]:=TCelestialBody.Create;
  bodies[j].title:='untitled';
  lstBodies.AddItem(bodies[j].title,bodies[j]);
  lstBodies.ItemIndex:=j;
  body.Assign(bodies[lstBodies.itemIndex]);
  if Form3.ShowModal=mrOk then begin
    bodies[lstBodies.ItemIndex].assign(body);
    lstBodies.Items[lstBodies.ItemIndex]:=body.title;
  end
  else btnDeleteBodyClick(Form1);

  //update_bodies_list;
end;

procedure TForm1.btnDeleteBodyClick(Sender: TObject);
var i,j: Integer;
begin
  i:=lstBodies.ItemIndex;
  j:=Length(bodies)-1;
  bodies[i].Free;
  while i<j do begin
    bodies[i]:=bodies[i+1];
    inc(i);
  end;
  SetLength(bodies,j);
  update_bodies_list;

end;

procedure TForm1.Button2Click(Sender: TObject);
var btmp: TBitmap;
    sp: table_func;
begin
  with frmRender do begin
    //готовим пустое изображение
    btmp:=TBitmap.Create;
    btmp.Height:=StrToInt(txtResY.Text);
    btmp.Width:=StrToInt(txtResX.Text);
    Image1.Picture.Graphic:=btmp;
    btmp.Free;
    //считаем спектры

    sp:=table_func.Create;
    sp.assign(bodies[0].spectrum);
    at.Compute_extinction(pi/2-bodies[0].altitude);
    sp.multiply(at.result_extinction);
    bodies[0].spectrum.chart_series:=series1;
    bodies[0].spectrum.draw;
    sp.chart_series:=series2;
    sp.draw;

    sp.Free;

    



//    ShowModal;



  end;

end;

procedure TForm1.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var i: Integer;
begin
  if (Msg.message=wm_keydown) and use_keyboard then begin
   //txtAzimuth.Text:=IntToStr(Msg.wParam);
  with Previewer do begin
   i:=Msg.wParam;
   if i=37 then begin
      az:=az-1;
      if az<0 then az:=az+360;
      txtAzimuth.Text:=IntToStr(az);
   end
   else if i=38 then begin
    al:=al+1;
    if al>90 then al:=90;
    txtAltitude.Text:=IntToStr(al);
    end
    else if i=39 then begin
      az:=az+1;
      if az>360 then az:=az-360;
      txtAzimuth.Text:=IntToStr(az);
      end
      else if i=40 then begin
        al:=al-1;
        if al<0 then al:=0;
        txtAltitude.Text:=IntToStr(al);
        end
    end;

   end;


end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  at:=TAtmosphere.Create;
  previewer:=TSpectator.Create;
  cloudy_atm:=TSpectator.Create;
  collibs:=colorimetry_funcs.Create;
  previewer.collib:=collibs;
  cloudy_atm.collib:=collibs;
  use_keyboard:=true;
  eye:=TOpticAberrations.Create;
  previewer.eye:=eye;
  clouds:=TFractal.Create;
  terrain:=TFractal.Create;
  terr_sp:=table_func.Create;

  chart_spectrum:=table_func.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  at.Free;
  previewer.Free;
  cloudy_atm.Free;
  collibs.Free;
  eye.Free;
  clouds.Free;
  terrain.Free;
  terr_sp.Free;

  chart_spectrum.Free;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  use_keyboard:=CheckBox1.Checked;
end;

procedure TForm1.TabSheet1Resize(Sender: TObject);
begin
  previewer.SetResolution(Image1.Width,Image1.Height);
end;

procedure TForm1.Button3Click(Sender: TObject);
var i,j: Integer;
    sp,sp1: table_func;
    col: TColor;
    lum0,lum_coef,lum1: Real;
    sun_coord: xyzcoord;
    xyz: CIE1931;
    x,y,k: Real;
    push_turb: Real;
    xyzc,norm: xyzcoord;
    xcros,zcros: Real;
    xint,zint: Integer;
    tmp: Integer;
    atm_disturb: Real;

begin
  atm_disturb:=pi/180/3600; //одна угловая секунда

  txtLog.Clear;
  txtLog.Lines.Add('Предварительный просмотр');
  if lstBodies.itemIndex>-1 then
    chart1.Title.Text.Text:='Спектры для небесного тела '+lstBodies.Items[lstBodies.itemIndex]
  else
    chart1.Title.Text.Clear;
  Series1.Clear;
  Series2.Clear;
  sp:=table_func.Create;
  sp1:=table_func.Create;
  previewer.cls;


  //коррекция модели атмосферы для данного конкретного светила
  //previewer - изображает нашу атмосферу
  //cloudy_atm - временный объект, где строится атмосфера, полностью покрытая облаками
  //затем они смешиваются друг с другом
  //at - общая для них модель атмосферы
  j:=Length(bodies)-1;
  for i:=0 to j do begin
    xyz:=collibs.Spectrum2XYZ(bodies[i].spectrum);
    x:=xyz.X/(xyz.X+xyz.Y+xyz.Z);
    y:=xyz.Y/(xyz.X+xyz.Y+xyz.Z);
    at.Compute_skydome_model(pi/2-bodies[i].altitude,bodies[i].vmag,x,y);
    sun_coord.y:=sin(bodies[i].altitude);
    sun_coord.x:=cos(bodies[i].altitude)*sin(bodies[i].azimuth);
    sun_coord.z:=cos(bodies[i].altitude)*cos(bodies[i].azimuth);
  //ща построим небо.
    previewer.Draw_dome(at,sun_coord);
  end;

  if clouds_enable then begin
    //а сейчас - построим облачное небо, чтобы потом совместить их
    cloudy_atm.SetResolution(image1.Width,image1.Height);
    cloudy_atm.cls;
    push_turb:=at.turbidity;
    at.turbidity:=cloud_density;
    cloudy_atm.height:=previewer.height;
    cloudy_atm.expos:=previewer.expos;
    cloudy_atm.expo_corr:=previewer.expo_corr;
    cloudy_atm.az:=previewer.az;
    cloudy_atm.al:=previewer.al;
    cloudy_atm.fov:=previewer.fov;

    for i:=0 to j do begin
      xyz:=collibs.Spectrum2XYZ(bodies[i].spectrum);
      x:=xyz.X/(xyz.X+xyz.Y+xyz.Z);
      y:=xyz.Y/(xyz.X+xyz.Y+xyz.Z);
      at.Compute_skydome_model(pi/2-bodies[i].altitude,bodies[i].vmag,x,y);
      sun_coord.y:=sin(bodies[i].altitude);
      sun_coord.x:=cos(bodies[i].altitude)*sin(bodies[i].azimuth);
      sun_coord.z:=cos(bodies[i].altitude)*cos(bodies[i].azimuth);
    //ща построим небо.
      cloudy_atm.Draw_dome(at,sun_coord);
    end;

    //осталось построить фрактальную маску, по которой эти картинки объединятся
    clouds.SetResolution(image1.Width,image1.Height);
    clouds.generate;

    for i:=0 to previewer.resX-1 do begin
      for j:=0 to previewer.resY-1 do begin
        k:=clouds.points[i,j];
        if k<0 then k:=0;
        if k>1 then k:=1;
        previewer.X_img[i,j]:=previewer.X_img[i,j]*(1-k)+cloudy_atm.X_img[i,j]*k;
        previewer.Y_img[i,j]:=previewer.Y_img[i,j]*(1-k)+cloudy_atm.Y_img[i,j]*k;
        previewer.Z_img[i,j]:=previewer.Z_img[i,j]*(1-k)+cloudy_atm.Z_img[i,j]*k;
      end;
    end;
    at.turbidity:=push_turb;

    end;


  j:=Length(bodies)-1;
  for i:=0 to j do begin
    txtLog.Lines.Add('Считаем спектры для небесного тела: '+bodies[i].title);
    txtLog.Lines.Add('Его зв. величина: '+ FloatToStr(bodies[i].vmag));
    lum0:=3e-6*power(2.51,-bodies[i].vmag);
    txtLog.Lines.Add('Освещенность за пределами атмосферы: '+FloatToStr(lum0)+' лк');
    txtLog.Lines.Add('Яркость за пределами атмосферы: '+FloatToStr(lum0/2/pi/1000/(1-cos((bodies[i].ang_size+atm_disturb)/2)))+' ккд/м^2');

    sp1.assign(bodies[i].spectrum);
    sp1.multiply(collibs.yt);
    lum_coef:=lum0/sp1.integrate;



    chart_spectrum.assign(bodies[i].spectrum);
    chart_spectrum.normalize;
    //спектр за пределами атмосферы
    if i=lstBodies.ItemIndex then begin
      chart_spectrum.chart_series:=Series1;
      chart_spectrum.draw;
    end;
    at.Compute_extinction(pi/2-bodies[i].altitude);
    chart_spectrum.multiply(at.result_extinction);
    if i=lstBodies.ItemIndex then begin
      chart_spectrum.chart_series:=Series2;
      chart_spectrum.draw;
    end;


    //вот он, вот он: спектр!
    //теперь надо превратить его в цвет
    //без библиотеки фотометрии не обойтись!
    (*
    col:=collibs.ColorFromSpectrum(sp);
    previewer.img.Canvas.Brush.Color:=col;
    previewer.draw_circle(bodies[i].azimuth,bodies[i].altitude,bodies[i].ang_size);
*)

    sp.assign(bodies[i].spectrum);
    sp.multiply(at.result_extinction);
    xyz:=collibs.Spectrum2XYZ(sp);

    //посчитаем итоговую освещенность
    sp.multiply(collibs.yt);
    lum1:=lum_coef*sp.integrate;
    txtLog.Lines.Add('Освещенность у поверхности Земли: '+FloatToStr(lum1)+' лк');
    lum1:=lum1/2/pi/1000/(1-cos((bodies[i].ang_size+atm_disturb)/2));
    txtLog.Lines.Add('Яркость у поверхности Земли: '+FloatToStr(lum1)+' ккд/м^2');
    xyz.X:=xyz.X*lum1/xyz.Y;
    xyz.Z:=xyz.Z*lum1/xyz.Y;
    xyz.Y:=lum1;

    previewer.Draw_sun_as_circle(bodies[i].azimuth,bodies[i].altitude,bodies[i].ang_size,xyz);

  end;

(*
    //теперь ландшафт
  terrain.SetResolution(image1.Width,image1.Width);
  terrain.generate;
  xyz:=collibs.Spectrum2XYZ(terr_sp);
  for i:=0 to previewer.resX do begin
    for j:=0 to previewer.resY do begin
       xyzc:=previewer.coord2sphere(i,j);
       if xyzc.y<0 then begin
        //собственно, это и есть наш вектор луча
        //ищем его пересечение с плоскостью y=0
        xcros:=image1.Width/2-xyzc.x/xyzc.y*previewer.height;
        zcros:=-xyzc.z/xyzc.y*previewer.height;
        //масштабируем как-то
        //пока вообще никак
        xint:=round(xcros);
        zint:=round(zcros);
        if xint<0 then xint:=0;
        if xint>image1.Width then xint:=image1.Width;
        if zint<0 then zint:=0;
        if zint>image1.Width then zint:=image1.Width;
        //надо бы сделать диффузное и напр. отр.
        //диффузное для начала
        norm.x:=terrain.points[xint+1,zint+1]-terrain.points[xint,zint+1];
        norm.y:=1;
        norm.z:=terrain.points[xint,zint+1]-terrain.points[xint,zint];

        xcros:=(norm.x*sun_coord.x+norm.y*sun_coord.y+norm.z*sun_coord.z)*diffuse_refl;
        previewer.X_img[i,j]:=xyz.X*xcros;
//        previewer.Y_img[i,j]:=xyz.Y*xcros;
//        previewer.Z_img[i,j]:=xyz.Z*xcros;

       end;
    end;
  end;

*)


  previewer.Exposure;
  Image1.Picture.Graphic:=previewer.img;


end;

procedure TForm1.txtAzimuthChange(Sender: TObject);
var n: Integer;
begin
  if TryStrToInt(txtAzimuth.Text,n) then previewer.az:=n;
end;

procedure TForm1.txtAltitudeChange(Sender: TObject);
var n: Integer;
begin
  if TryStrToInt(txtAltitude.Text,n) then previewer.al:=n;
end;

procedure TForm1.txtFOVChange(Sender: TObject);
var a: Extended;
begin
  if TryStrToFloat(txtFOV.Text,a) then previewer.fov:=pi/180*a;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  previewer.expos:=et_peak;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  previewer.expos:=et_ave;
end;

procedure TForm1.txtScatterChange(Sender: TObject);
var n: Extended;
begin
  if TryStrToFloat(txtScatter.Text,n) then eye.scattering:=n;
end;

procedure TForm1.txtBlockHorizChange(Sender: TObject);
var n: Integer;
begin
  if TryStrToInt(txtBlockHoriz.Text,n) then begin
    eye.block_angle_right:=pi/180*n;
    eye.block_angle_left:=eye.block_angle_right;
  end;
end;

procedure TForm1.txtBlockTopChange(Sender: TObject);
var n: Integer;
begin
  if TryStrToInt(txtBlockTop.Text,n) then eye.block_angle_top:=pi/180*n;
end;

procedure TForm1.txtBlockBottomChange(Sender: TObject);
var n: Integer;
begin
  if TryStrToInt(txtBlockBottom.Text,n) then eye.block_angle_bottom:=pi/180*n;
end;

procedure TForm1.txtExpoCorrChange(Sender: TObject);
var x: Extended;
begin
  if TryStrToFloat(txtExpoCorr.Text,x) then previewer.expo_corr:=x;
end;

procedure TForm1.txtApertureChange(Sender: TObject);
var x: Extended;
begin
  if TryStrToFloat(txtAperture.Text,x) then eye.aperture:=x;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  frmClouds.txtRoughness.Text:=FloatToStr(clouds.roughness);
  frmClouds.txtDensity.Text:=FloatToStr(cloud_density);
  frmClouds.chkCloudEnable.Checked:=clouds_enable;
  if frmClouds.ShowModal=mrOk then begin
    clouds.roughness:=StrToFloat(frmClouds.txtRoughness.Text);
    cloud_density:=StrToFloat(frmClouds.txtDensity.Text);
    clouds_enable:=frmClouds.chkCloudEnable.Checked;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    Image1.Picture.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  frmTerrain.RadioButton2.Checked:=ter_type;
  frmTerrain.txtSmoothness.Text:=FloatToStr(terrain.roughness);
  frmTerrain.txtDiffuse.Text:=FloatToStr(diffuse_refl);
  frmTerrain.txtMirror.Text:=FloatToStr(mirror_refl);
  if frmTerrain.ShowModal=mrOk then begin
    ter_type:=frmTerrain.RadioButton2.Checked;
    terrain.roughness:=StrToFloat(frmTerrain.txtSmoothness.Text);
    diffuse_refl:=StrToFloat(frmTerrain.txtDiffuse.Text);
    mirror_refl:=StrToFloat(frmTerrain.txtMirror.Text);
  end;
end;

procedure TForm1.txtHeightChange(Sender: TObject);
var x: Extended;
begin
  if TryStrToFloat(txtHeight.Text,x) then previewer.height:=x;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    terr_sp.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  form7.ShowModal;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    Chart1.SaveToBitmapFile(SaveDialog1.FileName);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  if dlgTxt.Execute then
    chart_spectrum.SaveToFile(dlgTxt.FileName);

end;

end.
