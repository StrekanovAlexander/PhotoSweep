unit uFileMetadataReader;

interface

uses
  System.Classes,
  System.SysUtils,
  Vcl.Dialogs,
  Vcl.Graphics,
  Vcl.Imaging.jpeg,
  CCR.Exif,
  uFileMetadata,
  uIFileMetadataReader;

type
  TFileMetadataReader = class(TInterfacedObject, IFileMetadataReader)
  private
    function ReadJpegMetadata(const FileName: string): TFileMetadata;
    function HasExif(const Exif: TExifData): Boolean;
  public
    function Read(const FileName: string): TFileMetadata;
  end;

implementation

function TFileMetadataReader.Read(const FileName: string): TFileMetadata;
var
  Ext: string;
begin
  Result := Default(TFileMetadata);
  Ext := LowerCase(ExtractFileExt(FileName));

  if (Ext = '.jpg') or (Ext = '.jpeg') then
  begin
    Result := ReadJpegMetadata(FileName);
  end;
end;

function TFileMetadataReader.ReadJpegMetadata(const FileName: string): TFileMetadata;
var
  Exif: TExifData;
begin
  Result := TFileMetadata.Create;
  Exif := TExifData.Create;
  try
    Exif.LoadFromGraphic(FileName);
    Result.Width := Exif.ExifImageWidth;
    Result.Height := Exif.ExifImageHeight;
    if HasExif(Exif) then
    begin
      Result.HasExif := True;
      Result.CameraMake := Exif.CameraMake;
      Result.CameraModel := Exif.CameraModel;
      Result.DateTimeOriginal := Exif.DateTimeOriginal;
    end;

    if Exif.HasThumbnail and Assigned(Exif.Thumbnail) then
    begin
      Result.HasThumbnail := True;
      Result.Thumbnail := TBitmap.Create;
      Result.Thumbnail.PixelFormat := pf24bit;
      Result.Thumbnail.SetSize(Exif.Thumbnail.Width, Exif.Thumbnail.Height);
      Result.Thumbnail.Canvas.Draw(0, 0, Exif.Thumbnail);
    end
    else
    begin
      Result.HasThumbnail := False;
      Result.Thumbnail := nil;
    end;
  finally
    Exif.Free;
  end;
end;

function TFileMetadataReader.HasExif(const Exif: TExifData): Boolean;
begin
  Result := (Exif.CameraMake <> '')
    or (Exif.CameraModel <> '')
    or (Exif.DateTimeOriginal > 0)
    or (Exif.DateTimeDigitized > 0);
end;

end.
