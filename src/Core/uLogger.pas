unit uLogger;

interface

uses
  System.Classes, System.SysUtils;

type TLogger = class
  private
    FLog: TStringList;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(const Msg: string);
    function GetText: string;
end;

var
  Logger: TLogger;

implementation

constructor TLogger.Create;
begin
  FLog := TStringList.Create;
end;

destructor TLogger.Destroy;
begin
  FLog.Free;
  inherited;
end;

procedure TLogger.Add(const Msg: string);
begin
  FLog.Add(FormatDateTime('hh:nn:ss', Now) + ' | ' + Msg);
end;

function TLogger.GetText: string;
begin
  Result := FLog.Text;
end;

end.
