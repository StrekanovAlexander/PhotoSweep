unit uFilterSet;

interface

uses
  uItem,
  uHasExifFilter,
  uOrientationFilter;

type TFilterSet = class
  private
    FHasExifFilter: THasExifFilter;
    FOrientationFilter: TOrientationFilter;
  public
    constructor Create;
    function Accept(Item: TItem): Boolean;
    property HasExifFilter: THasExifFilter read FHasExifFilter;
    property OrientationFilter: TOrientationFilter read FOrientationFilter;

end;

implementation

constructor TFilterSet.Create;
begin
   FHasExifFilter := THasExifFilter.Create;
   FOrientationFilter := TOrientationFilter.Create;
end;

function TFilterSet.Accept(Item: TItem): Boolean;
begin
  if Item = nil then
    Exit(False);

  Result := FHasExifFilter.Apply(Item) and FOrientationFilter.Apply(Item);
end;

end.
