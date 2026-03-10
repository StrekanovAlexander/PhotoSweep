unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, SVGIconImage, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, SVGIconImageListBase, SVGIconImageList,
  Vcl.Buttons, Vcl.ComCtrls, System.IOUtils, System.Types,
  Vcl.Imaging.jpeg, System.Math, // temp
  uToolsPanelController,
  uImgItem,
  uFileScanThread,
  uFileMetadata,
  uFileMetadataReader
;

type
  TAppMode = (amSort, amDuplicates);

  TfmMain = class(TForm)
    pnlTop: TPanel;
    bvlTop: TBevel;
    pnlTopLogo: TPanel;
    svgLogo: TSVGIconImage;
    lblLogo: TLabel;
    btnAbout: TBitBtn;
    svgBtnList: TSVGIconImageList;
    lblSource: TLabel;
    btnSource: TBitBtn;
    stbMain: TStatusBar;
    MainPanel: TPanel;
    pnlFiles: TPanel;
    pnlTools: TPanel;
    pnlModeBtns: TPanel;
    btnSort: TBitBtn;
    btnDuplicates: TBitBtn;
    lvwImgItems: TListView;
    pnlToolsHost: TPanel;
    Button1: TButton;
    imlThumbnails: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FToolsController: TToolsPanelController;
  public
    { Public declarations }
    function ResizeBitmapToWidth(Source: TBitmap; NewWidth: Integer): TBitmap; // tmp
    function CreateSquareThumbnail(Source: TBitmap; Size: Integer): TBitmap;
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.FormCreate(Sender: TObject);
begin
  FToolsController := TToolsPanelController.Create(
    Self,
    pnlToolsHost,
    btnSort,
    btnDuplicates
  );
end;

procedure TfmMain.Button1Click(Sender: TObject);
var
  Files: TStringDynArray;
  Reader: TFileMetadataReader;
  Thumb: TBitmap;
begin
  pnlTools.Show;

  lvwImgItems.Items.BeginUpdate;
  try
    lvwImgItems.Items.Clear;
    Files := TDirectory.GetFiles('C:\source4', '*.jpg');
    Reader := TFileMetadataReader.Create;

    TFileScanThread.Create(Files, Reader,
      procedure(Meta: TFileMetadata)
      var
        Img: TImgItem;
        Item: TListItem;
      begin
        Img := TImgItem.Create(Meta.FilePath, Meta);
        Item := lvwImgItems.Items.Add;
        Item.Caption := Img.FileName;
        Item.SubItems.Add(DateToStr(Img.DateTimeOriginal));
        Item.SubItems.Add(Img.FullDeviceName);
        Item.SubItems.Add(Img.Resolution);
        Item.SubItems.Add(FloatToStr(Img.MegaPixels));
        if Img.HasExif then
          Item.SubItems.Add('Yes')
        else
          Item.SubItems.Add('No');

        if Img.HasThumbnail and Assigned(Img.Thumbnail) then
        begin
          Item.SubItems.Add('Thumb');
          Thumb := CreateSquareThumbnail(Img.Thumbnail, 65);
            Item.ImageIndex := imlThumbnails.Add(Thumb, nil);
        end
        else
          Item.SubItems.Add('No thumb');
      end
    );

  finally
    lvwImgItems.Items.EndUpdate;
  end;
end;

function TfmMain.ResizeBitmapToWidth(Source: TBitmap; NewWidth: Integer): TBitmap;
var
  NewHeight: Integer;
begin
  Result := TBitmap.Create;

  NewHeight := Round(Source.Height * (NewWidth / Source.Width));

  Result.SetSize(NewWidth, NewHeight);
  Result.PixelFormat := pf24bit;

  Result.Canvas.StretchDraw(
    Rect(0, 0, NewWidth, NewHeight),
    Source
  );
end;

function TfmMain.CreateSquareThumbnail(Source: TBitmap; Size: Integer): TBitmap;
var
  Scale: Double;
  NewW, NewH: Integer;
  X, Y: Integer;
begin
  Result := TBitmap.Create;
  Result.SetSize(Size, Size);
  Result.PixelFormat := pf24bit;

  // белый фон
  Result.Canvas.Brush.Color := clWhite;
  Result.Canvas.FillRect(Rect(0, 0, Size, Size));

  // вычисляем масштаб
  Scale := Min(Size / Source.Width, Size / Source.Height);

  NewW := Round(Source.Width * Scale);
  NewH := Round(Source.Height * Scale);

  // центрируем
  X := (Size - NewW) div 2;
  Y := (Size - NewH) div 2;

  Result.Canvas.StretchDraw(
    Rect(X, Y, X + NewW, Y + NewH),
    Source
  );
end;

end.
