unit uWait;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, SVGIconImage;

type
  TfmWait = class(TForm)
    lblMessage: TLabel;
    svgImg: TSVGIconImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmWait: TfmWait;

implementation

{$R *.dfm}

end.
