unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls,Celestial_body_lib, ExtDlgs;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    txtVMag: TLabeledEdit;
    Label1: TLabel;
    lblSpectrum: TLabel;
    Button1: TButton;
    GroupBox2: TGroupBox;
    txtName: TLabeledEdit;
    txtDescr: TMemo;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    txtAngSize: TLabeledEdit;
    Label3: TLabel;
    Button2: TButton;
    Image1: TImage;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    txtAltitude: TEdit;
    txtAzimuth: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    OpenDialog1: TOpenDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  body: TCelestialBody;
implementation

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
  body:=TCelestialBody.Create;
end;

procedure TForm3.FormDestroy(Sender: TObject);
begin
  body.Free;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  form3.Caption:='Параметры небесного тела: '+body.title;
  txtName.Text:=body.title;
  txtDescr.Text:=body.description;
  txtVMag.Text:=FloatToStr(body.vmag);
  txtAngSize.Text:=FloatToStr(body.ang_size*180/pi);
  txtAzimuth.Text:=FloatToStr(body.azimuth*180/pi);
  txtAltitude.Text:=FloatToStr(body.altitude*180/pi);
  lblSpectrum.Caption:=body.spectrum.title;
  image1.Picture.Bitmap.Assign(body.img);
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    body.spectrum.LoadFromFile(OpenDialog1.FileName);
    lblSpectrum.Caption:=body.spectrum.title;
  end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then begin
    body.img.LoadFromFile(OpenPictureDialog1.FileName);
   image1.Picture.Bitmap.Assign(body.img);
  end;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
  body.title:=txtName.Text;
  body.description:=txtDescr.Text;
  body.vmag:=StrToFloat(txtVmag.Text);
  body.altitude:=StrToFloat(txtAltitude.Text)*pi/180;
  body.azimuth:=StrToFloat(txtAzimuth.Text)*pi/180;
  body.ang_size:=StrToFloat(txtAngSize.Text)*pi/180;
end;

end.
