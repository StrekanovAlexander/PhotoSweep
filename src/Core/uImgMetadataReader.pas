unit uImgMetadataReader;

interface

uses
  System.SysUtils,
  CCR.Exif,
  uIImgMetadataReader;

type
  TImgMetadataReader = class(TInterfacedObject, IImgMetadataReader)
  private
    function ReadJpegMetadata(const FileName: string): TImgMetadata;
  public
    function Read(const FileName: string): TImgMetadata;
  end;

implementation

function TImgMetadataReader.Read(const FileName: string): TImgMetadata;
var
  Ext: string;
begin
  Result := Default(TImgMetadata);
  Ext := LowerCase(ExtractFileExt(FileName));

  if (Ext = '.jpg') or (Ext = '.jpeg') then
  begin
    Result := ReadJpegMetadata(FileName);
  end;
end;

function TImgMetadataReader.ReadJpegMetadata(const FileName: string): TImgMetadata;
var
  Jpeg: TJpegImageEx;
begin
  Result := Default(TImgMetadata);

  Jpeg := TJpegImageEx.Create;
  try
    Jpeg.LoadFromFile(FileName);

    Result.Width := Jpeg.Width;
    Result.Height := Jpeg.Height;

    if Assigned(Jpeg.ExifData) then
    begin
      Result.HasExif := True;
      Result.CameraMake := Jpeg.ExifData.CameraMake;
      Result.CameraModel := Jpeg.ExifData.CameraModel;

      if Jpeg.ExifData.DateTimeOriginal > 0 then
        Result.DateTimeOriginal := Jpeg.ExifData.DateTimeOriginal;
    end;

  finally
    Jpeg.Free;
  end;

end;

end.
