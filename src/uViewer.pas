unit uViewer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.ComCtrls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  uItem, Vcl.Buttons, System.ImageList, Vcl.ImgList, SVGIconImageListBase,
  SVGIconImageList;

type
  TfmViewer = class(TForm)
    pnlMain: TPanel;
    pnlBottom: TPanel;
    imgViewer: TImage;
    lblFileName: TLabel;
    lblIndicator: TLabel;
    pnlSelected: TPanel;
    chkSelected: TCheckBox;
    svgBtnList: TSVGIconImageList;
    pnlButtons: TPanel;
    btnPrev: TBitBtn;
    btnNext: TBitBtn;
    procedure FormShow(Sender: TObject);
    function RenderIndicator: string;
    procedure btnPrevClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure Navigate(Step: Integer);
  private
    FListItems: TListItems;
    FCurrentIndex: Integer;
    FItemsCountText: string;
    procedure RefreshViewer;
  public
    constructor Create(AOwner: TComponent; AListItems: TListItems; AIndex: Integer); reintroduce;
  end;

var
  fmViewer: TfmViewer;

implementation

{$R *.dfm}

procedure TfmViewer.Navigate(Step: Integer);
begin
  FCurrentIndex := FCurrentIndex + Step;
  RefreshViewer;
end;

procedure TfmViewer.btnNextClick(Sender: TObject);
begin
  Navigate(1);
end;

procedure TfmViewer.btnPrevClick(Sender: TObject);
begin
  Navigate(-1);
end;

constructor TfmViewer.Create(AOwner: TComponent; AListItems: TListItems; AIndex: Integer);
begin
  inherited Create(AOwner);
  FListItems := AListItems;
  FCurrentIndex := AIndex;
  FItemsCountText := IntToStr(FListItems.Count);
end;

procedure TfmViewer.FormShow(Sender: TObject);
begin
  RefreshViewer;
end;

procedure TfmViewer.RefreshViewer;
var
  Item: TListItem;
  DataItem: TItem;
begin
  Item := FListItems[FCurrentIndex];
  DataItem := TItem(Item.Data);
  imgViewer.Picture.LoadFromFile(DataItem.FilePath);

  lblFileName.Caption := DataItem.FileName;
  lblIndicator.Caption := RenderIndicator;

  if FCurrentIndex = 0 then
    btnPrev.Enabled := False
  else
    btnPrev.Enabled := True;

  if FCurrentIndex = (FListItems.Count - 1) then
    btnNext.Enabled := False
  else
    btnNext.Enabled := True;

end;

function TfmViewer.RenderIndicator: string;
var
  CurrentIndexText: string;
begin
  CurrentIndexText := IntToStr(FCurrentIndex + 1);
  Result := CurrentIndexText + ' of ' + FItemsCountText;
end;

end.
