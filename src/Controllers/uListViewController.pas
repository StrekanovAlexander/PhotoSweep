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
    FImageList: TImageList;
  public
    constructor Create(AListView: TListView; AImageList: TImageList);

    procedure Clear;
    procedure Build(AItemsManager: TItemsManager);
    procedure AddItem(AItem: TItem);
  end;

implementation

constructor TListViewController.Create(AListView: TListView; AImageList: TImageList);
begin
  FListView := AListView;
  FImageList := AImageList;
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
  ListItem.SubItems.Add(DateToStr(AItem.DateTimeOriginal));
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
end;


end.
