unit uSelectionController;

interface

uses
  System.SysUtils,
  Vcl.ComCtrls,
  Vcl.StdCtrls
;

type TSelectionController = class
  private
    FCheckBox: TCheckBox;
    FListView: TListView;
    FStatusBar: TStatusBar;

    procedure CheckBoxClick(Sender: TObject);
    procedure SetCheckBoxes(ABoolValue: Boolean);
    procedure UpdateStatusBar;
  public
    constructor Create(ACheckBox: TCheckBox; AListView: TListView; AStatusBar: TStatusBar);
end;

implementation

constructor TSelectionController.Create(ACheckBox: TCheckBox; AListView: TListView; AStatusBar: TStatusBar);
begin
  FCheckBox := ACheckBox;
  FListView := AListView;
  FStatusBar := AStatusBar;
  FCheckBox.OnClick := CheckBoxClick;
end;

procedure TSelectionController.CheckBoxClick(Sender: TObject);
begin
  if FCheckBox.Checked then
    SetCheckBoxes(True)
  else
    SetCheckBoxes(False);
end;

procedure TSelectionController.SetCheckBoxes(ABoolValue: Boolean);
var
  Item: TListItem;
begin
  FListView.Items.BeginUpdate;
  for Item in FListView.Items do
    Item.Checked := ABoolValue;
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
