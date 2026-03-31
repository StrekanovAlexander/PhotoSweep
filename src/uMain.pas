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
  uLog
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
    btnAbout: TBitBtn;
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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSourceClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLogClick(Sender: TObject);
    procedure rbMoveClick(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
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
    btnDuplicates
  );


  FSourceFolder := 'C:\source4';
  FTargetFolder := 'C:\target4';

  edSourceFolder.Text := FSourceFolder;
  edTargetFolder.Text := FTargetFolder;

  FFileController := TFileController.Create(
    FItemsManager,
    FListViewController,
    FSourceFolder,
    FTargetFolder
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

procedure TfmMain.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TfmMain.btnExecuteClick(Sender: TObject);
begin
  FFileController.Execute(FActionMode);
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

procedure TfmMain.rbMoveClick(Sender: TObject);
begin
  FActionMode := TActionMode((Sender as TRadioButton).Tag);
end;

end.
