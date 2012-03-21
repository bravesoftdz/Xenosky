unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,atmosphere_lib, StdCtrls, ExtCtrls, TeeProcs, TeEngine, Chart,
  Series, Buttons;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    lblAMFileName: TLabel;
    Label2: TLabel;
    txtAtmDensity: TEdit;
    btnLoadAM: TButton;
    OpenDialog1: TOpenDialog;
    GroupBox2: TGroupBox;
    txtOzoneAmount: TLabeledEdit;
    txtWaterAmount: TLabeledEdit;
    GroupBox3: TGroupBox;
    txtTurbidity: TLabeledEdit;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnLoadAMClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtAtmDensityChange(Sender: TObject);
    procedure txtOzoneAmountChange(Sender: TObject);
    procedure txtWaterAmountChange(Sender: TObject);
    procedure txtTurbidityChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  atm: TAtmosphere;
implementation

{$R *.dfm}
procedure redraw_graph;
begin
  atm.result_extinction.chart_series:=form2.Series1;
  atm.Compute_extinction(0);
  atm.result_extinction.draw;
  atm.result_extinction.chart_series:=form2.Series2;
  atm.Compute_extinction(pi/3);
  atm.result_extinction.draw;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  atm:=TAtmosphere.Create;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  atm.Free;
end;

procedure TForm2.btnLoadAMClick(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    atm.optical_mass_filename:=OpenDialog1.FileName;
    atm.relative_optical_mass.LoadFromFile(atm.optical_mass_filename);
    lblAMFileName.Caption:=ExtractFileName(atm.optical_mass_filename);
    redraw_graph;
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  lblAMFileName.Caption:=ExtractFileName(atm.optical_mass_filename);
  txtAtmDensity.Text:=FloatToStr(atm.relative_density);
  txtOzoneAmount.Text:=FloatToStr(atm.ozone_amount/0.35*100);
  txtWaterAmount.Text:=FloatToStr(atm.water_vapour_amount/2*100);
  txtTurbidity.Text:=FloatToStr(atm.turbidity);
  redraw_graph;
end;

procedure TForm2.txtAtmDensityChange(Sender: TObject);
var res: Extended;
begin
  if TryStrToFloat(txtAtmDensity.Text,res) then begin
    atm.relative_density:=res;
    redraw_graph;
  end;
end;

procedure TForm2.txtOzoneAmountChange(Sender: TObject);
var res: Extended;
begin
  if TryStrToFloat(txtOzoneAmount.Text,res) then begin
    atm.ozone_amount:=0.35*res/100;
    redraw_graph;
  end;
end;

procedure TForm2.txtWaterAmountChange(Sender: TObject);
var res: Extended;
begin
  if TryStrToFloat(txtWaterAmount.Text,res) then begin
    atm.water_vapour_amount:=2*res/100;
    redraw_graph;
  end;
end;

procedure TForm2.txtTurbidityChange(Sender: TObject);
var res: Extended;
begin
  if TryStrToFloat(txtTurbidity.Text,res) then begin
    atm.turbidity:=res;
    redraw_graph;
  end;
end;

end.
