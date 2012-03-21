unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmClouds = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    txtRoughness: TLabeledEdit;
    txtDensity: TLabeledEdit;
    chkCloudEnable: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClouds: TfrmClouds;

implementation

{$R *.dfm}

end.
