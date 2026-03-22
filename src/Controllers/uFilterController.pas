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

    procedure HasExifClick(Sender: TObject);
    procedure OrientationClick(Sender: TObject);
    procedure UpdateHasExifFilter;
    procedure RefreshListView;
  public
    constructor Create(
      AItemsManager: TItemsManager;
      AFilterSet: TFilterSet;
      AListViewController: TListViewController;
      AHasExifCheckBox: TCheckBox;
      ALandscapeCheckBox, APortraitCheckBox, ASquareCheckBox: TCheckBox
    );
end;

implementation

constructor TFilterController.Create(
  AItemsManager: TItemsManager;
  AFilterSet: TFilterSet;
  AListViewController: TListViewController;
  AHasExifCheckBox: TCheckBox;
  ALandscapeCheckBox, APortraitCheckBox, ASquareCheckBox: TCheckBox
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

end;

procedure TFilterController.HasExifClick(Sender: TObject);
begin
  UpdateHasExifFilter;
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

procedure TFilterController.UpdateHasExifFilter;
begin
  FFilterSet.HasExifFilter.Active := FHasExifCheckBox.Checked;
end;

procedure TFilterController.RefreshListView;
begin
  FListViewController.Clear;

  for var Item in FItemsManager.ItemsList do
    if FFilterSet.Accept(Item) then
      FListViewController.AddItem(Item);
end;

end.
