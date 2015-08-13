object SettingsForm: TSettingsForm
  Left = 625
  Top = 417
  BorderStyle = bsToolWindow
  Caption = 'Settings'
  ClientHeight = 118
  ClientWidth = 306
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    306
    118)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 10
    Width = 69
    Height = 16
    Caption = 'WORK time'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 157
    Top = 10
    Width = 21
    Height = 16
    Caption = 'Min'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 34
    Width = 65
    Height = 16
    Caption = 'REST time'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 157
    Top = 34
    Width = 21
    Height = 16
    Caption = 'Min'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 56
    Width = 46
    Height = 16
    Caption = 'Opacity'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object WTEdit: TSpinEdit
    Left = 104
    Top = 8
    Width = 49
    Height = 22
    Increment = 5
    MaxValue = 60
    MinValue = 10
    TabOrder = 0
    Value = 20
  end
  object RTEdit: TSpinEdit
    Left = 104
    Top = 32
    Width = 49
    Height = 22
    MaxValue = 30
    MinValue = 5
    TabOrder = 1
    Value = 5
  end
  object OkBtn: TBitBtn
    Left = 223
    Top = 85
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 2
    OnClick = OkBtnClick
    Kind = bkOK
  end
  object OpacityTrackBar: TTrackBar
    Left = 98
    Top = 56
    Width = 206
    Height = 25
    Max = 255
    Frequency = 5
    Position = 192
    TabOrder = 3
    ThumbLength = 15
    TickStyle = tsNone
    OnChange = OpacityTrackBarChange
  end
  object ResetBtn: TBitBtn
    Left = 192
    Top = 8
    Width = 49
    Height = 25
    Caption = 'Reset'
    TabOrder = 4
    OnClick = ResetBtnClick
  end
  object SndCheck: TCheckBox
    Left = 8
    Top = 88
    Width = 65
    Height = 17
    Caption = 'Sound'
    TabOrder = 5
  end
  object ZeroBtn: TButton
    Left = 248
    Top = 8
    Width = 49
    Height = 25
    Caption = 'Zero'
    TabOrder = 6
    OnClick = ZeroBtnClick
  end
  object VolumeTrackBar: TTrackBar
    Left = 64
    Top = 88
    Width = 153
    Height = 25
    Max = 65535
    Frequency = 128
    Position = 192
    TabOrder = 7
    ThumbLength = 15
    TickStyle = tsNone
    OnChange = VolumeTrackBarChange
  end
end
