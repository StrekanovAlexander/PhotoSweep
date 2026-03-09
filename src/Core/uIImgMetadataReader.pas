unit uIImgMetadataReader;

interface

type
  TImgOrientation = (poLandscape, poPortrait, poSquare);

  TImgMetadata = record
    Width: Integer;
    Height: Integer;
    HasExif: Boolean;
    CameraMake: string;
    DateTimeOriginal: TDateTime;
    Orientation: TImgOrientation;
  end;

  IImgMetadataReader = interface
  ['{559D3DA7-D50D-49AE-ACAC-5F2BB7516021}']
    function Read(const FileName: string): TImgMetadata;
  end;

implementation

end.
