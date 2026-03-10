unit uItemsManager;

interface

uses
  System.Generics.Collections,
  uItem, uFileMetadata;

type
  TItemsManager = class
  private
    FList: TObjectList<TItem>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;
    procedure AddItem(const Meta: TFileMetadata);
    function Count: Integer;
    function GetItem(Index: Integer): TItem;
  end;

implementation

constructor TItemsManager.Create;
begin
  inherited;
  FList := TObjectList<TItem>.Create(True);
end;

destructor TItemsManager.Destroy;
begin
  FList.Free;
  inherited;
end;

procedure TItemsManager.AddItem(const Meta: TFileMetadata);
var
  Item: TItem;
begin
  Item := TItem.Create(Meta.FilePath, Meta);
  FList.Add(Item);
end;

function TItemsManager.Count: Integer;
begin
  Result := FList.Count;
end;

function TItemsManager.GetItem(Index: Integer): TItem;
begin
  Result := FList[Index];
end;

procedure TItemsManager.Clear;
begin
  FList.Clear;
end;

end.
