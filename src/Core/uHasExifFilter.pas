unit uHasExifFilter;

interface

uses
  uItem, uIFilter;

type THasExifFilter = class(TInterfacedObject, IFilter)
  private
    FActive: Boolean;
  public
    constructor Create;
    function Apply(Item: TItem): Boolean;
    property Active: Boolean read FActive write FActive;
end;

implementation

constructor THasExifFilter.Create;
begin
  FActive := False;
end;

function THasExifFilter.Apply(Item: TItem): Boolean;
begin
  Result := False;

  if Item = nil then
    Exit(Result);

  if not FActive then
    Exit(True);

  Result := Item.HasExif;
end;

end.
