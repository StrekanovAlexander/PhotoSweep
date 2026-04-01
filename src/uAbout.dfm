object fmAbout: TfmAbout
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'PhotoSweep - About'
  ClientHeight = 211
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object svgLogo: TSVGIconImage
    Left = 174
    Top = 12
    Width = 30
    Height = 30
    AutoSize = False
    SVGText = 
      '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0' +
      ' 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" ' +
      'fill="none"/><path d="M16.66 4.52l2.83 2.83-2.83 2.83-2.83-2.83 ' +
      '2.83-2.83M9 5v4H5V5h4m10 10v4h-4v-4h4M9 15v4H5v-4h4m7.66-13.31L1' +
      '1 7.34 16.66 13l5.66-5.66-5.66-5.65zM11 3H3v8h8V3zm10 10h-8v8h8v' +
      '-8zm-10 0H3v8h8v-8z"/></svg>'
    FixedColor = clLightgray
  end
  object lblBrand: TLabel
    Left = 154
    Top = 46
    Width = 71
    Height = 15
    Caption = 'PhotoSweep'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblVersion: TLabel
    Left = 160
    Top = 61
    Width = 56
    Height = 15
    Caption = 'Version 1.0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblDescription: TLabel
    Left = 32
    Top = 86
    Width = 313
    Height = 31
    Alignment = taCenter
    AutoSize = False
    Caption = 
      'A lightweight tool to organize your photo collection'#10'and remove ' +
      'duplicates.'
  end
  object lblDeveloper: TLabel
    Left = 32
    Top = 116
    Width = 313
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Developed by an independent developer.'
  end
  object lblYear: TLabel
    Left = 169
    Top = 145
    Width = 38
    Height = 15
    Caption = #169' 2026'
  end
  object btnClose: TButton
    Left = 154
    Top = 172
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = btnCloseClick
  end
end
