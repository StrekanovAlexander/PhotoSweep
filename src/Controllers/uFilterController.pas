unit uFilterController;

interface

uses
  Vcl.StdCtrls,
  uFileMetadata,
  uItem,
  uFilterSet,
  uItemsManager,
  uListViewController;

type TFilterController = class
  private
    FItemsManager: TItemsManager;
    FFilterSet: TFilterSet;
    FListViewController: TListViewController;

    FHasExifCheckBox: TCheckBox;

    FLandscapeCheckBox: TCheckBox;
    FPortraitCheckBox: TCheckBox;
    FSquareCheckBox: TCheckBox;

    FJpgCheckBox: TCheckBox;
    FPngCheckBox: TCheckBox;
    FGifCheckBox: TCheckBox;

    procedure HasExifClick(Sender: TObject);
    procedure OrientationClick(Sender: TObject);
    procedure ExtensionClick(Sender: TObject);

    procedure RefreshListView;
  public
    constructor Create(
      AItemsManager: TItemsManager;
      AFilterSet: TFilterSet;
      AListViewController: TListViewController;
      AHasExifCheckBox: TCheckBox;
      ALandscapeCheckBox, APortraitCheckBox, ASquareCheckBox: TCheckBox;
      AJpgCheckBox, APngCheckBox, AGifCheckBox: TCheckBox
    );
end;

implementation

constructor TFilterController.Create(
  AItemsManager: TItemsManager;
  AFilterSet: TFilterSet;
  AListViewController: TListViewController;
  AHasExifCheckBox: TCheckBox;
  ALandscapeCheckBox, APortraitCheckBox, ASquareCheckBox: TCheckBox;
  AJpgCheckBox, APngCheckBox, AGifCheckBox: TCheckBox
);
begin
  FItemsManager := AItemsManager;
  FFilterSet := AFilterSet;
  FListViewController := AListViewController;

  FHasExifCheckBox := AHasExifCheckBox;
  FHasExifCheckBox.OnClick := HasExifClick;

  FLandscapeCheckBox := ALandscapeCheckBox;
  FPortraitCheckBox := APortraitCheckBox;
  FSquareCheckBox := ASquareCheckBox;
  FLandscapeCheckBox.OnClick := OrientationClick;
  FPortraitCheckBox.OnClick := OrientationClick;
  FSquareCheckBox.OnClick := OrientationClick;

  FJpgCheckBox := AJpgCheckBox;
  FPngCheckBox := APngCheckBox;
  FGifCheckBox := AGifCheckBox;
  FJpgCheckBox.OnClick := ExtensionClick;
  FPngCheckBox.OnClick := ExtensionClick;
  FGifCheckBox.OnClick := ExtensionClick;

end;

procedure TFilterController.HasExifClick(Sender: TObject);
begin
  FFilterSet.HasExifFilter.Active := FHasExifCheckBox.Checked;
  RefreshListView;
end;

procedure TFilterController.OrientationClick(Sender: TObject);
var
  CheckBox: TCheckBox;
  Orientation: TOrientation;
begin
  CheckBox := Sender as TCheckBox;

  if not (CheckBox.Tag in [0..2]) then Exit;

  Orientation := TOrientation(CheckBox.Tag);

  if CheckBox.Checked then
    FFilterSet.OrientationFilter.Add(Orientation)
  else
    FFilterSet.OrientationFilter.Remove(Orientation);

  RefreshListView;
end;

procedure TFilterController.ExtensionClick(Sender: TObject);
var
  CheckBox: TCheckBox;
  Ext: string;
begin
  if not (Sender is TCheckBox) then Exit;

  CheckBox := Sender as TCheckBox;
  Ext := CheckBox.Hint;

  if CheckBox.Checked then
    FFilterSet.ExtensionFilter.Add(Ext)
  else
    FFilterSet.ExtensionFilter.Remove(Ext);
  RefreshListView;
end;

procedure TFilterController.RefreshListView;
begin
  FListViewController.Clear;

  FListViewController.ListView.Items.BeginUpdate;
  try
    for var Item in FItemsManager.ItemsList do
      if FFilterSet.Accept(Item) then
        FListViewController.AddItem(Item);
  finally
    FListViewController.ListView.Items.EndUpdate;
  end;
end;

end.
