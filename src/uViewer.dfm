object fmViewer: TfmViewer
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PhotoSweep - Viewer'
  ClientHeight = 711
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object pnlMain: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 978
    Height = 549
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 1178
    object imgViewer: TImage
      Left = 0
      Top = 0
      Width = 978
      Height = 549
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
    Top = 558
    Width = 978
    Height = 125
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 1178
    object lblFileName: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 972
      Height = 15
      Align = alTop
      Alignment = taCenter
      Caption = 'lblFileName'
      ExplicitWidth = 63
    end
    object lblIndicator: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 45
      Width = 972
      Height = 15
      Align = alTop
      Alignment = taCenter
      Caption = 'lblIndicator'
      ExplicitWidth = 60
    end
    object lblSize: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 24
      Width = 972
      Height = 15
      Align = alTop
      Alignment = taCenter
      Caption = 'lblSize'
      ExplicitWidth = 33
    end
    object pnlSelected: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 66
      Width = 972
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 1172
      object chkSelected: TCheckBox
        Left = 453
        Top = 2
        Width = 67
        Height = 17
        TabStop = False
        Caption = 'Selected'
        TabOrder = 0
        OnClick = chkSelectedClick
      end
    end
    object pnlButtons: TPanel
      Left = 0
      Top = 93
      Width = 978
      Height = 32
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 1178
      object btnPrev: TSpeedButton
        Left = 405
        Top = 1
        Width = 75
        Height = 25
        ImageIndex = 0
        ImageName = 'arrow-back'
        Images = svgBtnList
        OnClick = btnPrevClick
      end
      object btnNext: TSpeedButton
        Left = 494
        Top = 1
        Width = 75
        Height = 25
        ImageIndex = 1
        ImageName = 'arrow-forward'
        Images = svgBtnList
        OnClick = btnNextClick
      end
    end
  end
  object stbViewer: TStatusBar
    AlignWithMargins = True
    Left = 3
    Top = 689
    Width = 978
    Height = 19
    Panels = <
      item
        Text = #8592' / '#8594'  Navigate'
        Width = 105
      end
      item
        Text = 'Space  Select'
        Width = 90
      end
      item
        Text = 'Esc  Exit'
        Width = 100
      end>
    ExplicitWidth = 1178
  end
  object svgBtnList: TSVGIconImageList
    Size = 15
    SVGIconItems = <
      item
        IconName = 'arrow-back'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0' +
          ' 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" ' +
          'fill="none" opacity=".87"/><path d="M17.51 3.87L15.73 2.1 5.84 1' +
          '2l9.9 9.9 1.77-1.77L9.38 12l8.13-8.13z"/></svg>'
        FixedColor = clLightgray
      end
      item
        IconName = 'arrow-forward'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" enable-background="new 0' +
          ' 0 24 24" height="24px" viewBox="0 0 24 24" width="24px" fill="#' +
          '1f1f1f"><g><path d="M0,0h24v24H0V0z" fill="none"/></g><g><polygo' +
          'n points="6.23,20.23 8,22 18,12 8,2 6.23,3.77 14.46,12"/></g></s' +
          'vg>'
        FixedColor = clLightgray
      end>
    Scaled = True
    Left = 478
    Top = 499
  end
end
