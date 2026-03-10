unit uFileMetadata;

interface

uses Vcl.Graphics;

type
  TImgOrientation = (poLandscape, poPortrait, poSquare);

//  TFileMetadata = record
  TFileMetadata = class
    FilePath: string;

    Width: Integer;
    Height: Integer;
    HasExif: Boolean;

    Thumbnail: TBitmap;
    HasThumbnail: Boolean;

    CameraMake: string;
    CameraModel: string;
    DateTimeOriginal: TDateTime;
    Orientation: TImgOrientation;

    destructor Destroy; override;
end;

implementation

destructor TFileMetadata.Destroy;
begin
  Thumbnail.Free;
  inherited;
end;

end.
