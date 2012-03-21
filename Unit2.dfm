object Form2: TForm2
  Left = 187
  Top = 123
  Width = 671
  Height = 349
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1072#1090#1084#1086#1089#1092#1077#1088#1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    663
    315)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 313
    Height = 121
    Caption = #1040#1090#1084#1086#1089#1092#1077#1088#1085#1072#1103' '#1084#1072#1089#1089#1072
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 110
      Height = 39
      Caption = #1060#1072#1081#1083' '#1079#1072#1074#1080#1089#1080#1084#1086#1089#1090#1080' '#1072#1090#1084'. '#1084#1072#1089#1089#1099' '#1086#1090' '#1091#1075#1083#1072' '#1082' '#1079#1077#1085#1080#1090#1091
      WordWrap = True
    end
    object lblAMFileName: TLabel
      Left = 128
      Top = 24
      Width = 177
      Height = 13
      AutoSize = False
      Caption = 'standart_relative_optical_mass.txt'
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 94
      Height = 39
      Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100' '#1072#1090#1084'. ('#1074' '#1076#1086#1083#1103#1093' '#1047#1077#1084#1085#1086#1081' '#1085#1072' '#1091#1088#1086#1074#1085#1077' '#1084#1086#1088#1103')'
      WordWrap = True
    end
    object txtAtmDensity: TEdit
      Left = 128
      Top = 72
      Width = 65
      Height = 21
      TabOrder = 0
      Text = '1'
      OnChange = txtAtmDensityChange
    end
    object btnLoadAM: TButton
      Left = 128
      Top = 40
      Width = 65
      Height = 17
      Caption = #1080#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = btnLoadAMClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 144
    Width = 313
    Height = 73
    Caption = #1043#1072#1079#1086#1074#1099#1081' '#1089#1086#1089#1090#1072#1074
    TabOrder = 1
    object txtOzoneAmount: TLabeledEdit
      Left = 224
      Top = 16
      Width = 65
      Height = 21
      EditLabel.Width = 170
      EditLabel.Height = 13
      EditLabel.Caption = #1050#1086#1083'-'#1074#1086' '#1086#1079#1086#1085#1072' ('#1074' % '#1086#1090' '#1079#1077#1084#1085#1086#1081' '#1072#1090#1084')'
      LabelPosition = lpLeft
      TabOrder = 0
      Text = '100'
      OnChange = txtOzoneAmountChange
    end
    object txtWaterAmount: TLabeledEdit
      Left = 224
      Top = 40
      Width = 65
      Height = 21
      EditLabel.Width = 216
      EditLabel.Height = 13
      EditLabel.Caption = #1050#1086#1083'-'#1074#1086' '#1074#1086#1076#1103#1085#1099#1093' '#1087#1072#1088#1086#1074' ('#1074' % '#1086#1090' '#1079#1077#1084#1085#1086#1081' '#1072#1090#1084')'
      LabelPosition = lpLeft
      TabOrder = 1
      Text = '100'
      OnChange = txtWaterAmountChange
    end
  end
  object GroupBox3: TGroupBox
    Left = 16
    Top = 224
    Width = 313
    Height = 49
    Caption = #1055#1086#1075#1086#1076#1085#1099#1077' '#1091#1089#1083#1086#1074#1080#1103
    TabOrder = 2
    object txtTurbidity: TLabeledEdit
      Left = 224
      Top = 16
      Width = 65
      Height = 21
      EditLabel.Width = 94
      EditLabel.Height = 13
      EditLabel.Caption = '"'#1047#1072#1090#1091#1084#1072#1085#1077#1085#1085#1086#1089#1090#1100'"'
      LabelPosition = lpLeft
      TabOrder = 0
      Text = '0'
      OnChange = txtTurbidityChange
    end
  end
  object Chart1: TChart
    Left = 336
    Top = 8
    Width = 321
    Height = 298
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlack
    Title.Font.Height = -11
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Text.Strings = (
      #1050#1086#1101#1092'. '#1087#1088#1086#1087#1091#1089#1082#1072#1085#1080#1103' '#1086#1090' '#1076#1083#1080#1085#1099' '#1074#1086#1083#1085#1099)
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.ExactDateTime = False
    LeftAxis.Increment = 0.100000000000000000
    LeftAxis.Maximum = 1.000000000000000000
    View3D = False
    TabOrder = 3
    Anchors = [akLeft, akTop, akRight, akBottom]
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'm=1'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Title = 'm=2'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object BitBtn1: TBitBtn
    Left = 56
    Top = 280
    Width = 81
    Height = 25
    TabOrder = 4
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 144
    Top = 280
    Width = 81
    Height = 25
    TabOrder = 5
    Kind = bkCancel
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Text files|*.txt|Data files|*.dat|All files|*.*'
    Left = 224
  end
end
