unit uGraphicUtils;

interface

uses
   Winapi.Windows,
  System.Math,
  System.Types,
  Vcl.Graphics,
  Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage,
  Vcl.Imaging.GIFImg
;

function ResizeThumbnail(Source: TBitmap; Size: Integer): TBitmap;

function CreateBitmapFromJpeg(const FileName: string): TBitmap;
function CreateBitmapFromGif(const FileName: string): TBitmap;
function CreateBitmapFromPng(const FileName: string): TBitmap;

implementation

function ResizeThumbnail(Source: TBitmap; Size: Integer): TBitmap;
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

function CreateBitmapFromJpeg(const FileName: string): TBitmap;
var
  Jpg: TJPEGImage;
begin
  Result := TBitmap.Create;
  Jpg := TJPEGImage.Create;
  try
    Jpg.LoadFromFile(FileName);
    Result.PixelFormat := pf24bit;
    Result.SetSize(Jpg.Width, Jpg.Height);
    Result.Canvas.Draw(0, 0, Jpg);
  finally
    Jpg.Free;
  end;
end;

function CreateBitmapFromPng(const FileName: string): TBitmap;
var
  Png: TPngImage;
begin
  Result := TBitmap.Create;
  Result.PixelFormat := pf24bit;
  Png := TPngImage.Create;
  try
    Png.LoadFromFile(FileName);
    Result.Assign(Png);
  finally
    Png.Free;
  end;
end;

function CreateBitmapFromGif(const FileName: string): TBitmap;
var
  Gif: TGIFImage;
begin
  Result := TBitmap.Create;
  Result.PixelFormat := pf24bit;
  Gif := TGIFImage.Create;
  try
    Gif.LoadFromFile(FileName);
    Result.Assign(Gif.Images[0].Bitmap);
  finally
    Gif.Free;
  end;
end;

end.
