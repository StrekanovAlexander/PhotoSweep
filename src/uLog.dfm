object fmLog: TfmLog
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PhotoSweep - Log'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object mmLog: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 618
    Height = 404
    Align = alClient
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object pnlBtns: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 413
    Width = 618
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnClose: TBitBtn
      Left = 523
      Top = 0
      Width = 95
      Height = 25
      Align = alRight
      Caption = 'Close'
      ImageIndex = 0
      ImageName = 'close'
      Images = svgBtns
      TabOrder = 0
      OnClick = btnCloseClick
      ExplicitLeft = 543
    end
  end
  object svgBtns: TSVGIconImageList
    SVGIconItems = <
      item
        IconName = 'close'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0' +
          ' 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" ' +
          'fill="none"/><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10' +
          '.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.' +
          '41z"/></svg>'
        FixedColor = clLightgray
      end>
    Scaled = True
    Left = 552
    Top = 352
  end
end
