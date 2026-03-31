unit uItemsManager;

interface

uses
  System.Generics.Collections,
  uItem, uFileMetadata;

type
  TItemsManager = class
  private
    FItemsList: TObjectList<TItem>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;
    procedure AddItem(const Meta: TFileMetadata);
    procedure RemoveItem(AItem: TItem);
    function Count: Integer;
    function GetItem(Index: Integer): TItem;
    function GetSelectedItemsCount: Integer;
    property ItemsList: TObjectList<TItem> read FItemsList;
  end;

implementation

constructor TItemsManager.Create;
begin
  inherited;
  FItemsList := TObjectList<TItem>.Create(True);
end;

destructor TItemsManager.Destroy;
begin
  FItemsList.Free;
  inherited;
end;

procedure TItemsManager.AddItem(const Meta: TFileMetadata);
var
  Item: TItem;
begin
  Item := TItem.Create(Meta.FilePath, Meta);
  FItemsList.Add(Item);
end;

procedure TItemsManager.RemoveItem(AItem: TItem);
begin
  FItemsList.Remove(AItem);
end;

function TItemsManager.Count: Integer;
begin
  Result := FItemsList.Count;
end;

function TItemsManager.GetItem(Index: Integer): TItem;
begin
  Result := FItemsList[Index];
end;

function TItemsManager.GetSelectedItemsCount: Integer;
begin
  Result := 0;
  for var Item in FItemsList do
  begin
    if Item.IsSelected then
      Inc(Result);
  end;
end;

procedure TItemsManager.Clear;
begin
  FItemsList.Clear;
end;

end.
