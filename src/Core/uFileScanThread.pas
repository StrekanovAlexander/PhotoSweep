unit uFileScanThread;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Types,
  uImgMetadata,
  uIImgMetadataReader;

type
  TFileScanThread = class(TThread)
  private
    FFiles: TStringDynArray;
    FReader: IImgMetadataReader;
    FOnItemRead: TProc<TImgMetadata>;
  protected
    procedure Execute; override;
    procedure DoItemRead(Meta: TImgMetadata);
  public
    constructor Create(const Files: TStringDynArray;
                       Reader: IImgMetadataReader;
                       OnItemRead: TProc<TImgMetadata>);
  end;

implementation

constructor TFileScanThread.Create(const Files: TStringDynArray;
                                   Reader: IImgMetadataReader;
                                   OnItemRead: TProc<TImgMetadata>);
begin
  inherited Create(False);
  FreeOnTerminate := True;
  FFiles := Files;
  FReader := Reader;
  FOnItemRead := OnItemRead;
end;

procedure TFileScanThread.Execute;
var
  FilePath: string;
  Meta: TImgMetadata;
begin
  for FilePath in FFiles do
  begin
    Meta := FReader.Read(FilePath);
    Meta.FilePath := FilePath;
    DoItemRead(Meta);
  end;
end;

procedure TFileScanThread.DoItemRead(Meta: TImgMetadata);
begin
  if Assigned(FOnItemRead) then
    Synchronize(
      procedure
      begin
        FOnItemRead(Meta);
      end
    );
end;

end.
