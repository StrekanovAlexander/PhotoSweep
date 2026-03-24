object fmViewer: TfmViewer
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PhotoSweep Viewer'
  ClientHeight = 711
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object pnlMain: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1178
    Height = 579
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 400
    ExplicitTop = 160
    ExplicitWidth = 185
    ExplicitHeight = 41
    object imgViewer: TImage
      Left = 0
      Top = 0
      Width = 1178
      Height = 579
      Align = alClient
      Center = True
      Proportional = True
      Stretch = True
      ExplicitLeft = 448
      ExplicitTop = 256
      ExplicitWidth = 105
      ExplicitHeight = 105
    end
  end
  object pnlBottom: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 588
    Width = 1178
    Height = 120
    Align = alBottom
    Caption = 'pnlBottom'
    TabOrder = 1
    ExplicitTop = 608
    object lblFileName: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 1170
      Height = 15
      Align = alTop
      Alignment = taCenter
      Caption = 'lblFileName'
      ExplicitWidth = 63
    end
  end
end
