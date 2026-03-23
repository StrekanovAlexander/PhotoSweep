unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, SVGIconImage, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, SVGIconImageListBase, SVGIconImageList,
  Vcl.Buttons, Vcl.ComCtrls,
  System.IOUtils,
  System.Types,
  uListViewController, uSelectionController, uFilterController,
  uItem,
  uFileScanThread,
  uFileMetadata,
  uIFileMetadataReader,
  uFileMetadataReader,
  uItemsManager,
  uFileUtils,
  uFilterSet
;

type
  TAppMode = (amSort, amDuplicates);

  TfmMain = class(TForm)
    pnlTop: TPanel;
    pnlTopLogo: TPanel;
    svgLogo: TSVGIconImage;
    lblLogo: TLabel;
    svgBtnList: TSVGIconImageList;
    stbMain: TStatusBar;
    imlThumbnails: TImageList;
    bvlTop: TBevel;
    btnAbout: TBitBtn;
    pnlSource: TPanel;
    btnSource: TBitBtn;
    lblSource: TLabel;
    pnlBottom: TPanel;
    pnlButtons: TPanel;
    btnMove: TBitBtn;
    btnCopy: TBitBtn;
    btnDupl: TBitBtn;
    pnlTarget: TPanel;
    Label1: TLabel;
    btnTarget: TBitBtn;
    pnlTools2: TPanel;
    bvlTools: TBevel;
    lvwItems: TListView;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    chkJpg: TCheckBox;
    chkPng: TCheckBox;
    chkGif: TCheckBox;
    chkLandscape: TCheckBox;
    chkPortrait: TCheckBox;
    chkSquare: TCheckBox;
    chkHasExif: TCheckBox;
    btnPreview: TBitBtn;
    btnSelectAll: TBitBtn;
    btnDeselectAll: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSourceClick(Sender: TObject);
  private
    FListViewController: TListViewController;
    FSelectionController: TSelectionController;
    FFilterController: TFilterController;
    FFilterSet: TFilterSet;
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
  FListViewController := TListViewController.Create(lvwItems, stbMain, imlThumbnails);
  FSelectionController := TSelectionController.Create(
    btnSelectAll, btnDeselectAll, lvwItems, stbMain
  );

  FFilterSet := TFilterSet.Create;

  FItemsManager := TItemsManager.Create;
  FReader := TFileMetadataReader.Create;

  FFilterController := TFilterController.Create(
    FItemsManager,
    FFilterSet,
    FListViewController,
    chkHasExif,
    chkLandscape, chkPortrait, chkSquare,
    chkJpg, chkPng, chkGif
  );
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
  FSelectionController.Free;
  FListViewController.Free;
  FFilterController.Free;
  FFilterSet.Free;
  FItemsManager.Free;
end;

procedure TfmMain.btnSourceClick(Sender: TObject);
var
  Files: TStringDynArray;
begin
  FListViewController.Clear;
  FItemsManager.Clear;

  Files := ReadFolder('C:\source4');

  pnlBottom.Enabled := True;

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
