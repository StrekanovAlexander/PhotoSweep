unit uExtensionFilter;

interface

uses
  System.Generics.Collections,
  uIFilter,
  uItem;

type TExtensionFilter = class(TInterfacedObject, IFilter)
  private
    FExtensionList: TList<string>;
  public
    constructor Create;
    destructor Destroy; override;
    function Apply(Item: TItem): Boolean;
    procedure Add(AExtension: string);
    procedure Remove(AExtension: string);
end;

implementation

constructor TExtensionFilter.Create;
begin
  FExtensionList := TList<string>.Create;
end;

destructor TExtensionFilter.Destroy;
begin
  FExtensionList.Free;
  inherited;
end;

function TExtensionFilter.Apply(Item: TItem): Boolean;
begin
  Result := False;
  if FExtensionList.Count = 0 then
    Exit(True);
  Result := FExtensionList.Contains(Item.Extension);
end;

procedure TExtensionFilter.Add(AExtension: string);
begin
  if not FExtensionList.Contains(AExtension) then
    FExtensionList.Add(AExtension);
end;

procedure TExtensionFilter.Remove(AExtension: string);
var
  Index: Integer;
begin
  Index := FExtensionList.IndexOf(AExtension);
  if Index <> -1 then
    FExtensionList.Delete(Index);
end;

end.
