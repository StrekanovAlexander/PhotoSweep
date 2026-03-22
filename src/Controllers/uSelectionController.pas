unit uSelectionController;

interface

uses
  System.SysUtils,
  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.StdCtrls
;

type TSelectionController = class
  private
    FSelectBtn: TBitBtn;
    FDeselectBtn: TBitBtn;

    FListView: TListView;
    FStatusBar: TStatusBar;

    procedure SelectAll(Sender: TObject);
    procedure DeselectAll(Sender: TObject);
    procedure MarkItems(ABool: Boolean);
    procedure UpdateStatusBar;
  public
    constructor Create(
      ASelectBtn, ADeselectBtn: TBitBtn;
      AListView: TListView; AStatusBar: TStatusBar);
end;

implementation

constructor TSelectionController.Create(
  ASelectBtn, ADeselectBtn: TBitBtn;
  AListView: TListView; AStatusBar: TStatusBar);
begin
  FSelectBtn := ASelectBtn;
  FDeselectBtn := ADeselectBtn;
  FListView := AListView;
  FStatusBar := AStatusBar;

  FSelectBtn.OnClick := SelectAll;
  FDeselectBtn.OnClick := DeselectAll;
end;

procedure TSelectionController.SelectAll;
begin
  MarkItems(True);
end;

procedure TSelectionController.DeselectAll;
begin
  MarkItems(False);
end;

procedure TSelectionController.MarkItems(ABool: Boolean);
var
  Item: TListItem;
begin
  FListView.Items.BeginUpdate;
  for Item in FListView.Items do
    Item.Checked := ABool;
  FListView.Items.EndUpdate;
  UpdateStatusBar;
end;


procedure TSelectionController.UpdateStatusBar;
var
  CheckedCount: Integer;
  Item: TListItem;
begin
  CheckedCount := 0;
  for Item in FListView.Items do
    if Item.Checked then
    Inc(CheckedCount);

  FStatusBar.Panels[0].Text := Format('Total: %d', [FListView.Items.Count]);
  FStatusBar.Panels[1].Text := Format('Selected: %d', [CheckedCount]);
end;

end.
