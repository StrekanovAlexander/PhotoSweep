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
    stbViewer: TStatusBar;
    btnPrev: TSpeedButton;
    btnNext: TSpeedButton;
    procedure FormShow(Sender: TObject);
    function RenderIndicator: string;
    procedure Navigate(Step: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPrevClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
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

constructor TfmViewer.Create(AOwner: TComponent; AListItems: TListItems; AIndex: Integer);
begin
  inherited Create(AOwner);
  FListItems := AListItems;
  FCurrentIndex := AIndex;
  FItemsCountText := IntToStr(FListItems.Count);
end;

procedure TfmViewer.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Item: TListItem;
  DataItem: TItem;
begin
  case Key of
    VK_LEFT:
      begin
        if FCurrentIndex > 0 then
        begin
          Dec(FCurrentIndex);
          RefreshViewer;
        end;
        Key := 0;
      end;

    VK_RIGHT:
      begin
      if FCurrentIndex < FListItems.Count - 1 then
        begin
          Inc(FCurrentIndex);
          RefreshViewer;
        end;
        Key := 0;
      end;

    VK_SPACE:
      begin
        Item := FListItems[FCurrentIndex];
        DataItem := TItem(Item.Data);
        DataItem.IsSelected := not DataItem.IsSelected;
        Item.Checked := DataItem.IsSelected;
        RefreshViewer;
        Key := 0;
      end;

    VK_ESCAPE:
      Close;
  end;
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
  chkSelected.Checked := DataItem.IsSelected;

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

procedure TfmViewer.btnPrevClick(Sender: TObject);
begin
  Navigate(-1);
end;

procedure TfmViewer.btnNextClick(Sender: TObject);
begin
  Navigate(1);
end;

end.
