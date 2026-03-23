object fmMain: TfmMain
  Left = 0
  Top = 0
  Margins.Left = 0
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  Caption = 'PhotoSweep'
  ClientHeight = 611
  ClientWidth = 984
  Color = clBtnFace
  Constraints.MinWidth = 1000
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  StyleName = 'Carbon'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object bvlTop: TBevel
    AlignWithMargins = True
    Left = 3
    Top = 63
    Width = 978
    Height = 1
    Align = alTop
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 60
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 12
    Padding.Top = 8
    Padding.Right = 12
    Padding.Bottom = 8
    TabOrder = 0
    object pnlTopLogo: TPanel
      Left = 12
      Top = 8
      Width = 109
      Height = 44
      Align = alLeft
      BevelOuter = bvNone
      Padding.Left = 10
      Padding.Right = 10
      ParentBackground = False
      TabOrder = 0
      object svgLogo: TSVGIconImage
        AlignWithMargins = True
        Left = 10
        Top = 4
        Width = 83
        Height = 24
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 0
        AutoSize = False
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0' +
          ' 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" ' +
          'fill="none"/><path d="M14.12 4l1.83 2H20v12H4V6h4.05l1.83-2h4.24' +
          'M15 2H9L7.17 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 ' +
          '2-2V6c0-1.1-.9-2-2-2h-3.17L15 2zm-3 7c1.65 0 3 1.35 3 3s-1.35 3-' +
          '3 3-3-1.35-3-3 1.35-3 3-3m0-2c-2.76 0-5 2.24-5 5s2.24 5 5 5 5-2.' +
          '24 5-5-2.24-5-5-5z"/></svg>'
        FixedColor = clLightgray
        Align = alTop
      end
      object lblLogo: TLabel
        AlignWithMargins = True
        Left = 13
        Top = 28
        Width = 83
        Height = 14
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alBottom
        Alignment = taCenter
        Caption = 'PhotoSweep'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 68
      end
    end
    object btnAbout: TBitBtn
      AlignWithMargins = True
      Left = 879
      Top = 16
      Width = 90
      Height = 27
      Margins.Top = 8
      Margins.Bottom = 9
      Align = alRight
      Caption = 'About'
      ImageIndex = 4
      ImageName = 'about'
      Images = svgBtnList
      TabOrder = 1
    end
  end
  object stbMain: TStatusBar
    AlignWithMargins = True
    Left = 3
    Top = 589
    Width = 978
    Height = 19
    Panels = <
      item
        Text = 'Total: 0'
        Width = 100
      end
      item
        Text = 'Selected: 0'
        Width = 100
      end>
  end
  object pnlSource: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 70
    Width = 978
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lblSource: TLabel
      AlignWithMargins = True
      Left = 104
      Top = 8
      Width = 148
      Height = 22
      Margins.Top = 8
      Align = alLeft
      Caption = 'Select a source folder path...'
      ExplicitHeight = 15
    end
    object btnSource: TBitBtn
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 95
      Height = 27
      Align = alLeft
      Caption = 'Source'
      Default = True
      ImageIndex = 0
      ImageName = 'folder-open'
      Images = svgBtnList
      TabOrder = 0
      OnClick = btnSourceClick
    end
  end
  object pnlBottom: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 441
    Width = 978
    Height = 142
    Align = alBottom
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 3
    object bvlTools: TBevel
      AlignWithMargins = True
      Left = 3
      Top = 39
      Width = 972
      Height = 1
      Align = alTop
      ExplicitLeft = 1
      ExplicitTop = 34
      ExplicitWidth = 976
    end
    object pnlButtons: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 978
      Height = 33
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object btnMove: TBitBtn
        AlignWithMargins = True
        Left = 3
        Top = 4
        Width = 95
        Height = 27
        Margins.Top = 4
        Margins.Bottom = 2
        Align = alLeft
        Caption = 'Move'
        ImageIndex = 1
        ImageName = 'move'
        Images = svgBtnList
        TabOrder = 0
      end
      object btnCopy: TBitBtn
        AlignWithMargins = True
        Left = 104
        Top = 4
        Width = 95
        Height = 27
        Margins.Top = 4
        Margins.Bottom = 2
        Align = alLeft
        Caption = 'Copy'
        ImageIndex = 2
        ImageName = 'copy'
        Images = svgBtnList
        TabOrder = 1
      end
      object btnDupl: TBitBtn
        AlignWithMargins = True
        Left = 205
        Top = 4
        Width = 95
        Height = 27
        Margins.Top = 4
        Margins.Bottom = 2
        Align = alLeft
        Caption = 'Duplicates'
        ImageIndex = 3
        ImageName = 'duplicates'
        Images = svgBtnList
        TabOrder = 2
      end
      object btnPreview: TBitBtn
        AlignWithMargins = True
        Left = 885
        Top = 4
        Width = 90
        Height = 27
        Margins.Top = 4
        Margins.Bottom = 2
        Align = alRight
        Caption = 'Preview'
        ImageIndex = 5
        ImageName = 'preview'
        Images = svgBtnList
        TabOrder = 3
      end
    end
    object pnlTools2: TPanel
      Left = 0
      Top = 43
      Width = 978
      Height = 99
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 978
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnSelectAll: TBitBtn
          AlignWithMargins = True
          Left = 3
          Top = 4
          Width = 95
          Height = 27
          Margins.Top = 4
          Margins.Bottom = 2
          Align = alLeft
          Caption = 'Select All'
          ImageIndex = 6
          ImageName = 'checkbox'
          Images = svgBtnList
          TabOrder = 0
        end
        object btnDeselectAll: TBitBtn
          AlignWithMargins = True
          Left = 104
          Top = 4
          Width = 95
          Height = 27
          Margins.Top = 4
          Margins.Bottom = 2
          Align = alLeft
          Caption = 'Deselect All'
          ImageIndex = 7
          ImageName = 'checkbox-blank'
          Images = svgBtnList
          TabOrder = 1
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 33
        Width = 978
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object chkJpg: TCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 97
          Height = 27
          Hint = '.jpg'
          Align = alLeft
          Caption = 'JPG'
          TabOrder = 0
        end
        object chkPng: TCheckBox
          AlignWithMargins = True
          Left = 106
          Top = 3
          Width = 97
          Height = 27
          Hint = '.png'
          Align = alLeft
          Caption = 'PNG'
          TabOrder = 1
        end
        object chkGif: TCheckBox
          AlignWithMargins = True
          Left = 209
          Top = 3
          Width = 97
          Height = 27
          Hint = '.gif'
          Align = alLeft
          Caption = 'GIF'
          TabOrder = 2
        end
        object chkHasExif: TCheckBox
          AlignWithMargins = True
          Left = 312
          Top = 3
          Width = 97
          Height = 27
          Align = alLeft
          Caption = 'Has EXIF'
          TabOrder = 3
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 66
        Width = 978
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object chkLandscape: TCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 97
          Height = 26
          Align = alLeft
          Caption = 'Landscape'
          TabOrder = 0
        end
        object chkPortrait: TCheckBox
          Tag = 1
          AlignWithMargins = True
          Left = 106
          Top = 3
          Width = 97
          Height = 26
          Align = alLeft
          Caption = 'Portrait'
          TabOrder = 1
        end
        object chkSquare: TCheckBox
          Tag = 2
          AlignWithMargins = True
          Left = 209
          Top = 3
          Width = 97
          Height = 26
          Align = alLeft
          Caption = 'Square'
          TabOrder = 2
        end
      end
    end
  end
  object pnlTarget: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 405
    Width = 978
    Height = 33
    Margins.Bottom = 0
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object Label1: TLabel
      AlignWithMargins = True
      Left = 104
      Top = 8
      Width = 144
      Height = 22
      Margins.Top = 8
      Align = alLeft
      Caption = 'Select a target folder path...'
      ExplicitHeight = 15
    end
    object btnTarget: TBitBtn
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 95
      Height = 27
      Align = alLeft
      Caption = 'Target'
      ImageIndex = 0
      ImageName = 'folder-open'
      Images = svgBtnList
      TabOrder = 0
    end
  end
  object lvwItems: TListView
    AlignWithMargins = True
    Left = 6
    Top = 109
    Width = 972
    Height = 290
    Margins.Left = 6
    Margins.Right = 6
    Align = alClient
    Checkboxes = True
    Columns = <
      item
        Caption = 'File Name'
        Width = 250
      end
      item
        Caption = 'Date Taken'
        Width = 150
      end
      item
        Caption = 'Camera'
        Width = 200
      end
      item
        Alignment = taCenter
        Caption = 'Resolution'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = 'MP'
        Width = 100
      end
      item
        Alignment = taRightJustify
        Caption = 'Size'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = 'Extension'
        Width = 100
      end
      item
        Caption = 'Orientation'
        Width = 100
      end
      item
        AutoSize = True
        Caption = 'Has EXIF'
        WidthType = (
          -132)
      end>
    DoubleBuffered = True
    FlatScrollBars = True
    ReadOnly = True
    RowSelect = True
    ParentDoubleBuffered = False
    SmallImages = imlThumbnails
    TabOrder = 5
    ViewStyle = vsReport
  end
  object svgBtnList: TSVGIconImageList
    SVGIconItems = <
      item
        IconName = 'folder-open'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0' +
          ' 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" ' +
          'fill="none"/><path d="M20 6h-8l-2-2H4c-1.1 0-1.99.9-1.99 2L2 18c' +
          '0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V8c0-1.1-.9-2-2-2zm0 12H4V8h16v10' +
          'z"/></svg>'
        FixedColor = clLightgray
      end
      item
        IconName = 'move'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" enable-background="new 0' +
          ' 0 24 24" height="24px" viewBox="0 0 24 24" width="24px" fill="#' +
          '1f1f1f"><rect fill="none" height="24" width="24"/><path d="M18,2' +
          'H9C7.9,2,7,2.9,7,4v12c0,1.1,0.9,2,2,2h9c1.1,0,2-0.9,2-2V4C20,2.9' +
          ',19.1,2,18,2z M18,16H9V4h9V16z M3,15v-2h2v2H3z M3,9.5h2v2H3V9.5z' +
          ' M10,20h2v2h-2V20z M3,18.5v-2h2v2H3z M5,22c-1.1,0-2-0.9-2-2h2V22' +
          'z M8.5,22h-2v-2h2V22z M13.5,22L13.5,22l0-2h2 v0C15.5,21.1,14.6,2' +
          '2,13.5,22z M5,6L5,6l0,2H3v0C3,6.9,3.9,6,5,6z"/></svg>'
        FixedColor = clLightgray
      end
      item
        IconName = 'copy'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0' +
          ' 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" ' +
          'fill="none"/><path d="M16 1H4c-1.1 0-2 .9-2 2v14h2V3h12V1zm3 4H8' +
          'c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h11c1.1 0 2-.9 2-2V7c0-1.1-.9-2' +
          '-2-2zm0 16H8V7h11v14z"/></svg>'
        FixedColor = clLightgray
      end
      item
        IconName = 'duplicates'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0' +
          ' 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" ' +
          'fill="none"/><path d="M20 4v12H8V4h12m0-2H8c-1.1 0-2 .9-2 2v12c0' +
          ' 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm-8.5 9.67l1.69 ' +
          '2.26 2.48-3.1L19 15H9zM2 6v14c0 1.1.9 2 2 2h14v-2H4V6H2z"/></svg' +
          '>'
        FixedColor = clLightgray
      end
      item
        IconName = 'about'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" enable-background="new 0' +
          ' 0 24 24" height="24px" viewBox="0 0 24 24" width="24px" fill="#' +
          '1f1f1f"><g><rect fill="none" height="24" width="24"/><path d="M1' +
          '3.25,16.74c0,0.69-0.53,1.26-1.25,1.26c-0.7,0-1.26-0.56-1.26-1.26' +
          'c0-0.71,0.56-1.25,1.26-1.25 C12.71,15.49,13.25,16.04,13.25,16.74' +
          'z M11.99,6c-1.77,0-2.98,1.15-3.43,2.49l1.64,0.69c0.22-0.67,0.74-' +
          '1.48,1.8-1.48 c1.62,0,1.94,1.52,1.37,2.33c-0.54,0.77-1.47,1.29-1' +
          '.96,2.16c-0.39,0.69-0.31,1.49-0.31,1.98h1.82c0-0.93,0.07-1.12,0.' +
          '22-1.41 c0.39-0.72,1.11-1.06,1.87-2.17c0.68-1,0.42-2.36-0.02-3.0' +
          '8C14.48,6.67,13.47,6,11.99,6z M19,5H5v14h14V5 M19,3c1.1,0,2,0.9,' +
          '2,2v14 c0,1.1-0.9,2-2,2H5c-1.1,0-2-0.9-2-2V5c0-1.1,0.9-2,2-2H19L' +
          '19,3z"/></g></svg>'
        FixedColor = clLightgray
      end
      item
        IconName = 'preview'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0' +
          ' 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" ' +
          'fill="none"/><path d="M21 15h2v2h-2v-2zm0-4h2v2h-2v-2zm2 8h-2v2c' +
          '1 0 2-1 2-2zM13 3h2v2h-2V3zm8 4h2v2h-2V7zm0-4v2h2c0-1-1-2-2-2zM1' +
          ' 7h2v2H1V7zm16-4h2v2h-2V3zm0 16h2v2h-2v-2zM3 3C2 3 1 4 1 5h2V3zm' +
          '6 0h2v2H9V3zM5 3h2v2H5V3zm-4 8v8c0 1.1.9 2 2 2h12V11H1zm2 8l2.5-' +
          '3.21 1.79 2.15 2.5-3.22L13 19H3z"/></svg>'
        FixedColor = clLightgray
      end
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
      end>
    Scaled = True
    Left = 928
    Top = 496
  end
  object imlThumbnails: TImageList
    Height = 48
    Width = 48
    Left = 53
    Top = 167
  end
end
