unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, SVGIconImage, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, SVGIconImageListBase, SVGIconImageList,
  Vcl.Buttons, Vcl.ComCtrls,
  System.IOUtils,
  System.Types,
  uListViewController, uSelectionController, uFilterController, uDuplicatesController,
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
    btnDuplicates: TBitBtn;
    pnlTarget: TPanel;
    Label1: TLabel;
    btnTarget: TBitBtn;
    pnlTools2: TPanel;
    bvlTools: TBevel;
    lvwItems: TListView;
    pnlSelectBtns: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    chkJpg: TCheckBox;
    chkPng: TCheckBox;
    chkGif: TCheckBox;
    chkLandscape: TCheckBox;
    chkPortrait: TCheckBox;
    chkSquare: TCheckBox;
    chkHasExif: TCheckBox;
    btnViewer: TBitBtn;
    btnSelectAll: TBitBtn;
    btnDeselectAll: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSourceClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FDuplicatesController: TDuplicatesController;
    FListViewController: TListViewController;
    FSelectionController: TSelectionController;
    FFilterController: TFilterController;
    FFilterSet: TFilterSet;
    FItemsManager: TItemsManager;
    FReader: IFileMetadataReader;

    procedure LoadData;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.FormCreate(Sender: TObject);
begin
  FListViewController := TListViewController.Create(
    lvwItems, stbMain, imlThumbnails, btnViewer
  );
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

  FDuplicatesController := TDuplicatesController.Create(
    FItemsManager,
    btnDuplicates
  );
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
  FDuplicatesController.Free;
  FSelectionController.Free;
  FListViewController.Free;
  FFilterController.Free;
  FFilterSet.Free;
  FItemsManager.Free;
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TfmMain.btnSourceClick(Sender: TObject);
//var
//  Files: TStringDynArray;
begin
  LoadData;
//  FListViewController.Clear;
//  FItemsManager.Clear;
//
//  Files := ReadFolder('C:\source4');
//
//  pnlBottom.Enabled := True;
//
//  TFileScanThread.Create(Files, FReader,
//    procedure(Meta: TFileMetadata)
//    begin
//      FItemsManager.AddItem(Meta);
//    end,
//    procedure
//    begin
//      FListViewController.Build(FItemsManager);
//    end
//  );
end;

procedure TfmMain.LoadData;
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

end.
