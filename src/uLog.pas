unit uLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  SVGIconImageListBase, SVGIconImageList, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls,
  uLogger;

type
  TfmLog = class(TForm)
    mmLog: TMemo;
    pnlBtns: TPanel;
    btnClose: TBitBtn;
    svgBtns: TSVGIconImageList;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmLog: TfmLog;

implementation

{$R *.dfm}

procedure TfmLog.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLog.FormShow(Sender: TObject);
begin
  mmLog.Lines.Text := Logger.GetText;
end;

end.
