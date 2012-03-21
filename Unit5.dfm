object frmClouds: TfrmClouds
  Left = 468
  Top = 349
  BorderStyle = bsSingle
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1086#1073#1083#1072#1082#1086#1074
  ClientHeight = 125
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 16
    Top = 96
    Width = 73
    Height = 25
    TabOrder = 0
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 96
    Top = 96
    Width = 73
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object txtRoughness: TLabeledEdit
    Left = 216
    Top = 32
    Width = 57
    Height = 21
    EditLabel.Width = 211
    EditLabel.Height = 13
    EditLabel.Caption = #1075#1083#1072#1076#1082#1086#1089#1090#1100' ('#1095#1077#1084' '#1084#1077#1085#1100#1096#1077', '#1090#1077#1084' '#1080#1079#1088#1077#1079#1072#1085#1085#1077#1077')'
    LabelPosition = lpLeft
    TabOrder = 2
    Text = '1'
  end
  object txtDensity: TLabeledEdit
    Left = 216
    Top = 56
    Width = 57
    Height = 21
    EditLabel.Width = 97
    EditLabel.Height = 13
    EditLabel.Caption = #1075#1091#1089#1090#1086#1090#1072' ('#1086#1090' 2 '#1076#1086' 20)'
    LabelPosition = lpLeft
    TabOrder = 3
    Text = '10'
  end
  object chkCloudEnable: TCheckBox
    Left = 8
    Top = 8
    Width = 137
    Height = 17
    Caption = #1056#1080#1089#1086#1074#1072#1090#1100' '#1086#1073#1083#1072#1082#1072
    TabOrder = 4
  end
end
