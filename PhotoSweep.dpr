program PhotoSweep;

uses
  Vcl.Forms,
  uMain in 'src\uMain.pas' {fmMain},
  Vcl.Themes,
  Vcl.Styles,
  uAppTypes in 'src\Model\uAppTypes.pas',
  uToolsPanelController in 'src\Controllers\uToolsPanelController.pas',
  ufrSortTools in 'src\UI\Frames\ufrSortTools.pas' {frSortTools: TFrame},
  ufrDuplicateTools in 'src\UI\Frames\ufrDuplicateTools.pas' {frDuplicateTools: TFrame},
  uImgItem in 'src\Core\uImgItem.pas',
  CCR.Exif in 'libs\CCRExif\CCR.Exif.pas',
  CCR.Exif.BaseUtils in 'libs\CCRExif\CCR.Exif.BaseUtils.pas',
  CCR.Exif.StreamHelper in 'libs\CCRExif\CCR.Exif.StreamHelper.pas',
  CCR.Exif.Consts in 'libs\CCRExif\CCR.Exif.Consts.pas',
  CCR.Exif.TagIDs in 'libs\CCRExif\CCR.Exif.TagIDs.pas',
  CCR.Exif.IPTC in 'libs\CCRExif\CCR.Exif.IPTC.pas',
  CCR.Exif.TiffUtils in 'libs\CCRExif\CCR.Exif.TiffUtils.pas',
  CCR.Exif.XMPUtils in 'libs\CCRExif\CCR.Exif.XMPUtils.pas',
  uIImgMetadataReader in 'src\Core\uIImgMetadataReader.pas',
  uImgMetadataReader in 'src\Core\uImgMetadataReader.pas',
  uFileScanThread in 'src\Core\uFileScanThread.pas',
  uFileMetadata in 'src\Core\uFileMetadata.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
