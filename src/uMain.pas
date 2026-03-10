unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, SVGIconImage, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, SVGIconImageListBase, SVGIconImageList,
  Vcl.Buttons, Vcl.ComCtrls, System.IOUtils, System.Types,
  uToolsPanelController,
  uImgItem,
  uIImgMetadataReader,
  uImgMetadataReader
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
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FToolsController: TToolsPanelController;
  public
    { Public declarations }
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
  Meta: TImgMetadata;
  Reader: TImgMetadataReader;

  Item: TListItem;
  Img: TImgItem;

begin
  pnlTools.Show;

  lvwImgItems.Items.BeginUpdate;
  try
    lvwImgItems.Items.Clear;
    Files := TDirectory.GetFiles('C:\source4', '*.jpg'); // пример

    Reader := TImgMetadataReader.Create;

    for var FilePath in Files do
    begin
      Meta := Reader.Read(FilePath);

    {
      Jpeg := TJpegImageEx.Create;
      try
        Jpeg.LoadFromFile(FilePath);

        Meta.Width := Jpeg.Width;
        Meta.Height := Jpeg.Height;

        if Meta.Width > Meta.Height then
          Meta.Orientation := poLandscape
        else if Meta.Height > Meta.Width then
          Meta.Orientation := poPortrait
        else
          Meta.Orientation := poSquare;

        Meta.HasExif := Assigned(Jpeg.ExifData);

        if Meta.HasExif then
        begin
          Meta.CameraMake := Jpeg.ExifData.CameraMake;
          Meta.CameraModel := Jpeg.ExifData.CameraModel;


          if Jpeg.ExifData.DateTimeOriginal > 0 then
            Meta.DateTimeOriginal := Jpeg.ExifData.DateTimeOriginal
          else
            Meta.DateTimeOriginal := TFile.GetLastWriteTime(FilePath);
        end
        else
        begin
          Meta.CameraMake := '';
          Meta.DateTimeOriginal := TFile.GetLastWriteTime(FilePath);
        end;

      finally
        Jpeg.Free;
      end;
      }
     {
      Meta.Width := 4000;
      Meta.Height := 3000;
      Meta.HasExif := True;
      Meta.CameraMake := 'Canon R6';
      Meta.DateTimeOriginal := Now;
      Meta.Orientation := poLandscape;
      }

      Img := TImgItem.Create(FilePath, Meta);

      Item := lvwImgItems.Items.Add;
      Item.Caption := Img.FileName;
      Item.SubItems.Add(DateToStr(Img.DateTimeOriginal));
      Item.SubItems.Add(Img.FullDeviceName);
      Item.SubItems.Add(Img.Resolution);
      Item.SubItems.Add(FloatToStr(Img.MegaPixels));
      Item.SubItems.Add(Img.OrientationText);
      Item.SubItems.Add(Img.FormattedFileSize);
      if Img.HasExif then
        Item.SubItems.Add('Yes')
      else
        Item.SubItems.Add('No');

    end;
  finally
    lvwImgItems.Items.EndUpdate;
  end;
end;

end.
