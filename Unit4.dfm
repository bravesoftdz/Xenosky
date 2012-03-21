object frmRender: TfrmRender
  Left = 252
  Top = 267
  Width = 395
  Height = 295
  Caption = #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  DesignSize = (
    387
    261)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 65
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
  end
  object ScrollBox1: TScrollBox
    Left = 8
    Top = 40
    Width = 377
    Height = 217
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 373
      Height = 213
      AutoSize = True
    end
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = 'bmp'
    Left = 88
    Top = 8
  end
end
