object fmMain: TfmMain
  Left = 0
  Top = 0
  Margins.Left = 16
  Margins.Top = 0
  Margins.Right = 0
  Caption = 'PhotoSweep'
  ClientHeight = 611
  ClientWidth = 984
  Color = clBtnFace
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
    Margins.Bottom = 8
    Align = alTop
    Shape = bsBottomLine
    ExplicitLeft = 0
    ExplicitTop = 60
    ExplicitWidth = 624
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
    object lblSource: TLabel
      AlignWithMargins = True
      Left = 106
      Top = 22
      Width = 603
      Height = 27
      Margins.Left = 16
      Margins.Top = 14
      Align = alClient
      Alignment = taCenter
      Caption = 'Select a source folder to browse the photos'#8230
      ExplicitWidth = 236
      ExplicitHeight = 15
    end
    object pnlTopLogo: TPanel
      Left = 12
      Top = 8
      Width = 78
      Height = 44
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 0
      object svgLogo: TSVGIconImage
        AlignWithMargins = True
        Left = 0
        Top = 4
        Width = 72
        Height = 22
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 0
        AutoSize = False
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0' +
          ' 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">' +
          #13#10'  <path stroke-linecap="round" stroke-linejoin="round" d="M6.8' +
          '27 6.175A2.31 2.31 0 0 1 5.186 7.23c-.38.054-.757.112-1.134.175C' +
          '2.999 7.58 2.25 8.507 2.25 9.574V18a2.25 2.25 0 0 0 2.25 2.25h15' +
          'A2.25 2.25 0 0 0 21.75 18V9.574c0-1.067-.75-1.994-1.802-2.169a47' +
          '.865 47.865 0 0 0-1.134-.175 2.31 2.31 0 0 1-1.64-1.055l-.822-1.' +
          '316a2.192 2.192 0 0 0-1.736-1.039 48.774 48.774 0 0 0-5.232 0 2.' +
          '192 2.192 0 0 0-1.736 1.039l-.821 1.316Z" />'#13#10'  <path stroke-lin' +
          'ecap="round" stroke-linejoin="round" d="M16.5 12.75a4.5 4.5 0 1 ' +
          '1-9 0 4.5 4.5 0 0 1 9 0ZM18.75 10.5h.008v.008h-.008V10.5Z" />'#13#10'<' +
          '/svg>'#13#10
        FixedColor = clLightgray
        Align = alTop
      end
      object lblLogo: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 27
        Width = 72
        Height = 15
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alBottom
        Caption = 'PhotoSweep'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Roboto'
        Font.Style = []
        ParentFont = False
        ExplicitTop = 30
      end
    end
    object btnAbout: TBitBtn
      AlignWithMargins = True
      Left = 887
      Top = 16
      Width = 85
      Height = 28
      Margins.Top = 8
      Margins.Right = 0
      Margins.Bottom = 8
      Align = alRight
      Caption = 'About'
      ImageIndex = 0
      ImageName = 'information-circle'
      Images = svgBtnList
      TabOrder = 2
    end
    object btnSource: TBitBtn
      AlignWithMargins = True
      Left = 796
      Top = 16
      Width = 85
      Height = 28
      Margins.Top = 8
      Margins.Bottom = 8
      Align = alRight
      Caption = 'Browse...'
      ImageIndex = 1
      ImageName = 'folder-open'
      Images = svgBtnList
      TabOrder = 1
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 715
      Top = 16
      Width = 75
      Height = 28
      Margins.Top = 8
      Margins.Bottom = 8
      Align = alRight
      Caption = 'Test'
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object stbMain: TStatusBar
    Left = 0
    Top = 592
    Width = 984
    Height = 19
    Enabled = False
    Panels = <>
  end
  object MainPanel: TPanel
    Left = 0
    Top = 72
    Width = 984
    Height = 520
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object pnlFiles: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 692
      Height = 514
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object lvwImgItems: TListView
        Left = 0
        Top = 0
        Width = 692
        Height = 514
        Align = alClient
        Checkboxes = True
        Columns = <
          item
            AutoSize = True
            Caption = 'File Name'
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
            Caption = 'Resolution'
            Width = 100
          end
          item
            Alignment = taCenter
            Caption = 'MP'
            Width = 70
          end
          item
            Alignment = taRightJustify
            Caption = 'Size'
            Width = 75
          end
          item
            Alignment = taCenter
            Caption = 'Extension'
            Width = 75
          end
          item
            Caption = 'Orientation'
            Width = 75
          end
          item
            Alignment = taCenter
            Caption = 'Has EXIF'
            Width = 75
          end>
        DoubleBuffered = True
        ReadOnly = True
        RowSelect = True
        ParentDoubleBuffered = False
        SmallImages = imlThumbnails
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object pnlTools: TPanel
      AlignWithMargins = True
      Left = 706
      Top = 3
      Width = 275
      Height = 514
      Margins.Left = 8
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      Visible = False
      object pnlModeBtns: TPanel
        Left = 0
        Top = 0
        Width = 275
        Height = 31
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnSort: TBitBtn
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 133
          Height = 28
          Margins.Left = 0
          Margins.Top = 0
          Align = alLeft
          Caption = 'Sort'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ImageIndex = 2
          ImageName = 'arrows-up-down'
          Images = svgBtnList
          ParentFont = False
          TabOrder = 0
        end
        object btnDuplicates: TBitBtn
          AlignWithMargins = True
          Left = 139
          Top = 0
          Width = 133
          Height = 28
          Margins.Left = 0
          Margins.Top = 0
          Align = alRight
          Caption = 'Duplicates'
          ImageIndex = 3
          ImageName = 'document-duplicate'
          Images = svgBtnList
          TabOrder = 1
        end
      end
      object pnlToolsHost: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 36
        Width = 269
        Height = 475
        Margins.Top = 5
        Align = alClient
        BevelOuter = bvNone
        Caption = 'imlThumbnails'
        TabOrder = 1
      end
    end
  end
  object svgBtnList: TSVGIconImageList
    SVGIconItems = <
      item
        IconName = 'information-circle'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0' +
          ' 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">' +
          #13#10'  <path stroke-linecap="round" stroke-linejoin="round" d="m11.' +
          '25 11.25.041-.02a.75.75 0 0 1 1.063.852l-.708 2.836a.75.75 0 0 0' +
          ' 1.063.853l.041-.021M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9-3.7' +
          '5h.008v.008H12V8.25Z" />'#13#10'</svg>'#13#10
        FixedColor = clLightgray
      end
      item
        IconName = 'folder-open'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0' +
          ' 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">' +
          #13#10'  <path stroke-linecap="round" stroke-linejoin="round" d="M3.7' +
          '5 9.776c.112-.017.227-.026.344-.026h15.812c.117 0 .232.009.344.0' +
          '26m-16.5 0a2.25 2.25 0 0 0-1.883 2.542l.857 6a2.25 2.25 0 0 0 2.' +
          '227 1.932H19.05a2.25 2.25 0 0 0 2.227-1.932l.857-6a2.25 2.25 0 0' +
          ' 0-1.883-2.542m-16.5 0V6A2.25 2.25 0 0 1 6 3.75h3.879a1.5 1.5 0 ' +
          '0 1 1.06.44l2.122 2.12a1.5 1.5 0 0 0 1.06.44H18A2.25 2.25 0 0 1 ' +
          '20.25 9v.776" />'#13#10'</svg>'#13#10
        FixedColor = clLightgray
      end
      item
        IconName = 'arrows-up-down'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0' +
          ' 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">' +
          #13#10'  <path stroke-linecap="round" stroke-linejoin="round" d="M3 7' +
          '.5 7.5 3m0 0L12 7.5M7.5 3v13.5m13.5 0L16.5 21m0 0L12 16.5m4.5 4.' +
          '5V7.5" />'#13#10'</svg>'#13#10
        FixedColor = clLightgray
      end
      item
        IconName = 'document-duplicate'
        SVGText = 
          '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0' +
          ' 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">' +
          #13#10'  <path stroke-linecap="round" stroke-linejoin="round" d="M15.' +
          '75 17.25v3.375c0 .621-.504 1.125-1.125 1.125h-9.75a1.125 1.125 0' +
          ' 0 1-1.125-1.125V7.875c0-.621.504-1.125 1.125-1.125H6.75a9.06 9.' +
          '06 0 0 1 1.5.124m7.5 10.376h3.375c.621 0 1.125-.504 1.125-1.125V' +
          '11.25c0-4.46-3.243-8.161-7.5-8.876a9.06 9.06 0 0 0-1.5-.124H9.37' +
          '5c-.621 0-1.125.504-1.125 1.125v3.5m7.5 10.375H9.375a1.125 1.125' +
          ' 0 0 1-1.125-1.125v-9.25m12 6.625v-1.875a3.375 3.375 0 0 0-3.375' +
          '-3.375h-1.5a1.125 1.125 0 0 1-1.125-1.125v-1.5a3.375 3.375 0 0 0' +
          '-3.375-3.375H9.75" />'#13#10'</svg>'#13#10
        FixedColor = clLightgray
      end>
    Scaled = True
    Left = 720
    Top = 120
  end
  object imlThumbnails: TImageList
    Height = 48
    Width = 48
    Left = 725
    Top = 199
  end
end
