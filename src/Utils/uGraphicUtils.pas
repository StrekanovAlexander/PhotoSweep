unit uGraphicUtils;

interface

uses
  Winapi.Windows,
  System.Math,
  System.Types,
  Vcl.Graphics
;

function SetBitmapThumbnail(Source: TBitmap; Size: Integer): TBitmap;
function SetPicThumbnail(Source: TPicture; Size: Integer): TBitmap;

implementation

function SetBitmapThumbnail(Source: TBitmap; Size: Integer): TBitmap;
var
  Scale: Double;
  NewW, NewH: Integer;
  X, Y: Integer;
begin
  Result := TBitmap.Create;
  Result.SetSize(Size, Size);
  Result.PixelFormat := pf24bit;

  Result.Canvas.Brush.Color := clBlack;
  Result.Canvas.FillRect(Rect(0, 0, Size, Size));

  Scale := Min(Size / Source.Width, Size / Source.Height);

  NewW := Round(Source.Width * Scale);
  NewH := Round(Source.Height * Scale);

  X := (Size - NewW) div 2;
  Y := (Size - NewH) div 2;

  SetStretchBltMode(Result.Canvas.Handle, HALFTONE);

  Result.Canvas.StretchDraw(
    Rect(X, Y, X + NewW, Y + NewH),
    Source
  );
end;

function SetPicThumbnail(Source: TPicture; Size: Integer): TBitmap;
var
  Scale: Double;
  NewW, NewH: Integer;
  X, Y: Integer;
begin
  Result := TBitmap.Create;
  Result.SetSize(Size, Size);
  Result.PixelFormat := pf24bit;

  Result.Canvas.Brush.Color := clBlack;
  Result.Canvas.FillRect(Rect(0, 0, Size, Size));

  Scale := Min(Size / Source.Width, Size / Source.Height);

  NewW := Round(Source.Width * Scale);
  NewH := Round(Source.Height * Scale);

  X := (Size - NewW) div 2;
  Y := (Size - NewH) div 2;

  SetStretchBltMode(Result.Canvas.Handle, HALFTONE);

  Result.Canvas.StretchDraw(
    Rect(X, Y, X + NewW, Y + NewH),
    Source.Graphic
  );
end;

end.
