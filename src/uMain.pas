unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, SVGIconImage, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, SVGIconImageListBase, SVGIconImageList,
  Vcl.Buttons, Vcl.ComCtrls, System.IOUtils, System.Types,
  uToolsPanelController,
  uImgItem,
  uFileScanThread,
//  uIImgMetadataReader,
  uFileMetadata,
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
  // Meta: TImgMetadata;
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
      end
    );

  finally
    lvwImgItems.Items.EndUpdate;
  end;
end;

end.
