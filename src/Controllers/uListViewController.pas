unit uListViewController;

interface

uses
  Winapi.Windows,
  System.Math,
  System.SysUtils,
  System.Types,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.ComCtrls,
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
    function SetThumbnail(Source: TBitmap; Size: Integer): TBitmap;
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
  ListItem.Caption := AItem.FileName;
  ListItem.SubItems.Add(DateToStr(AItem.DateTimeOriginal));
  ListItem.SubItems.Add(AItem.FullDeviceName);
  ListItem.SubItems.Add(AItem.Resolution);
  ListItem.SubItems.Add(FloatToStr(AItem.MegaPixels));
  if AItem.HasExif then
    ListItem.SubItems.Add('Yes')
  else
    ListItem.SubItems.Add('No');

  if AItem.HasThumbnail and Assigned(AItem.Thumbnail) then
  begin
    ListItem.SubItems.Add('Thumb');
    Thumb := SetThumbnail(AItem.Thumbnail, 48);
    ListItem.ImageIndex := FImageList.Add(Thumb, nil);
  end
  else
  begin
    ListItem.SubItems.Add('No thumb');
    ListItem.ImageIndex := -1;
  end;

  ListItem.Data := AItem;
end;

function TListViewController.SetThumbnail(Source: TBitmap; Size: Integer): TBitmap;
var
  Scale: Double;
  NewW, NewH: Integer;
  X, Y: Integer;
begin
  Result := TBitmap.Create;
  Result.SetSize(Size, Size);
  Result.PixelFormat := pf24bit;

  Result.Canvas.Brush.Color := clBlack;
  Result.Canvas.FillRect(Rect(0, 0, Size, Size));

  Scale := Min(Size / Source.Width, Size / Source.Height);

  NewW := Round(Source.Width * Scale);
  NewH := Round(Source.Height * Scale);

  X := (Size - NewW) div 2;
  Y := (Size - NewH) div 2;

  SetStretchBltMode(Result.Canvas.Handle, HALFTONE);

  Result.Canvas.StretchDraw(
    Rect(X, Y, X + NewW, Y + NewH),
    Source
  );
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
