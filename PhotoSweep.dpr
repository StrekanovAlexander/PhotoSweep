program PhotoSweep;

uses
  Vcl.Forms,
  uMain in 'src\uMain.pas' {fmMain},
  Vcl.Themes,
  Vcl.Styles,
  uAppTypes in 'src\Model\uAppTypes.pas',
  uItem in 'src\Core\uItem.pas',
  CCR.Exif in 'libs\CCRExif\CCR.Exif.pas',
  CCR.Exif.BaseUtils in 'libs\CCRExif\CCR.Exif.BaseUtils.pas',
  CCR.Exif.StreamHelper in 'libs\CCRExif\CCR.Exif.StreamHelper.pas',
  CCR.Exif.Consts in 'libs\CCRExif\CCR.Exif.Consts.pas',
  CCR.Exif.TagIDs in 'libs\CCRExif\CCR.Exif.TagIDs.pas',
  CCR.Exif.IPTC in 'libs\CCRExif\CCR.Exif.IPTC.pas',
  CCR.Exif.TiffUtils in 'libs\CCRExif\CCR.Exif.TiffUtils.pas',
  CCR.Exif.XMPUtils in 'libs\CCRExif\CCR.Exif.XMPUtils.pas',
  uIFileMetadataReader in 'src\Core\Interfaces\uIFileMetadataReader.pas',
  uFileMetadataReader in 'src\Core\uFileMetadataReader.pas',
  uFileScanThread in 'src\Core\uFileScanThread.pas',
  uFileMetadata in 'src\Core\uFileMetadata.pas',
  uItemsManager in 'src\Core\uItemsManager.pas',
  uListViewController in 'src\Controllers\uListViewController.pas',
  uAppConsts in 'src\Model\uAppConsts.pas',
  uFileUtils in 'src\Utils\uFileUtils.pas',
  uGraphicUtils in 'src\Utils\uGraphicUtils.pas',
  uSelectionController in 'src\Controllers\uSelectionController.pas',
  uIFilter in 'src\Core\Interfaces\uIFilter.pas',
  uHasExifFilter in 'src\Core\uHasExifFilter.pas',
  uFilterSet in 'src\Core\uFilterSet.pas',
  uFilterController in 'src\Controllers\uFilterController.pas',
  uOrientationFilter in 'src\Core\uOrientationFilter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
