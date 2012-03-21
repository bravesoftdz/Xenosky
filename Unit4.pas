unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ExtDlgs, StdCtrls;

type
  TfrmRender = class(TForm)
    Button1: TButton;
    SavePictureDialog1: TSavePictureDialog;
    ScrollBox1: TScrollBox;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRender: TfrmRender;

implementation

{$R *.dfm}

end.
