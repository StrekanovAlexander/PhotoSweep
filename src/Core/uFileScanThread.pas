unit uFileScanThread;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Types,
  uFileMetadata,
  uIFileMetadataReader;

type
  TFileScanThread = class(TThread)
  private
    FFiles: TStringDynArray;
    FReader: IFileMetadataReader;
    FOnItemRead: TProc<TFileMetadata>;
    FOnFinished: TProc;
  protected
    procedure Execute; override;
    procedure DoItemRead(Meta: TFileMetadata);
    procedure DoFinished;
  public
    constructor Create(const Files: TStringDynArray;
                       Reader: IFileMetadataReader;
                       OnItemRead: TProc<TFileMetadata>;
                       OnFinished: TProc);
  end;

implementation

constructor TFileScanThread.Create(const Files: TStringDynArray;
                                   Reader: IFileMetadataReader;
                                   OnItemRead: TProc<TFileMetadata>;
                                   OnFinished: TProc);
begin
  inherited Create(False);
  FreeOnTerminate := True;
  FFiles := Files;
  FReader := Reader;
  FOnItemRead := OnItemRead;
  FOnFinished := OnFinished;
end;

procedure TFileScanThread.Execute;
var
  FilePath: string;
  Meta: TFileMetadata;
begin
  for FilePath in FFiles do
  begin
    Meta := FReader.Read(FilePath);
    Meta.FilePath := FilePath;
    DoItemRead(Meta);
  end;
  DoFinished;
end;

procedure TFileScanThread.DoItemRead(Meta: TFileMetadata);
begin
  if Assigned(FOnItemRead) then
    Synchronize(
      procedure
      begin
        FOnItemRead(Meta);
      end
    );
end;

procedure TFileScanThread.DoFinished;
begin
  if Assigned(FOnFinished) then
    Synchronize(
      procedure
      begin
        FOnFinished;
      end
    );
end;

end.
