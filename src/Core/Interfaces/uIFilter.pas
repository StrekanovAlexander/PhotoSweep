unit uIFilter;

interface

uses
  uFileMetadata;

type IFilter = interface
    ['{C5B249F6-8B04-4613-A764-DF6ADFAABF01}']
    function Apply(Item: TFileMetadata): Boolean;
  end;

implementation

end.
