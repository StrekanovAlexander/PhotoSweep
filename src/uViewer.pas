unit uViewer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.ComCtrls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  uItem;

type
  TfmViewer = class(TForm)
    pnlMain: TPanel;
    pnlBottom: TPanel;
    imgViewer: TImage;
    lblFileName: TLabel;
    procedure FormShow(Sender: TObject);
  private
    FListItems: TListItems;
    FCurrentIndex: Integer;
    procedure RefreshViewer;
  public
    constructor Create(AOwner: TComponent; AListItems: TListItems; AIndex: Integer); reintroduce;
  end;

var
  fmViewer: TfmViewer;

implementation

{$R *.dfm}

constructor TfmViewer.Create(AOwner: TComponent; AListItems: TListItems; AIndex: Integer);
begin
  inherited Create(AOwner);
  FListItems := AListItems;
  FCurrentIndex := AIndex;
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
end;

end.
