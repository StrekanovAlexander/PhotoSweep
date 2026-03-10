unit uIFileMetadataReader;

interface

uses
  uFileMetadata;

type

  IFileMetadataReader = interface
    ['{559D3DA7-D50D-49AE-ACAC-5F2BB7516021}']
    function Read(const FileName: string): TFileMetadata;
  end;

implementation

end.
