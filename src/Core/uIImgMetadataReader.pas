unit uIImgMetadataReader;

interface

uses
  uFileMetadata;

type

  IImgMetadataReader = interface
  ['{559D3DA7-D50D-49AE-ACAC-5F2BB7516021}']
    function Read(const FileName: string): TFileMetadata;
  end;

implementation

end.
