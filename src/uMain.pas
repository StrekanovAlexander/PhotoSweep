unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, SVGIconImage, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, SVGIconImageListBase, SVGIconImageList,
  Vcl.Buttons, Vcl.ComCtrls;

type
  TfmMain = class(TForm)
    pnlTop: TPanel;
    bvlTop: TBevel;
    pnlTopLogo: TPanel;
    svgLogo: TSVGIconImage;
    lblLogo: TLabel;
    btnAbout: TBitBtn;
    svgBtnList: TSVGIconImageList;
    lblSource: TLabel;
    btnSource: TBitBtn;
    stbMain: TStatusBar;
    MainPanel: TPanel;
    pnlFiles: TPanel;
    pnlTools: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

end.
