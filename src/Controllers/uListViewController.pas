unit uListViewController;

interface

uses
  System.SysUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.ComCtrls,
  uAppConsts,
  uItem,
  uItemsManager
;

type
  TListViewController = class
  private
    FListView: TListView;
    FStatusBar: TStatusBar;
    FImageList: TImageList;
    FSortColumn: Integer;
    FSortAscending: Boolean;

    procedure ColumnClick(Sender: TObject; Column: TListColumn);
    procedure CompareItems(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);

    procedure ItemChecked(Sender: TObject; Item: TListItem);
    procedure UpdateStatusBar;
  public
    constructor Create(AListView: TListView; AStatusBar: TStatusBar; AImageList: TImageList);
    procedure AddItem(AItem: TItem);
    procedure Build(AItemsManager: TItemsManager);
    procedure Clear;
  end;

implementation

constructor TListViewController.Create(AListView: TListView; AStatusBar: TStatusBar; AImageList: TImageList);
begin
  FListView := AListView;
  FStatusBar := AStatusBar;
  FImageList := AImageList;

  FSortColumn := -1;
  FSortAscending := True;

  FListView.OnColumnClick := ColumnClick;
  FListView.OnCompare := CompareItems;
  FListView.OnItemChecked := ItemChecked;
end;

procedure TListViewController.Clear;
begin
  FListView.Items.BeginUpdate;
  try
    for var i := 0 to FListView.Items.Count - 1 do
      FListView.Items[i].Data := nil;
    FListView.Items.Clear;
  finally
    FListView.Items.EndUpdate;
  end;
  UpdateStatusBar;
end;

procedure TListViewController.AddItem(AItem: TItem);
var
  ListItem: TListItem;
  Thumb: TBitmap;
begin
  ListItem := FListView.Items.Add;

  if AItem.HasThumbnail and Assigned(AItem.Thumbnail) then
  begin
    Thumb := AItem.Thumbnail;
    ListItem.ImageIndex := FImageList.Add(Thumb, nil);
  end
  else
  begin
    ListItem.ImageIndex := -1;
  end;

  ListItem.Caption := AItem.FileName;
  ListItem.SubItems.Add(DateTimeToStr(AItem.DateTimeOriginal));
  ListItem.SubItems.Add(AItem.FullDeviceName);
  ListItem.SubItems.Add(AItem.Resolution);
  ListItem.SubItems.Add(FloatToStr(AItem.MegaPixels));
  ListItem.SubItems.Add(AItem.FormattedFileSize);
  ListItem.SubItems.Add(AItem.Extension);
  ListItem.SubItems.Add(AItem.OrientationText);
  if AItem.HasExif then
    ListItem.SubItems.Add('Yes')
  else
    ListItem.SubItems.Add('No');
  ListItem.Data := AItem;
end;

procedure TListViewController.Build(AItemsManager: TItemsManager);
var
  i: Integer;
begin
  FListView.Items.BeginUpdate;
  try
    FListView.Items.Clear;
    for i := 0 to AItemsManager.Count - 1 do
      AddItem(AItemsManager.GetItem(i));
  finally
    FListView.Items.EndUpdate;
  end;

  if FListView.Items.Count > 0 then
  begin
    FListView.Items[0].Selected := True;
    FListView.Items[0].Focused := True;
  end;

  UpdateStatusBar;
end;

procedure TListViewController.ColumnClick(Sender: TObject; Column: TListColumn);
begin
  if FSortColumn = Column.Index then
    FSortAscending := not FSortAscending
  else
  begin
    FSortColumn := Column.Index;
    FSortAscending := True;
  end;
  FListView.AlphaSort;
end;

procedure TListViewController.CompareItems(
  Sender: TObject;
  Item1, Item2: TListItem;
  Data: Integer;
  var Compare: Integer);
var
  S1, S2: string;
begin
  if FSortColumn = 0 then
  begin
    S1 := Item1.Caption;
    S2 := Item2.Caption;
  end
  else
  begin
    S1 := Item1.SubItems[FSortColumn - 1];
    S2 := Item2.SubItems[FSortColumn - 1];
  end;

  Compare := CompareText(S1, S2);

  if not FSortAscending then
    Compare := -Compare;
end;

procedure TListViewController.UpdateStatusBar;
var
  Item: TListITem;
  CheckedCount: Integer;
begin
  CheckedCount := 0;
  for Item in FListView.Items do
    if Item.Checked then
      Inc(CheckedCount);

  FStatusBar.Panels[0].Text := Format('Total: %d', [FListView.Items.Count]);
  FStatusBar.Panels[1].Text := Format('Selected: %d', [CheckedCount]);
end;

procedure TListViewController.ItemChecked(Sender: TObject; Item: TListItem);
begin
  UpdateStatusBar;
end;

end.
