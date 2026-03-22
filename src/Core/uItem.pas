unit uItem;

interface

uses
  System.SysUtils, System.IOUtils,
  Vcl.Graphics,
  uFileMetadata
  ;

type
  TItem = class
  private
    FFilePath: string;
    FFileName: string;
    FExtension: string;
    FFileSize: Int64;
    // Exif
    FHasExif: Boolean;
    FHasThumbnail: Boolean;

    FDateTimeOriginal: TDateTime;
    FCameraMake: string;
    FCameraModel: string;
    FWidth: Integer;
    FHeight: Integer;
    FOrientation: TOrientation;
    FThumbnail: TBitmap;

    function GetFormattedFileSize: string;
    function GetResolution: string;
    function GetMegaPixels: Double;
    function GetFullDeviceName: string;
    function GetOrientationText: string;
  public
    constructor Create(const AFilePath: string; const Meta: TFileMetadata);
    destructor Destroy; override;
    property FilePath: string read FFilePath;
    property FileName: string read FFileName;
    property Extension: string read FExtension;
    property FileSize: Int64 read FFileSize;
    property FormattedFileSize: string read GetFormattedFileSize;

    property HasExif: Boolean read FHasExif;
    property HasThumbnail: Boolean read FHasThumbnail;

    property DateTimeOriginal: TDateTime read FDateTimeOriginal;
    property CameraMake: string read FCameraMake;
    property CameraModel: string read FCameraModel;
    property FullDeviceName: string read GetFullDeviceName;
    property Width: Integer read FWidth;
    property Height: Integer read FHeight;
    property Orientation: TOrientation read FOrientation;
    property Resolution: string read GetResolution;
    property MegaPixels: Double read GetMegaPixels;
    property OrientationText: string read GetOrientationText;

    property Thumbnail: TBitmap read FThumbnail;
  end;

implementation

constructor TItem.Create(const AFilePath: string; const Meta: TFileMetadata);
begin
  FFilePath := AFilePath;
  FFileName := ExtractFileName(FFilePath);
  FExtension := LowerCase(ExtractFileExt(FFilePath));
  FFileSize := TFile.GetSize(FFilePath);

  FWidth := Meta.Width;
  FHeight := Meta.Height;
  FHasExif := Meta.HasExif;

  FCameraMake := Meta.CameraMake;
  FCameraModel := Meta.CameraModel;
  FDateTimeOriginal := Meta.DateTimeOriginal;
  FOrientation := Meta.Orientation;

  if Meta.HasThumbnail and Assigned(Meta.Thumbnail) then
  begin
    FHasThumbnail := True;
    FThumbnail := TBitmap.Create;
    FThumbnail.Assign(Meta.Thumbnail);
  end
  else
  begin
    FHasThumbnail := False;
    FThumbnail := nil;
  end;
end;

destructor TItem.Destroy;
begin
  FThumbnail.Free;
  inherited;
end;

function TItem.GetFormattedFileSize: string;
const
  KB = 1024;
  MB = KB * 1024;
begin
  if FFileSize >= MB then
    Result := Format('%.2f MB', [FFileSize / MB])
  else if FFileSize >= KB then
    Result := Format('%.2f KB', [FFileSize / KB])
  else
    Result := Format('%d B', [FFileSize]);
end;

function TItem.GetResolution: string;
begin
  if (FWidth > 0) and (FHeight > 0) then
    Result := Format('%d×%d', [FWidth, FHeight])
  else
    Result := '';
end;

function TItem.GetMegaPixels: Double;
begin
  if (FWidth > 0) and (FHeight > 0) then
    Result := (FWidth * FHeight) / 1000000
  else
    Result := 0;
end;

function TItem.GetOrientationText: string;
begin
  case FOrientation of
    poLandscape: Result := 'Landscape';
    poPortrait:  Result := 'Portrait';
    poSquare:    Result := 'Square';
  end;
end;

function TItem.GetFullDeviceName: string;
begin
  Result := '';
  if (CameraMake <> '') and (CameraModel <> '') then
    Result := CameraMake + ' ' + CameraModel
  else if CameraModel <> '' then
    Result := CameraModel
  else
    Result := CameraMake;
end;

end.
