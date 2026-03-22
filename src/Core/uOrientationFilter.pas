unit uOrientationFilter;

interface

uses
  uIFilter,
  uFileMetadata,
  uItem;

type TOrientationFilter = class(TInterfacedObject, IFilter)
  private
    FAllowed: set of TOrientation;
  public
    constructor Create;
    function Apply(Item: TItem): Boolean;
    procedure Add(AOrientation: TOrientation);
    procedure Remove(AOrientation: TOrientation);
end;

implementation

constructor TOrientationFilter.Create;
begin
  FAllowed := [];
end;

function TOrientationFilter.Apply(Item: TItem): Boolean;
begin
  Result := False;

  if FAllowed = [] then
    Exit(True);

  Result := Item.Orientation in FAllowed;
end;

procedure TOrientationFilter.Add(AOrientation: TOrientation);
begin
  Include(FAllowed, AOrientation);
end;

procedure TOrientationFilter.Remove(AOrientation: TOrientation);
begin
  Exclude(FAllowed, AOrientation);
end;

end.
