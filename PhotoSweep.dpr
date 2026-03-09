program PhotoSweep;

uses
  Vcl.Forms,
  uMain in 'src\uMain.pas' {fmMain},
  Vcl.Themes,
  Vcl.Styles,
  uAppTypes in 'src\Model\uAppTypes.pas',
  uToolsPanelController in 'src\Controllers\uToolsPanelController.pas',
  ufrSortTools in 'src\UI\Frames\ufrSortTools.pas' {frSortTools: TFrame},
  ufrDuplicateTools in 'src\UI\Frames\ufrDuplicateTools.pas' {frDuplicateTools: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
