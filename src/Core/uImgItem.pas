unit uImgItem;

interface

uses
  System.SysUtils, System.IOUtils, CCR.Exif,
  Vcl.Imaging.pngimage, Vcl.Imaging.GIFImg,
  uImgMetadata
  //uIImgMetadataReader
  ;

type
  TImgItem = class
  private
    FFilePath: string;
    FFileName: string;
    FExtension: string;
    FFileSize: Int64;
    // Exif
    FHasExif: Boolean;
    FDateTimeOriginal: TDateTime;
    FCameraMake: string;
    FCameraModel: string;
    FWidth: Integer;
    FHeight: Integer;
    FOrientation: TImgOrientation;

    procedure LoadMetaData;
    procedure LoadJpegMetaData;
    procedure LoadPngMetaData;
    procedure LoadGifMetaData;
    // Other
    function GetFormattedFileSize: string;
    function GetResolution: string;
    function GetMegaPixels: Double;
    function GetFullDeviceName: string;
    function GetOrientation: TImgOrientation;
    function GetOrientationText: string;
  public
    constructor Create(const AFilePath: string; const Meta: TImgMetadata);
    property FilePath: string read FFilePath;
    property FileName: string read FFileName;
    property Extension: string read FExtension;
    property FileSize: Int64 read FFileSize;
    property FormattedFileSize: string read GetFormattedFileSize;
    // Exif
    property HasExif: Boolean read FHasExif;
    property DateTimeOriginal: TDateTime read FDateTimeOriginal;
    property CameraMake: string read FCameraMake;
    property CameraModel: string read FCameraModel;
    property FullDeviceName: string read GetFullDeviceName;
    property Width: Integer read FWidth;
    property Height: Integer read FHeight;
    property Resolution: string read GetResolution;
    property MegaPixels: Double read GetMegaPixels;
    property Orientation: TImgOrientation read GetOrientation;
    property OrientationText: string read GetOrientationText;
  end;

implementation

constructor TImgItem.Create(const AFilePath: string; const Meta: TImgMetadata);
begin
  FFilePath := AFilePath;
  FFileName := ExtractFileName(FFilePath);
  if FileExists(FFilePath) then
    FFileSize := TFile.GetSize(FFilePath)
  else
    FFileSize := 0;

  FWidth := Meta.Width;
  FHeight := Meta.Height;
  FHasExif := Meta.HasExif;
  FCameraMake := Meta.CameraMake;
  FCameraModel := Meta.CameraModel;
  FDateTimeOriginal := Meta.DateTimeOriginal;
  FOrientation := Meta.Orientation;
{
  FFilePath := AFilePath;
  FFileName := ExtractFileName(FFilePath);
  FExtension := LowerCase(ExtractFileExt(FFilePath));
  if FileExists(FFilePath) then
    FFileSize := TFile.GetSize(FFilePath)
  else
    FFileSize := 0;
  LoadMetaData;
}
end;

procedure TImgItem.LoadMetaData;
begin
  FHasExif := False;
  FCameraMake := '';
  FCameraModel := '';
  FWidth := 0;
  FHeight := 0;
  FDateTimeOriginal := 0;

  if (FExtension = '.jpg') or (FExtension = '.jpeg') then
  begin
    LoadJpegMetaData;
  end
  else if FExtension = '.png' then
  begin
    LoadPngMetadata;
  end
  else if FExtension = '.gif' then
  begin
    LoadGifMetadata;
  end;
end;

procedure TImgItem.LoadJpegMetadata;
var
  Jpeg: TJpegImageEx;
begin
  Jpeg := TJpegImageEx.Create;
  try
    Jpeg.LoadFromFile(FFilePath);
    FWidth := Jpeg.Width;
    FHeight := Jpeg.Height;

    if Assigned(Jpeg.ExifData) then
    begin
      FHasExif := True;
      FCameraMake := Jpeg.ExifData.CameraMake;
      FCameraModel := Jpeg.ExifData.CameraModel;

      try
      if Jpeg.ExifData.DateTimeOriginal > 0 then
        FDateTimeOriginal := Jpeg.ExifData.DateTimeOriginal
      else if Jpeg.ExifData.DateTimeDigitized > 0 then
        FDateTimeOriginal := Jpeg.ExifData.DateTimeDigitized
      else if Jpeg.ExifData.DateTime > 0 then
        FDateTimeOriginal := Jpeg.ExifData.DateTime;
      except
        FDateTimeOriginal := 0;
      end;
    end;

    if FDateTimeOriginal = 0 then
      FDateTimeOriginal := TFile.GetLastWriteTime(FFilePath);

  finally
    Jpeg.Free;
  end;
end;

procedure TImgItem.LoadPngMetadata;
var
  Png: TPngImage;
begin
  Png := TPngImage.Create;
  try
    Png.LoadFromFile(FFilePath);
    FWidth := Png.Width;
    FHeight := Png.Height;
  finally
    Png.Free;
  end;
  FDateTimeOriginal := TFile.GetLastWriteTime(FFilePath);
end;

procedure TImgItem.LoadGifMetadata;
var
  Gif: TGIFImage;
begin
  Gif := TGIFImage.Create;
  try
    Gif.LoadFromFile(FFilePath);
    FWidth := Gif.Width;
    FHeight := Gif.Height;
  finally
    Gif.Free;
  end;
  FDateTimeOriginal := TFile.GetLastWriteTime(FFilePath);
end;

function TImgItem.GetFormattedFileSize: string;
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

function TImgItem.GetResolution: string;
begin
  if (FWidth > 0) and (FHeight > 0) then
    Result := Format('%d×%d', [FWidth, FHeight])
  else
    Result := '';
end;

function TImgItem.GetMegaPixels: Double;
begin
  if (FWidth > 0) and (FHeight > 0) then
    Result := (FWidth * FHeight) / 1000000
  else
    Result := 0;
end;

function TImgItem.GetOrientation: TImgOrientation;
begin
  if FWidth > FHeight then
    Result := poLandscape
  else if FHeight > FWidth then
    Result := poPortrait
  else
    Result := poSquare;
end;

function TImgItem.GetOrientationText: string;
begin
  case Orientation of
    poLandscape: Result := 'Landscape';
    poPortrait:  Result := 'Portrait';
    poSquare:    Result := 'Square';
  end;
end;

function TImgItem.GetFullDeviceName: string;
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
