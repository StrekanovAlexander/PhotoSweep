unit uFileMetadata;

interface

uses Vcl.Graphics;

type
  TOrientation = (poLandscape, poPortrait, poSquare);

  TFileMetadata = class
    private
      FFilePath: string;
      FWidth: Integer;
      FHeight: Integer;
      FHasExif: Boolean;

      FThumbnail: TBitmap;
      FHasThumbnail: Boolean;

      FCameraMake: string;
      FCameraModel: string;
      FDateTimeOriginal: TDateTime;

      function GetOrientation: TOrientation;
      procedure SetThumbnail(Value: TBitmap);

    public
      constructor Create;
      destructor Destroy; override;

      property FilePath: string read FFilePath write FFilePath;

      property Width: Integer read FWidth write FWidth;
      property Height: Integer read FHeight write FHeight;

      property HasExif: Boolean read FHasExif write FHasExif;

      property Thumbnail: TBitmap read FThumbnail write SetThumbnail;
      property HasThumbnail: Boolean read FHasThumbnail write FHasThumbnail;

      property CameraMake: string read FCameraMake write FCameraMake;
      property CameraModel: string read FCameraModel write FCameraModel;
      property DateTimeOriginal: TDateTime read FDateTimeOriginal write FDateTimeOriginal;

      property Orientation: TOrientation read GetOrientation;
end;

implementation

constructor TFileMetadata.Create;
begin
  inherited;
  FThumbnail := nil;
  FHasThumbnail := False;
  FHasExif := False;
end;

destructor TFileMetadata.Destroy;
begin
  Thumbnail.Free;
  inherited;
end;

procedure TFileMetadata.SetThumbnail(Value: TBitmap);
begin
  if FThumbnail <> Value then
  begin
    FThumbnail.Free;
    FThumbnail := Value;
  end;
end;

function TFileMetadata.GetOrientation: TOrientation;
begin
  if FWidth > FHeight then
    Result := poLandscape
  else if FHeight > FWidth then
    Result := poPortrait
  else
    Result := poSquare;
end;

end.
