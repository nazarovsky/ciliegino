object Form1: TForm1
  Left = 610
  Top = 437
  BorderStyle = bsNone
  Caption = 'Ciliegino'
  ClientHeight = 36
  ClientWidth = 115
  Color = clBlack
  TransparentColorValue = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  OnShow = FormShow
  DesignSize = (
    115
    36)
  PixelsPerInch = 96
  TextHeight = 13
  object tlabel: TLabel
    Left = 3
    Top = 3
    Width = 46
    Height = 22
    Alignment = taCenter
    AutoSize = False
    Caption = 'TIME'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = PopupMenu1
    Layout = tlCenter
    OnMouseDown = tlabelMouseDown
  end
  object LabelSession: TLabel
    Left = 39
    Top = 23
    Width = 12
    Height = 13
    Anchors = [akBottom]
    Caption = '01'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnMouseDown = tlabelMouseDown
  end
  object SpeedButton1: TSpeedButton
    Left = 48
    Top = 1
    Width = 33
    Height = 24
    Action = StartTimer
    Anchors = [akRight, akBottom]
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300130000031
      00333773F77777FF7733331000909000133333377737F777FF33330098F0F890
      0333337733F733F77F33370980FFF08907333373373F373373F33099FF0FFFF9
      903337F3F373F33FF7F33090FFF0FF00903337F73337F37737F33099FFF0FFF9
      9033373F33F7F3F33733370980F0F0890733337FF737F7337F33330098F0F890
      03333F77FF3733377FFF000009999900000377777FFFFF77777F088700000008
      77037F3377777773337F088887707888870373F3337773F33373307880707088
      7033373FF737F73FF733337003303300733333777337FF777333333333000333
      3333333333777333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object t1: TTimer
    OnTimer = t1Timer
    Left = 80
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 64
    Top = 16
    object Settings1: TMenuItem
      Caption = 'Settings'
      OnClick = Settings1Click
    end
    object HELP1: TMenuItem
      Action = HelpShow
      Caption = 'Help'
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Exit1: TMenuItem
      Caption = 'Exit'
      OnClick = Exit1Click
    end
  end
  object ActionList1: TActionList
    Left = 8
    Top = 8
    object StartTimer: TAction
      ImageIndex = 0
      OnExecute = StartTimerExecute
    end
    object HelpShow: TAction
      Caption = 'HELP!!!'
      OnExecute = HelpShowExecute
    end
  end
end
