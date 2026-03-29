object fmDuplicates: TfmDuplicates
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'PhotoSweep - Duplicates'
  ClientHeight = 561
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object lvwDuplicates: TListView
    Left = 0
    Top = 0
    Width = 784
    Height = 528
    Align = alClient
    Checkboxes = True
    Columns = <
      item
        Caption = 'File Name'
        Width = 300
      end
      item
        AutoSize = True
        Caption = 'Path'
      end>
    ReadOnly = True
    RowSelect = True
    SmallImages = svgIcons
    TabOrder = 0
    ViewStyle = vsReport
    OnCustomDrawItem = lvwDuplicatesCustomDrawItem
    OnItemChecked = lvwDuplicatesItemChecked
    ExplicitWidth = 624
    ExplicitHeight = 385
  end
  object pnlSelectBtns: TPanel
    Left = 0
    Top = 528
    Width = 784
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 414
    ExplicitWidth = 624
    object btnSelect: TBitBtn
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 75
      Height = 27
      Align = alLeft
      Caption = 'Select'
      ImageIndex = 0
      ImageName = 'checkbox'
      Images = svgBtns
      TabOrder = 0
      OnClick = btnSelectClick
    end
    object btnDeselect: TBitBtn
      AlignWithMargins = True
      Left = 84
      Top = 3
      Width = 75
      Height = 27
      Align = alLeft
      Caption = 'Deselect'
      ImageIndex = 1
      ImageName = 'checkbox-blank'
      Images = svgBtns
      TabOrder = 1
      OnClick = btnDeselectClick
    end
    object btnDelete: TBitBtn
      AlignWithMargins = True
      Left = 575
      Top = 3
      Width = 125
      Height = 27
      Align = alRight
      Caption = 'Delete Duplicates'
      ImageIndex = 2
      ImageName = 'trash'
      Images = svgBtns
      TabOrder = 2
      ExplicitLeft = 403
    end
    object btnClose: TBitBtn
      AlignWithMargins = True
      Left = 706
      Top = 3
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'Close'
      ImageIndex = 3
      ImageName = 'close'
      Images = svgBtns
      TabOrder = 3
      OnClick = btnCloseClick
      ExplicitLeft = 512
      ExplicitTop = 8
      ExplicitHeight = 25
    end
  end
  object svgIcons: TSVGIconImageList
    Size = 15
    SVGIconItems = <
      item
        IconName = 'lock'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0' +
          ' 0 24 24" width="24px" fill="#1f1f1f"><g fill="none"><path d="M0' +
          ' 0h24v24H0V0z"/><path d="M0 0h24v24H0V0z" opacity=".87"/></g><pa' +
          'th d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 ' +
          '2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zM9 6c0-1.' +
          '66 1.34-3 3-3s3 1.34 3 3v2H9V6zm9 14H6V10h12v10zm-6-3c1.1 0 2-.9' +
          ' 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2z"/></svg>'
        FixedColor = clLimegreen
      end
      item
        IconName = 'trash'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0' +
          ' 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" ' +
          'fill="none"/><path d="M16 9v10H8V9h8m-1.5-6h-5l-1 1H5v2h14V4h-3.' +
          '5l-1-1zM18 7H6v12c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7z"/></svg>'
        FixedColor = clOrangered
      end>
    Scaled = True
    Left = 24
    Top = 48
  end
  object svgBtns: TSVGIconImageList
    SVGIconItems = <
      item
        IconName = 'checkbox'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0' +
          ' 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" ' +
          'fill="none"/><path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h1' +
          '4c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 16H5V5h14v14zM17.99 9l-1.41' +
          '-1.42-6.59 6.59-2.58-2.57-1.42 1.41 4 3.99z"/></svg>'
        FixedColor = clLightgray
      end
      item
        IconName = 'checkbox-blank'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0' +
          ' 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" ' +
          'fill="none"/><path d="M19 5v14H5V5h14m0-2H5c-1.1 0-2 .9-2 2v14c0' +
          ' 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"/></svg>'
        FixedColor = clLightgray
      end
      item
        IconName = 'trash'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0' +
          ' 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" ' +
          'fill="none"/><path d="M16 9v10H8V9h8m-1.5-6h-5l-1 1H5v2h14V4h-3.' +
          '5l-1-1zM18 7H6v12c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7z"/></svg>'
        FixedColor = clLightgray
      end
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
    Left = 544
    Top = 344
  end
end
