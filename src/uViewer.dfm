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
    Height = 574
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 579
    object imgViewer: TImage
      Left = 0
      Top = 0
      Width = 1178
      Height = 574
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
    Top = 583
    Width = 1178
    Height = 125
    Align = alBottom
    TabOrder = 1
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
    object lblIndicator: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 25
      Width = 1170
      Height = 15
      Align = alTop
      Alignment = taCenter
      Caption = 'lblIndicator'
      ExplicitWidth = 60
    end
    object pnlSelected: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 46
      Width = 1170
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object chkSelected: TCheckBox
        Left = 555
        Top = 2
        Width = 67
        Height = 17
        TabStop = False
        Caption = 'Selected'
        TabOrder = 0
      end
    end
    object pnlButtons: TPanel
      Left = 1
      Top = 73
      Width = 1176
      Height = 51
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 0
      ExplicitTop = 76
      object btnPrev: TBitBtn
        Left = 537
        Top = 2
        Width = 45
        Height = 35
        ImageIndex = 0
        ImageName = 'arrow-back'
        Images = svgBtnList
        TabOrder = 0
        OnClick = btnPrevClick
      end
      object btnNext: TBitBtn
        Left = 596
        Top = 2
        Width = 45
        Height = 35
        ImageIndex = 1
        ImageName = 'arrow-forward'
        Images = svgBtnList
        Layout = blGlyphRight
        TabOrder = 1
        OnClick = btnNextClick
      end
    end
  end
  object svgBtnList: TSVGIconImageList
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
    Left = 971
    Top = 435
  end
end
