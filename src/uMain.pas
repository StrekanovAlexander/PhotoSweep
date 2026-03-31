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
  uDuplicatesController, uFileController,
  uItem, uLogger,
  uFileScanThread,
  uFileMetadata,
  uIFileMetadataReader,
  uFileMetadataReader,
  uItemsManager,
  uFileUtils,
  uFilterSet,
  uLog
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
    lblSourceFolder: TLabel;
    pnlBottom: TPanel;
    pnlButtons: TPanel;
    btnMove: TBitBtn;
    btnCopy: TBitBtn;
    btnDuplicates: TBitBtn;
    pnlTarget: TPanel;
    lblTargetFolder: TLabel;
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
    btnLog: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSourceClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLogClick(Sender: TObject);
  private
    FDuplicatesController: TDuplicatesController;
    FListViewController: TListViewController;
    FSelectionController: TSelectionController;
    FFilterController: TFilterController;
    FFileController: TFileController;
    FFilterSet: TFilterSet;
    FItemsManager: TItemsManager;
    FReader: IFileMetadataReader;

    FSourceFolder: string;
    FTargetFolder: string;

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
    FListViewController,
    btnDuplicates
  );

  FSourceFolder := 'C:\source4';
  FTargetFolder := 'C:\target4';

  lblSourceFolder.Caption := FSourceFolder;
  lblTargetFolder.Caption := FTargetFolder;

  FFileController := TFileController.Create(
    FItemsManager,
    FListViewController,
    FSourceFolder,
    FTargetFolder,
    btnMove,
    btnCopy
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
  FFileController.Free;
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TfmMain.btnLogClick(Sender: TObject);
var fmLog: TfmLog;
begin
  fmLog := TfmLog.Create(nil);
  try
    fmLog.ShowModal;
  finally
    fmLog.Free;
  end;
end;

procedure TfmMain.btnSourceClick(Sender: TObject);
begin
  LoadData;
end;

procedure TfmMain.LoadData;
var
  Files: TStringDynArray;
begin
  FListViewController.Clear;
  FItemsManager.Clear;

  Files := ReadFolder(FSourceFolder);
  Logger.Add('123');

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
