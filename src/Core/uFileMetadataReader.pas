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
  uIFileMetadataReader,
  uAppConsts,
  uGraphicUtils;

type
  TFileMetadataReader = class(TInterfacedObject, IFileMetadataReader)
  private
    function ReadJpegMetadata(const FileName: string): TFileMetadata;
    function ReadPngMetadata(const FileName: string): TFileMetadata;
    function ReadGifMetadata(const FileName: string): TFileMetadata;

    function HasExif(const Exif: TExifData): Boolean;
  public
    function Read(const FileName: string): TFileMetadata;
  end;

implementation

function TFileMetadataReader.HasExif(const Exif: TExifData): Boolean;
begin
  Result := (Exif.CameraMake <> '')
    or (Exif.CameraModel <> '')
    or (Exif.DateTimeOriginal > 0)
    or (Exif.DateTimeDigitized > 0);
end;

function TFileMetadataReader.Read(const FileName: string): TFileMetadata;
var
  Ext: string;
begin
  Ext := LowerCase(ExtractFileExt(FileName));
  if (Ext = '.jpg') or (Ext = '.jpeg') then
    Result := ReadJpegMetadata(FileName)
  else if Ext = '.png' then
    Result := ReadPngMetadata(FileName)
  else if Ext = '.gif' then
    Result := ReadGifMetadata(FileName)
  else
    raise Exception.CreateFmt('Unsupported format: %s', [FileName]);
end;

function TFileMetadataReader.ReadJpegMetadata(const FileName: string): TFileMetadata;
var
  Exif: TExifData;
  Bitmap: TBitmap;
begin
  Result := TFileMetadata.Create;
  Exif := TExifData.Create;
  try
    Exif.LoadFromGraphic(FileName);

    if HasExif(Exif) then
    begin
      Result.HasExif := True;
      Result.Width := Exif.ExifImageWidth;
      Result.Height := Exif.ExifImageHeight;
      Result.CameraMake := Exif.CameraMake;
      Result.CameraModel := Exif.CameraModel;
      Result.DateTimeOriginal := Exif.DateTimeOriginal;
    end;

    if Exif.HasThumbnail and Assigned(Exif.Thumbnail) then
    begin
      Bitmap := TBitmap.Create;
      Bitmap.PixelFormat := pf24bit;
      Bitmap.SetSize(Exif.Thumbnail.Width, Exif.Thumbnail.Height);
      Bitmap.Canvas.Draw(0, 0, Exif.Thumbnail);
      try
        Result.Thumbnail := ResizeThumbnail(Bitmap, THUMBNAIL_SIZE);
      finally
        Bitmap.Free;
      end;
    end
    else
    begin
      Bitmap := CreateBitmapFromJpeg(FileName);
      Result.Width := Bitmap.Width;
      Result.Height := Bitmap.Height;
      try
        Result.Thumbnail := ResizeThumbnail(Bitmap, THUMBNAIL_SIZE);
      finally
        Bitmap.Free;
      end;
    end;
    Result.HasThumbnail := True;
  finally
    Exif.Free;
  end;
end;

function TFileMetadataReader.ReadPngMetadata(const FileName: string): TFileMetadata;
var
  Bitmap: TBitmap;
begin
  Result := TFileMetadata.Create;
  Bitmap := CreateBitmapFromPng(FileName);
  Result.Width := Bitmap.Width;
  Result.Height := Bitmap.Height;
  try
    Result.Thumbnail := ResizeThumbnail(Bitmap, THUMBNAIL_SIZE);
  finally
    Bitmap.Free;
  end;
  Result.HasExif := False;
  Result.HasThumbnail := True;
end;

function TFileMetadataReader.ReadGifMetadata(const FileName: string): TFileMetadata;
var
  Bitmap: TBitmap;
begin
  Result := TFileMetadata.Create;
  Bitmap := CreateBitmapFromGif(FileName);
  Result.Width := Bitmap.Width;
  Result.Height := Bitmap.Height;
  try
    Result.Thumbnail := ResizeThumbnail(Bitmap, THUMBNAIL_SIZE);
  finally
    Bitmap.Free;
  end;
  Result.HasExif := False;
  Result.HasThumbnail := True;
end;

end.
