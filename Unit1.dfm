object Form1: TForm1
  Left = 237
  Top = 298
  Width = 870
  Height = 638
  Caption = 'Xenosky v. 0.33 - '#1075#1077#1085#1077#1088#1072#1090#1086#1088' '#1080#1085#1086#1087#1083#1072#1085#1077#1090#1085#1086#1075#1086' '#1085#1077#1073#1072
  Color = clBtnFace
  Constraints.MinHeight = 638
  Constraints.MinWidth = 850
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
    862
    604)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 144
    Top = 8
    Width = 145
    Height = 161
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1072#1090#1084#1086#1089#1092#1077#1088#1099
    TabOrder = 0
    object lblDensity: TLabel
      Left = 8
      Top = 16
      Width = 45
      Height = 13
      Caption = 'lblDensity'
    end
    object lblTurbidity: TLabel
      Left = 8
      Top = 32
      Width = 50
      Height = 13
      Caption = 'lblTurbidity'
    end
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 9
      Height = 13
      Caption = '...'
    end
    object Button1: TButton
      Left = 8
      Top = 112
      Width = 81
      Height = 17
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button4: TButton
      Left = 8
      Top = 136
      Width = 57
      Height = 17
      Caption = #1054#1073#1083#1072#1082#1072
      TabOrder = 1
      OnClick = Button4Click
    end
    object Button6: TButton
      Left = 72
      Top = 136
      Width = 57
      Height = 17
      Caption = #1052#1077#1089#1090#1085#1086#1089#1090#1100
      TabOrder = 2
      Visible = False
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 80
      Top = 88
      Width = 57
      Height = 17
      Caption = #1057#1087'. '#1079#1077#1084#1083#1080
      TabOrder = 3
      Visible = False
      OnClick = Button7Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 129
    Height = 161
    Caption = #1053#1077#1073#1077#1089#1085#1099#1077' '#1090#1077#1083#1072
    TabOrder = 1
    object lstBodies: TListBox
      Left = 8
      Top = 24
      Width = 113
      Height = 57
      ItemHeight = 13
      TabOrder = 0
      OnClick = lstBodiesClick
    end
    object btnAddBody: TButton
      Left = 8
      Top = 88
      Width = 105
      Height = 17
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 1
      OnClick = btnAddBodyClick
    end
    object btnDeleteBody: TButton
      Left = 8
      Top = 112
      Width = 105
      Height = 17
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
      OnClick = btnDeleteBodyClick
    end
    object btnEditBody: TButton
      Left = 8
      Top = 136
      Width = 105
      Height = 17
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 3
      OnClick = btnEditBodyClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 640
    Top = 8
    Width = 161
    Height = 129
    Caption = #1056#1077#1085#1076#1077#1088#1080#1085#1075
    TabOrder = 2
    object txtResX: TLabeledEdit
      Left = 104
      Top = 16
      Width = 49
      Height = 21
      EditLabel.Width = 96
      EditLabel.Height = 13
      EditLabel.Caption = #1064#1080#1088#1080#1085#1072' ('#1087#1080#1082#1089#1077#1083#1077#1081')'
      LabelPosition = lpLeft
      TabOrder = 0
      Text = '1024'
      Visible = False
    end
    object txtResY: TLabeledEdit
      Left = 104
      Top = 40
      Width = 49
      Height = 21
      EditLabel.Width = 95
      EditLabel.Height = 13
      EditLabel.Caption = #1042#1099#1089#1086#1090#1072' ('#1087#1080#1082#1089#1077#1083#1077#1081')'
      LabelPosition = lpLeft
      TabOrder = 1
      Text = '768'
      Visible = False
    end
    object Button2: TButton
      Left = 88
      Top = 96
      Width = 65
      Height = 25
      Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100
      TabOrder = 2
      Visible = False
      OnClick = Button2Click
    end
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 64
      Width = 145
      Height = 57
      Caption = #1042#1099#1076#1077#1088#1078#1082#1072
      TabOrder = 3
    end
    object RadioButton1: TRadioButton
      Left = 16
      Top = 80
      Width = 129
      Height = 17
      Caption = #1055#1086' '#1089#1088#1077#1076#1085#1077#1081' '#1103#1088#1082#1086#1089#1090#1080
      Checked = True
      TabOrder = 4
      TabStop = True
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 16
      Top = 96
      Width = 129
      Height = 17
      Caption = #1087#1086' '#1084#1072#1082#1089'. '#1103#1088#1082#1086#1089#1090#1080
      TabOrder = 5
      OnClick = RadioButton2Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 296
    Top = 8
    Width = 177
    Height = 161
    Caption = #1053#1072#1073#1083#1102#1076#1072#1090#1077#1083#1100
    TabOrder = 3
    object txtAzimuth: TLabeledEdit
      Left = 112
      Top = 16
      Width = 57
      Height = 21
      EditLabel.Width = 37
      EditLabel.Height = 13
      EditLabel.Caption = #1040#1079#1080#1084#1091#1090
      LabelPosition = lpLeft
      TabOrder = 0
      Text = '0'
      OnChange = txtAzimuthChange
    end
    object txtAltitude: TLabeledEdit
      Left = 112
      Top = 40
      Width = 57
      Height = 21
      EditLabel.Width = 59
      EditLabel.Height = 13
      EditLabel.Caption = #1059#1075#1086#1083' '#1084#1077#1089#1090#1072
      LabelPosition = lpLeft
      TabOrder = 1
      Text = '30'
      OnChange = txtAltitudeChange
    end
    object txtFOV: TLabeledEdit
      Left = 112
      Top = 64
      Width = 57
      Height = 21
      EditLabel.Width = 65
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1086#1083#1077' '#1079#1088#1077#1085#1080#1103
      LabelPosition = lpLeft
      TabOrder = 2
      Text = '60'
      OnChange = txtFOVChange
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 112
      Width = 161
      Height = 17
      Caption = #1053#1072#1074#1080#1075#1072#1094#1080#1103' '#1089#1090#1088#1077#1083#1086#1095#1082#1072#1084#1080
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = CheckBox1Click
    end
    object txtHeight: TLabeledEdit
      Left = 112
      Top = 88
      Width = 57
      Height = 21
      EditLabel.Width = 100
      EditLabel.Height = 13
      EditLabel.Caption = #1042#1099#1089#1086#1090#1072' '#1085#1072#1076' '#1087#1086#1074#1077#1088#1093'.'
      LabelPosition = lpLeft
      TabOrder = 4
      Text = '2'
      Visible = False
      OnChange = txtHeightChange
    end
    object Button3: TButton
      Left = 8
      Top = 136
      Width = 81
      Height = 17
      Caption = #1053#1072#1088#1080#1089#1086#1074#1072#1090#1100
      TabOrder = 5
      OnClick = Button3Click
    end
    object Button5: TButton
      Left = 96
      Top = 136
      Width = 65
      Height = 17
      Caption = #1057#1086#1093#1088'. '#1074' BMP'
      TabOrder = 6
      OnClick = Button5Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 176
    Width = 858
    Height = 427
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    object TabSheet1: TTabSheet
      Caption = #1055#1088#1077#1076#1074'. '#1087#1088#1086#1089#1084#1086#1090#1088
      OnResize = TabSheet1Resize
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 850
        Height = 399
        Align = alClient
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1043#1088#1072#1092#1080#1082#1080
      ImageIndex = 1
      DesignSize = (
        850
        399)
      object Chart1: TChart
        Left = 0
        Top = 32
        Width = 850
        Height = 363
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -16
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Title.Text.Strings = (
          '')
        BottomAxis.Automatic = False
        BottomAxis.AutomaticMaximum = False
        BottomAxis.AutomaticMinimum = False
        BottomAxis.Maximum = 780.000000000000000000
        BottomAxis.Minimum = 380.000000000000000000
        BottomAxis.Title.Caption = #1044#1083#1080#1085#1072' '#1074#1086#1083#1085#1099', '#1085#1084
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.ExactDateTime = False
        LeftAxis.Increment = 0.100000000000000000
        LeftAxis.LabelsSize = 29
        LeftAxis.Maximum = 1.000000000000000000
        LeftAxis.Title.Caption = #1057#1087#1077#1082#1090#1088', '#1085#1086#1088#1084#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1087#1086' '#1084#1072#1082#1089#1080#1084#1091#1084#1091
        Legend.Alignment = laTop
        View3D = False
        Color = clWhite
        TabOrder = 0
        Anchors = [akLeft, akTop, akRight, akBottom]
        object Series1: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = #1047#1072' '#1087#1088#1077#1076#1077#1083#1072#1084#1080' '#1072#1090#1084#1086#1089#1092#1077#1088#1099
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
          Title = #1059' '#1087#1086#1074#1077#1088#1093#1085#1086#1089#1090#1080
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
      object Button9: TButton
        Left = 0
        Top = 0
        Width = 225
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083' '#1075#1088#1072#1092#1080#1082' "'#1091' '#1087#1086#1074#1077#1088#1093#1085#1086#1089#1090#1080'"'
        TabOrder = 1
        OnClick = Button9Click
      end
      object Button10: TButton
        Left = 232
        Top = 0
        Width = 121
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082' BMP'
        TabOrder = 2
        OnClick = Button10Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1046#1091#1088#1085#1072#1083
      ImageIndex = 2
      object txtLog: TMemo
        Left = 0
        Top = 0
        Width = 673
        Height = 413
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object GroupBox5: TGroupBox
    Left = 480
    Top = 8
    Width = 153
    Height = 161
    Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1086#1087#1090#1080#1082#1080
    TabOrder = 5
    object txtScatter: TLabeledEdit
      Left = 112
      Top = 16
      Width = 33
      Height = 21
      EditLabel.Width = 89
      EditLabel.Height = 13
      EditLabel.Caption = #1044#1086#1083#1103' '#1088#1072#1089#1089'. '#1089#1074#1077#1090#1072
      LabelPosition = lpLeft
      TabOrder = 0
      Text = '0,01'
      OnChange = txtScatterChange
    end
    object txtBlockHoriz: TLabeledEdit
      Left = 112
      Top = 40
      Width = 33
      Height = 21
      EditLabel.Width = 106
      EditLabel.Height = 13
      EditLabel.Caption = #1084#1072#1082#1089'. '#1091#1075#1083#1099' '#1087#1086' '#1075#1086#1088#1080#1079'.'
      LabelPosition = lpLeft
      TabOrder = 1
      Text = '95'
      OnChange = txtBlockHorizChange
    end
    object txtBlockTop: TLabeledEdit
      Left = 112
      Top = 64
      Width = 33
      Height = 21
      EditLabel.Width = 91
      EditLabel.Height = 13
      EditLabel.Caption = #1084#1072#1082#1089'. '#1091#1075#1086#1083' '#1089#1074#1077#1088#1093#1091
      LabelPosition = lpLeft
      TabOrder = 2
      Text = '60'
      OnChange = txtBlockTopChange
    end
    object txtBlockBottom: TLabeledEdit
      Left = 112
      Top = 88
      Width = 33
      Height = 21
      EditLabel.Width = 86
      EditLabel.Height = 13
      EditLabel.Caption = #1084#1072#1082#1089'. '#1091#1075#1086#1083' '#1089#1085#1080#1079#1091
      LabelPosition = lpLeft
      TabOrder = 3
      Text = '75'
      OnChange = txtBlockBottomChange
    end
    object txtExpoCorr: TLabeledEdit
      Left = 112
      Top = 136
      Width = 33
      Height = 21
      EditLabel.Width = 84
      EditLabel.Height = 13
      EditLabel.Caption = #1101#1082#1089#1087#1086#1082#1086#1088#1088#1077#1082#1094#1080#1103
      LabelPosition = lpLeft
      TabOrder = 4
      Text = '0'
      OnChange = txtExpoCorrChange
    end
    object txtAperture: TLabeledEdit
      Left = 112
      Top = 112
      Width = 33
      Height = 21
      EditLabel.Width = 103
      EditLabel.Height = 13
      EditLabel.Caption = #1076#1080#1072#1084#1077#1090#1088' '#1079#1088#1072#1095#1082#1072', '#1084#1084
      LabelPosition = lpLeft
      TabOrder = 5
      Text = '1'
      OnChange = txtApertureChange
    end
  end
  object Button8: TButton
    Left = 640
    Top = 144
    Width = 89
    Height = 25
    Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
    TabOrder = 6
    OnClick = Button8Click
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 576
    Top = 256
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'bmp'
    Filter = 'BMP files|*.bmp|All files|*.*'
    Left = 272
    Top = 168
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Text file|*.txt|Data file|*.dat|All files|*.*'
    Left = 304
    Top = 168
  end
  object dlgTxt: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Text files|*.txt|Data files|*.dat|All files|*.*'
    Left = 344
    Top = 168
  end
end
