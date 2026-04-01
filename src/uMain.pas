unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, SVGIconImage, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, SVGIconImageListBase, SVGIconImageList,
  Vcl.Buttons, Vcl.ComCtrls,
  System.IOUtils,
  System.Types,
  uAppEnums,
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
  uLog, uAbout, uWait
;

type
  TfmMain = class(TForm)
    pnlTop: TPanel;
    pnlTopLogo: TPanel;
    svgLogo: TSVGIconImage;
    lblLogo: TLabel;
    svgBtnList: TSVGIconImageList;
    stbMain: TStatusBar;
    imlThumbnails: TImageList;
    bvlTop: TBevel;
    pnlContainer: TPanel;
    pnlActions: TPanel;
    pnlMain: TPanel;
    pnlSource: TPanel;
    btnSource: TBitBtn;
    btnDeselectAll: TBitBtn;
    btnSelectAll: TBitBtn;
    pnlFiles: TPanel;
    pnlFilters: TPanel;
    lvwItems: TListView;
    pnlFiltersHeader: TPanel;
    lblFilters: TLabel;
    pnlFileTypes: TPanel;
    lblFileType: TLabel;
    chkJpg: TCheckBox;
    chkPng: TCheckBox;
    chkGif: TCheckBox;
    pnlOrientation: TPanel;
    lblOrientation: TLabel;
    chkLandscape: TCheckBox;
    chkPortrait: TCheckBox;
    chkSquare: TCheckBox;
    pnlFiltersOther: TPanel;
    lblFiltersOther: TLabel;
    chkHasExif: TCheckBox;
    edSourceFolder: TEdit;
    pnlActionsHeader: TPanel;
    lblActionsHeader: TLabel;
    pnlAnalyse: TPanel;
    lblAnalyse: TLabel;
    btnDuplicates: TBitBtn;
    btnViewer: TBitBtn;
    pnlOperations: TPanel;
    lblOperations: TLabel;
    rbMove: TRadioButton;
    rbCopy: TRadioButton;
    lblTarget: TLabel;
    pnlTarget: TPanel;
    edTargetFolder: TEdit;
    btnTarget: TBitBtn;
    btnExecute: TBitBtn;
    pnlReports: TPanel;
    lblReports: TLabel;
    btnLog: TBitBtn;
    btnAbout: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSourceClick(Sender: TObject);
    procedure btnLogClick(Sender: TObject);
    procedure rbMoveClick(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
    procedure btnTargetClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
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

    FActionMode: TActionMode;

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
    FFilterController,
    btnDuplicates
  );

  FFileController := TFileController.Create(
    FItemsManager,
    FListViewController
  );

  FActionMode := mdMove;
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

procedure TfmMain.btnAboutClick(Sender: TObject);
var fmAbout: TfmAbout;
begin
  fmAbout := TfmAbout.Create(nil);
  try
    fmAbout.ShowModal;
  finally
    fmAbout.Free;
  end;
end;

procedure TfmMain.btnExecuteClick(Sender: TObject);
begin
  if FSourceFolder = '' then
  begin
    ShowMessage('Select source folder.');
    Exit;
  end;
  if FTargetFolder = '' then
  begin
    ShowMessage('Select target folder.');
    Exit;
  end;
  if FSourceFolder = FTargetFolder then
  begin
    ShowMessage('Source and target folders cannot be the same.');
    Exit;
  end;
  FFileController.Execute(FActionMode, FTargetFolder);
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
var OpenDialog: TFileOpenDialog;
begin
  OpenDialog := TFileOpenDialog.Create(Self);
  try
    OpenDialog.Title := 'Select source folder';
    OpenDialog.Options := OpenDialog.Options + [fdoPickFolders];
    if OpenDialog.Execute then
    begin
      FSourceFolder := OpenDialog.FileName;
      edSourceFolder.Text := FSourceFolder;
      pnlFilters.Enabled := FSourceFolder <> '';
    end;
  finally
    OpenDialog.Free;
  end;
  LoadData;
end;

procedure TfmMain.btnTargetClick(Sender: TObject);
var OpenDialog: TFileOpenDialog;
begin
  OpenDialog := TFileOpenDialog.Create(Self);
  try
    OpenDialog.Title := 'Select target folder';
    OpenDialog.Options := OpenDialog.Options + [fdoPickFolders];
    if OpenDialog.Execute then
    begin
      FTargetFolder := OpenDialog.FileName;
      edTargetFolder.Text := FTargetFolder;
    end;
  finally
    OpenDialog.Free;
  end;
end;

procedure TfmMain.LoadData;
var
  fmWait: TfmWait;
  Files: TStringDynArray;
begin
  fmWait := TfmWait.Create(nil);
  try
    FListViewController.Clear;
    FItemsManager.Clear;
    Files := ReadFolder(FSourceFolder);
    TFileScanThread.Create(Files, FReader,
      procedure(Meta: TFileMetadata)
      begin
        FItemsManager.AddItem(Meta);
      end,
      procedure
      begin
        fmWait.Close;         // показываем форму
        FListViewController.Build(FItemsManager);
      end
    );
    fmWait.ShowModal;         // показываем форму
  finally
    fmWait.Free;
  end;
  FFilterController.ResetCheckBoxes;
end;

procedure TfmMain.rbMoveClick(Sender: TObject);
begin
  FActionMode := TActionMode((Sender as TRadioButton).Tag);
end;

end.
