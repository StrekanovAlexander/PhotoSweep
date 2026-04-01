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
  Padding.Left = 7
  Position = poScreenCenter
  WindowState = wsMaximized
  StyleName = 'Carbon'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object bvlTop: TBevel
    AlignWithMargins = True
    Left = 10
    Top = 58
    Width = 971
    Height = 1
    Align = alTop
    ExplicitLeft = 3
    ExplicitTop = 63
    ExplicitWidth = 978
  end
  object pnlTop: TPanel
    Left = 7
    Top = 0
    Width = 977
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 12
    Padding.Bottom = 3
    TabOrder = 0
    object btnAbout: TSpeedButton
      AlignWithMargins = True
      Left = 935
      Top = 14
      Width = 27
      Height = 27
      Margins.Top = 11
      Margins.Bottom = 11
      Align = alRight
      ImageIndex = 9
      ImageName = 'info'
      Images = svgBtnList
      Flat = True
      OnClick = btnAboutClick
      ExplicitLeft = 939
      ExplicitTop = 6
      ExplicitHeight = 43
    end
    object pnlTopLogo: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 3
      Width = 80
      Height = 49
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object svgLogo: TSVGIconImage
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 74
        Height = 30
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 6
        Margins.Bottom = 0
        AutoSize = False
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0' +
          ' 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" ' +
          'fill="none"/><path d="M16.66 4.52l2.83 2.83-2.83 2.83-2.83-2.83 ' +
          '2.83-2.83M9 5v4H5V5h4m10 10v4h-4v-4h4M9 15v4H5v-4h4m7.66-13.31L1' +
          '1 7.34 16.66 13l5.66-5.66-5.66-5.65zM11 3H3v8h8V3zm10 10h-8v8h8v' +
          '-8zm-10 0H3v8h8v-8z"/></svg>'
        FixedColor = clLightgray
        Align = alTop
      end
      object lblLogo: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 35
        Width = 74
        Height = 14
        Margins.Top = 0
        Margins.Bottom = 0
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
  end
  object stbMain: TStatusBar
    AlignWithMargins = True
    Left = 10
    Top = 589
    Width = 971
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
  object pnlContainer: TPanel
    Left = 7
    Top = 62
    Width = 977
    Height = 524
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object pnlActions: TPanel
      AlignWithMargins = True
      Left = 754
      Top = 3
      Width = 220
      Height = 518
      Align = alRight
      BevelOuter = bvNone
      Padding.Top = 2
      TabOrder = 0
      object pnlActionsHeader: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 214
        Height = 35
        Margins.Bottom = 0
        Align = alTop
        Alignment = taLeftJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Padding.Left = 7
        Padding.Top = 5
        Padding.Right = 5
        ParentFont = False
        TabOrder = 0
        object lblActionsHeader: TLabel
          AlignWithMargins = True
          Left = 11
          Top = 9
          Width = 41
          Height = 22
          Align = alLeft
          Caption = 'Actions'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitHeight = 15
        end
      end
      object pnlAnalyse: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 40
        Width = 214
        Height = 120
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alTop
        Padding.Left = 7
        Padding.Top = 3
        Padding.Right = 7
        Padding.Bottom = 3
        TabOrder = 1
        object lblAnalyse: TLabel
          AlignWithMargins = True
          Left = 11
          Top = 7
          Width = 192
          Height = 15
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Analyse'
          ExplicitWidth = 41
        end
        object btnDuplicates: TBitBtn
          AlignWithMargins = True
          Left = 11
          Top = 31
          Width = 192
          Height = 35
          Margins.Top = 4
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Find Duplicates'
          ImageIndex = 3
          ImageName = 'duplicates'
          Images = svgBtnList
          TabOrder = 0
        end
        object btnViewer: TBitBtn
          AlignWithMargins = True
          Left = 11
          Top = 72
          Width = 192
          Height = 35
          Margins.Top = 4
          Margins.Bottom = 2
          Align = alTop
          Caption = 'Viewer Mode'
          ImageIndex = 5
          ImageName = 'preview'
          Images = svgBtnList
          TabOrder = 1
        end
      end
      object pnlOperations: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 160
        Width = 214
        Height = 180
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alTop
        Padding.Left = 7
        Padding.Top = 3
        Padding.Right = 7
        Padding.Bottom = 3
        TabOrder = 2
        object lblOperations: TLabel
          AlignWithMargins = True
          Left = 11
          Top = 7
          Width = 192
          Height = 15
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Operations'
          ExplicitWidth = 58
        end
        object lblTarget: TLabel
          AlignWithMargins = True
          Left = 11
          Top = 76
          Width = 192
          Height = 15
          Align = alTop
          Caption = 'Target'
          ExplicitWidth = 32
        end
        object rbMove: TRadioButton
          AlignWithMargins = True
          Left = 11
          Top = 30
          Width = 192
          Height = 17
          Align = alTop
          Caption = 'Move'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbMoveClick
        end
        object rbCopy: TRadioButton
          Tag = 1
          AlignWithMargins = True
          Left = 11
          Top = 53
          Width = 192
          Height = 17
          Align = alTop
          Caption = 'Copy'
          TabOrder = 1
          OnClick = rbMoveClick
        end
        object pnlTarget: TPanel
          AlignWithMargins = True
          Left = 11
          Top = 97
          Width = 192
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          Caption = 'pnlTarget'
          TabOrder = 2
          object edTargetFolder: TEdit
            Left = 0
            Top = 0
            Width = 157
            Height = 27
            Align = alClient
            ReadOnly = True
            TabOrder = 0
            Text = ' Select a target folder path...'
            ExplicitHeight = 23
          end
          object btnTarget: TBitBtn
            Left = 157
            Top = 0
            Width = 35
            Height = 27
            Align = alRight
            ImageIndex = 0
            ImageName = 'folder-open'
            Images = svgBtnList
            TabOrder = 1
            OnClick = btnTargetClick
          end
        end
        object btnExecute: TBitBtn
          AlignWithMargins = True
          Left = 11
          Top = 132
          Width = 192
          Height = 35
          Margins.Top = 5
          Align = alTop
          Caption = 'Execute'
          ImageIndex = 10
          ImageName = 'sync'
          Images = svgBtnList
          TabOrder = 3
          StyleName = 'Carbon'
          OnClick = btnExecuteClick
        end
      end
      object pnlReports: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 340
        Width = 214
        Height = 80
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alTop
        Padding.Left = 7
        Padding.Top = 3
        Padding.Right = 7
        Padding.Bottom = 3
        TabOrder = 3
        object lblReports: TLabel
          AlignWithMargins = True
          Left = 11
          Top = 7
          Width = 192
          Height = 15
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Reports'
          ExplicitWidth = 40
        end
        object btnLog: TBitBtn
          AlignWithMargins = True
          Left = 11
          Top = 30
          Width = 192
          Height = 35
          Align = alTop
          Caption = 'Events Log'
          ImageIndex = 8
          ImageName = 'description'
          Images = svgBtnList
          TabOrder = 0
          OnClick = btnLogClick
        end
      end
    end
    object pnlMain: TPanel
      Left = 0
      Top = 0
      Width = 751
      Height = 524
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object pnlSource: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 745
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnSource: TBitBtn
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 80
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
        object btnDeselectAll: TBitBtn
          AlignWithMargins = True
          Left = 647
          Top = 4
          Width = 95
          Height = 27
          Margins.Top = 4
          Margins.Bottom = 2
          Align = alRight
          Caption = 'Deselect All'
          ImageIndex = 7
          ImageName = 'checkbox-blank'
          Images = svgBtnList
          TabOrder = 1
        end
        object btnSelectAll: TBitBtn
          AlignWithMargins = True
          Left = 546
          Top = 4
          Width = 95
          Height = 27
          Margins.Top = 4
          Margins.Bottom = 2
          Align = alRight
          Caption = 'Select All'
          ImageIndex = 6
          ImageName = 'checkbox'
          Images = svgBtnList
          TabOrder = 2
        end
        object edSourceFolder: TEdit
          AlignWithMargins = True
          Left = 89
          Top = 3
          Width = 451
          Height = 27
          Align = alClient
          AutoSelect = False
          ReadOnly = True
          TabOrder = 3
          Text = ' Select a source folder path...'
          ExplicitHeight = 23
        end
      end
      object pnlFiles: TPanel
        Left = 0
        Top = 39
        Width = 751
        Height = 485
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object pnlFilters: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 220
          Height = 479
          Align = alLeft
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object pnlFiltersHeader: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 214
            Height = 35
            Margins.Bottom = 0
            Align = alTop
            Alignment = taLeftJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            Padding.Left = 7
            Padding.Top = 5
            Padding.Right = 5
            ParentFont = False
            TabOrder = 0
            object lblFilters: TLabel
              AlignWithMargins = True
              Left = 11
              Top = 9
              Width = 34
              Height = 22
              Align = alLeft
              Caption = 'Filters'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitHeight = 15
            end
          end
          object pnlFileTypes: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 38
            Width = 214
            Height = 115
            Margins.Top = 0
            Margins.Bottom = 0
            Align = alTop
            Padding.Left = 7
            Padding.Top = 3
            Padding.Bottom = 3
            TabOrder = 1
            object lblFileType: TLabel
              AlignWithMargins = True
              Left = 11
              Top = 7
              Width = 199
              Height = 15
              Margins.Bottom = 5
              Align = alTop
              Caption = 'File Type'
              ExplicitWidth = 45
            end
            object chkJpg: TCheckBox
              AlignWithMargins = True
              Left = 11
              Top = 28
              Width = 199
              Height = 24
              Hint = '.jpg'
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              Caption = 'JPG'
              TabOrder = 0
            end
            object chkPng: TCheckBox
              AlignWithMargins = True
              Left = 11
              Top = 54
              Width = 199
              Height = 24
              Hint = '.png'
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              Caption = 'PNG'
              TabOrder = 1
            end
            object chkGif: TCheckBox
              AlignWithMargins = True
              Left = 11
              Top = 80
              Width = 199
              Height = 24
              Hint = '.gif'
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              Caption = 'GIF'
              TabOrder = 2
            end
          end
          object pnlOrientation: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 153
            Width = 214
            Height = 115
            Margins.Top = 0
            Margins.Bottom = 0
            Align = alTop
            Padding.Left = 7
            Padding.Top = 3
            Padding.Bottom = 3
            TabOrder = 2
            object lblOrientation: TLabel
              AlignWithMargins = True
              Left = 11
              Top = 7
              Width = 199
              Height = 15
              Margins.Bottom = 5
              Align = alTop
              Caption = 'Orientation'
              ExplicitWidth = 60
            end
            object chkLandscape: TCheckBox
              AlignWithMargins = True
              Left = 11
              Top = 28
              Width = 199
              Height = 24
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              Caption = 'Landscape'
              TabOrder = 0
            end
            object chkPortrait: TCheckBox
              Tag = 1
              AlignWithMargins = True
              Left = 11
              Top = 54
              Width = 199
              Height = 24
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              Caption = 'Portrait'
              TabOrder = 1
            end
            object chkSquare: TCheckBox
              Tag = 2
              AlignWithMargins = True
              Left = 11
              Top = 80
              Width = 199
              Height = 24
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              Caption = 'Square'
              TabOrder = 2
            end
          end
          object pnlFiltersOther: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 268
            Width = 214
            Height = 65
            Margins.Top = 0
            Margins.Bottom = 0
            Align = alTop
            Padding.Left = 7
            Padding.Top = 3
            Padding.Bottom = 3
            TabOrder = 3
            object lblFiltersOther: TLabel
              AlignWithMargins = True
              Left = 11
              Top = 7
              Width = 199
              Height = 15
              Margins.Bottom = 5
              Align = alTop
              Caption = 'Other'
              ExplicitWidth = 30
            end
            object chkHasExif: TCheckBox
              AlignWithMargins = True
              Left = 11
              Top = 28
              Width = 199
              Height = 24
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              Caption = 'Has EXIF'
              TabOrder = 0
            end
          end
        end
        object lvwItems: TListView
          AlignWithMargins = True
          Left = 232
          Top = 5
          Width = 513
          Height = 477
          Margins.Left = 6
          Margins.Top = 5
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
                -591)
            end>
          DoubleBuffered = True
          FlatScrollBars = True
          ReadOnly = True
          RowSelect = True
          ParentDoubleBuffered = False
          SmallImages = imlThumbnails
          TabOrder = 1
          ViewStyle = vsReport
        end
      end
    end
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
      end
      item
        IconName = 'description'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0' +
          ' 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" ' +
          'fill="none"/><path d="M8 16h8v2H8zm0-4h8v2H8zm6-10H6c-1.1 0-2 .9' +
          '-2 2v16c0 1.1.89 2 1.99 2H18c1.1 0 2-.9 2-2V8l-6-6zm4 18H6V4h7v5' +
          'h5v11z"/></svg>'
        FixedColor = clLightgray
      end
      item
        IconName = 'info'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0' +
          ' 0 24 24" width="24px" fill="#1f1f1f"><path d="M0 0h24v24H0V0z" ' +
          'fill="none"/><path d="M11 7h2v2h-2zm0 4h2v6h-2zm1-9C6.48 2 2 6.4' +
          '8 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-' +
          '3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z"/></svg>'
        FixedColor = clLightgray
      end
      item
        IconName = 'sync'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" enable-background="new 0' +
          ' 0 24 24" height="24px" viewBox="0 0 24 24" width="24px" fill="#' +
          '1f1f1f"><g><rect fill="none" height="24" width="24" x="0"/></g><' +
          'g><g><polygon points="7.41,13.41 6,12 2,16 6,20 7.41,18.59 5.83,' +
          '17 21,17 21,15 5.83,15"/><polygon points="16.59,10.59 18,12 22,8' +
          ' 18,4 16.59,5.41 18.17,7 3,7 3,9 18.17,9"/></g></g></svg>'
        FixedColor = clLightgray
      end>
    Scaled = True
    Left = 680
    Top = 384
  end
  object imlThumbnails: TImageList
    Height = 48
    Width = 48
    Left = 277
    Top = 289
  end
end
