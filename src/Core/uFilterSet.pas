unit uFilterSet;

interface

uses
  uItem, uHasExifFilter;

type TFilterSet = class
  private
    FHasExifFilter: THasExifFilter;
  public
    constructor Create;
    function Accept(Item: TItem): Boolean;
    property HasExifFilter: THasExifFilter read FHasExifFilter;
end;

implementation

constructor TFilterSet.Create;
begin
   FHasExifFilter := THasExifFilter.Create;
end;

function TFilterSet.Accept(Item: TItem): Boolean;
begin
  if Item = nil then
    Exit(False);

  if not FHasExifFilter.Active then
    Exit(True);

  Result := FHasExifFilter.Apply(Item);
end;

end.
