unit uFilterSet;

interface

uses
  uItem,
  uHasExifFilter,
  uOrientationFilter,
  uExtensionFilter;

type TFilterSet = class
  private
    FHasExifFilter: THasExifFilter;
    FOrientationFilter: TOrientationFilter;
    FExtensionFilter: TExtensionFilter;
  public
    constructor Create;
    destructor Destroy; override;
    function Accept(Item: TItem): Boolean;
    property HasExifFilter: THasExifFilter read FHasExifFilter;
    property OrientationFilter: TOrientationFilter read FOrientationFilter;
    property ExtensionFilter: TExtensionFilter read FExtensionFilter;
end;

implementation

constructor TFilterSet.Create;
begin
   FHasExifFilter := THasExifFilter.Create;
   FOrientationFilter := TOrientationFilter.Create;
   FExtensionFilter := TExtensionFilter.Create;
end;

destructor TFilterSet.Destroy;
begin
   FHasExifFilter.Free;
   FOrientationFilter.Free;
   FExtensionFilter.Free;
end;

function TFilterSet.Accept(Item: TItem): Boolean;
begin
  if Item = nil then
    Exit(False);

  Result := FHasExifFilter.Apply(Item)
    and FOrientationFilter.Apply(Item)
    and FExtensionFilter.Apply(Item);
end;

end.
