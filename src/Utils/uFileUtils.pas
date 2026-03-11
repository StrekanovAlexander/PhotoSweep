unit uFileUtils;

interface

uses
  System.IOUtils,
  System.Types,
  System.SysUtils,
  System.StrUtils,
  System.Generics.Collections,
  uAppConsts;

function GetItemFiles(const Folder: string): TStringDynArray;

implementation

function IsSupportedExt(const FileName: string): Boolean;
var
  Ext: string;
begin
  Ext := LowerCase(ExtractFileExt(FileName));
  Result := MatchText(Ext, SUPPORTED_EXTS);
end;

function GetItemFiles(const Folder: string): TStringDynArray;
var
  Files: TStringDynArray;
  List: TList<string>;
  FileName: string;
begin
  Files := TDirectory.GetFiles(Folder);

  List := TList<string>.Create;
  try
    for FileName in Files do
      if IsSupportedExt(FileName) then
        List.Add(FileName);
    Result := List.ToArray;
  finally
    List.Free;
  end;
end;

end.
