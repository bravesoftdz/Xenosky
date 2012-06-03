object Form3: TForm3
  Left = 167
  Top = 139
  Width = 472
  Height = 375
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1085#1077#1073#1077#1089#1085#1086#1075#1086' '#1090#1077#1083#1072
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
    464
    341)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 128
    Width = 177
    Height = 89
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1080#1079#1083#1091#1095#1077#1085#1080#1103
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 76
      Height = 13
      Caption = #1060#1072#1081#1083' '#1089#1087#1077#1082#1090#1088#1072':'
    end
    object lblSpectrum: TLabel
      Left = 8
      Top = 64
      Width = 55
      Height = 13
      Caption = 'lblSpectrum'
    end
    object txtVMag: TLabeledEdit
      Left = 112
      Top = 16
      Width = 57
      Height = 21
      EditLabel.Width = 99
      EditLabel.Height = 13
      EditLabel.Caption = #1047#1074#1077#1079#1076#1085#1072#1103' '#1074#1077#1083#1080#1095#1080#1085#1072
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object Button1: TButton
      Left = 96
      Top = 48
      Width = 73
      Height = 17
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 177
    Height = 121
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 50
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object txtName: TLabeledEdit
      Left = 56
      Top = 16
      Width = 113
      Height = 21
      EditLabel.Width = 50
      EditLabel.Height = 13
      EditLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object txtDescr: TMemo
      Left = 8
      Top = 64
      Width = 161
      Height = 49
      Lines.Strings = (
        'txtDescr')
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 192
    Top = 8
    Width = 265
    Height = 329
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1042#1080#1076' '#1089' '#1087#1083#1072#1085#1077#1090#1099
    TabOrder = 2
    DesignSize = (
      265
      329)
    object Label3: TLabel
      Left = 8
      Top = 56
      Width = 73
      Height = 13
      Caption = #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077':'
    end
    object Image1: TImage
      Left = 8
      Top = 80
      Width = 249
      Height = 241
      Anchors = [akLeft, akTop, akRight, akBottom]
    end
    object txtAngSize: TLabeledEdit
      Left = 88
      Top = 24
      Width = 81
      Height = 21
      EditLabel.Width = 84
      EditLabel.Height = 13
      EditLabel.Caption = #1059#1075#1083#1086#1074#1086#1081' '#1088#1072#1079#1084#1077#1088
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object Button2: TButton
      Left = 96
      Top = 56
      Width = 73
      Height = 17
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 224
    Width = 177
    Height = 81
    Caption = #1055#1086#1083#1086#1078#1077#1085#1080#1077' '#1085#1072' '#1085#1077#1073#1086#1089#1074#1086#1076#1077
    TabOrder = 3
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 92
      Height = 26
      Caption = #1059#1075#1086#1083' '#1085#1072#1076' '#1075#1086#1088#1080#1079#1086#1085#1090#1086#1084' ('#1075#1088#1072#1076')'
      WordWrap = True
    end
    object txtAltitude: TEdit
      Left = 112
      Top = 24
      Width = 57
      Height = 21
      TabOrder = 0
      Text = 'txtAltitude'
    end
    object txtAzimuth: TLabeledEdit
      Left = 112
      Top = 48
      Width = 57
      Height = 21
      EditLabel.Width = 69
      EditLabel.Height = 13
      EditLabel.Caption = #1040#1079#1080#1084#1091#1090' ('#1075#1088#1072#1076')'
      LabelPosition = lpLeft
      TabOrder = 1
    end
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 312
    Width = 81
    Height = 25
    TabOrder = 4
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 104
    Top = 312
    Width = 73
    Height = 25
    TabOrder = 5
    Kind = bkCancel
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Text files|*.txt|Data files|*.dat|All files|*.*'
    Left = 160
    Top = 8
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 128
    Top = 8
  end
end
