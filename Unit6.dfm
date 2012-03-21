object frmTerrain: TfrmTerrain
  Left = 305
  Top = 247
  BorderStyle = bsSingle
  Caption = #1052#1077#1089#1090#1085#1086#1089#1090#1100
  ClientHeight = 114
  ClientWidth = 311
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
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 97
    Height = 57
    Caption = #1058#1080#1087
    TabOrder = 0
  end
  object RadioButton1: TRadioButton
    Left = 16
    Top = 24
    Width = 81
    Height = 17
    Caption = #1042#1086#1076#1072
    Checked = True
    TabOrder = 1
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 16
    Top = 40
    Width = 73
    Height = 17
    Caption = #1047#1077#1084#1083#1103
    TabOrder = 2
  end
  object txtSmoothness: TLabeledEdit
    Left = 264
    Top = 8
    Width = 41
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = #1075#1083#1072#1076#1082#1086#1089#1090#1100
    LabelPosition = lpLeft
    TabOrder = 3
  end
  object txtDiffuse: TLabeledEdit
    Left = 264
    Top = 32
    Width = 41
    Height = 21
    EditLabel.Width = 115
    EditLabel.Height = 13
    EditLabel.Caption = #1076#1080#1092#1092#1091#1079#1085#1086#1077' '#1086#1090#1088#1072#1078#1077#1085#1080#1077
    LabelPosition = lpLeft
    TabOrder = 4
  end
  object txtMirror: TLabeledEdit
    Left = 264
    Top = 56
    Width = 41
    Height = 21
    EditLabel.Width = 132
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1085#1086#1077' '#1086#1090#1088#1072#1078#1077#1085#1080#1077
    LabelPosition = lpLeft
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 80
    Width = 65
    Height = 25
    TabOrder = 6
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 80
    Top = 80
    Width = 73
    Height = 25
    TabOrder = 7
    Kind = bkCancel
  end
end
