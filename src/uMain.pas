unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, SVGIconImage, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, SVGIconImageListBase, SVGIconImageList,
  Vcl.Buttons, Vcl.ComCtrls,
  System.IOUtils,
  System.Types,
  uToolsPanelController,
  uListViewController,
  uItem,
  uFileScanThread,
  uFileMetadata,
  uIFileMetadataReader,
  uFileMetadataReader,
  uItemsManager,
  uFileUtils
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
    procedure FormDestroy(Sender: TObject);
  private
    FToolsController: TToolsPanelController;
    FListViewController: TListViewController;
    FItemsManager: TItemsManager;
    FReader: IFileMetadataReader;
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

  FListViewController := TListViewController.Create(lvwImgItems, imlThumbnails);
  FItemsManager := TItemsManager.Create;
  FReader := TFileMetadataReader.Create;
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
  FListViewController.Free;
  FItemsManager.Free;
  FToolsController.Free;
end;

procedure TfmMain.Button1Click(Sender: TObject);
var
  Files: TStringDynArray;
begin
  pnlTools.Show;
  FListViewController.Clear;
  FItemsManager.Clear;

  Files := GetItemFiles('C:\source4');

  TFileScanThread.Create(Files, FReader,
    procedure(Meta: TFileMetadata)
    begin
      FItemsManager.AddItem(Meta);
    end,
    procedure
    begin
      FListViewController.Build(FItemsManager);
    end
  );
end;

{
  without classes...
  pnlTools.Show;
  FreeListView(lvwImgItems);
  lvwImgItems.Items.BeginUpdate;
  try
    Files := TDirectory.GetFiles('C:\source4', '*.jpg');
    Reader := TFileMetadataReader.Create;

    TFileScanThread.Create(Files, Reader,
      procedure(Meta: TFileMetadata)
      var
        Img: TItem;
        Item: TListItem;
      begin
        Img := TItem.Create(Meta.FilePath, Meta);
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
          Thumb := CreateSquareThumbnail(Img.Thumbnail, 48);
            Item.ImageIndex := imlThumbnails.Add(Thumb, nil);
        end
        else
          begin
            Item.SubItems.Add('No thumb');
            Item.ImageIndex := -1;
          end;
      end
    );

  finally
    lvwImgItems.Items.EndUpdate;
  end;
}

end.
