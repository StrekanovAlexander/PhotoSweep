unit uFilterController;

interface

uses
  Vcl.StdCtrls,
  uItem,
  uFilterSet,
  uItemsManager,
  uListViewController;

type TFilterController = class
  private
    FHasExifCheckBox: TCheckBox;
    FFilterSet: TFilterSet;
    FItemsManager: TItemsManager;
    FListViewController: TListViewController;

    procedure HasExifClick(Sender: TObject);
    procedure UpdateHasExifFilter;
    procedure RefreshListView;
  public
    constructor Create(
      AHasExifCheckBox: TCheckBox;
      AFilterSet: TFilterSet;
      AItemsManager: TItemsManager;
      AListViewController: TListViewController
    );
end;

implementation

constructor TFilterController.Create(
  AHasExifCheckBox: TCheckBox;
  AFilterSet: TFilterSet;
  AItemsManager: TItemsManager;
  AListViewController: TListViewController
);
begin
  FHasExifCheckBox := AHasExifCheckBox;
  FFilterSet := AFilterSet;
  FItemsManager := AItemsManager;
  FListViewController := AListViewController;
  FHasExifCheckBox.OnClick := HasExifClick;
end;

procedure TFilterController.HasExifClick(Sender: TObject);
begin
  UpdateHasExifFilter;
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
