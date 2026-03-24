unit uViewer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfmViewer = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    FCurrentIndex: Integer;
  public
    constructor Create(AOwner: TComponent; AIndex: Integer); reintroduce;
  end;

var
  fmViewer: TfmViewer;

implementation

{$R *.dfm}

constructor TfmViewer.Create(AOwner: TComponent; AIndex: Integer);
begin
  inherited Create(AOwner);
  FCurrentIndex := AIndex;
end;

procedure TfmViewer.FormShow(Sender: TObject);
begin
  ShowMessage(IntToStr(FCurrentIndex));
end;

end.
