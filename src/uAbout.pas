unit uAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, SVGIconImage;

type
  TfmAbout = class(TForm)
    svgLogo: TSVGIconImage;
    lblBrand: TLabel;
    lblVersion: TLabel;
    lblDescription: TLabel;
    lblDeveloper: TLabel;
    lblYear: TLabel;
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAbout: TfmAbout;

implementation

{$R *.dfm}

procedure TfmAbout.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
