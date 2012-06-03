program Xenosky;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  atmosphere_lib in 'atmosphere_lib.pas',
  Celestial_body_lib in 'Celestial_body_lib.pas',
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {frmRender},
  Spectator_lib in 'Spectator_lib.pas',
  optic_aberrations in 'optic_aberrations.pas',
  Unit5 in 'Unit5.pas' {frmClouds},
  fractal_terrain in 'fractal_terrain.pas',
  Unit6 in 'Unit6.pas' {frmTerrain},
  Unit7 in 'Unit7.pas' {Form7},
  table_func_lib in 'table_func_lib.pas',
  colorimetry_lib in 'colorimetry_lib.pas',
  streaming_class_lib in 'streaming_class_lib.pas',
  StreamIO in 'StreamIO.pas',
  xenosky_data_class in 'xenosky_data_class.pas',
  current_working_file_info in 'current_working_file_info.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TfrmRender, frmRender);
  Application.CreateForm(TfrmClouds, frmClouds);
  Application.CreateForm(TfrmTerrain, frmTerrain);
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
