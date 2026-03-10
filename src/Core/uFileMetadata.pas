unit uFileMetadata;

interface

type

  TImgOrientation = (poLandscape, poPortrait, poSquare);

  TFileMetadata = record
    FilePath: string;
    Width: Integer;
    Height: Integer;
    HasExif: Boolean;
    CameraMake: string;
    CameraModel: string;
    DateTimeOriginal: TDateTime;
    Orientation: TImgOrientation;
  end;

implementation

end.
