unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, SVGIconImage, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, SVGIconImageListBase, SVGIconImageList,
  Vcl.Buttons, Vcl.ComCtrls,
  System.IOUtils,
  System.Types,
  uListViewController, uSelectionController,
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
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    btnPreview: TBitBtn;
    chkSelectAll: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSourceClick(Sender: TObject);
  private
    FListViewController: TListViewController;
    FSelectionController: TSelectionController;
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
  FSelectionController := TSelectionController.Create(chkSelectAll, lvwItems, stbMain);
  FItemsManager := TItemsManager.Create;
  FReader := TFileMetadataReader.Create;
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
  FSelectionController.Free;
  FListViewController.Free;
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
