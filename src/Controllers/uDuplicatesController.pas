unit uDuplicatesController;

interface

uses
  System.SysUtils, System.Classes, IdHash, IdHashMessageDigest,
  System.Generics.Collections, System.Generics.Defaults,
  Vcl.Buttons,
  uItem,
  uItemsManager,
  uDuplicates;

type TDuplicatesController = class
  private
    FItemsManager: TItemsManager;
    FDuplicatesDictionary: TDictionary<string, TList<TItem>>;
    FDuplicatesBtn: TBitbtn;

    procedure DuplicatesBtnClick(Sender: TObject);
    function BuildDuplicateGroups: TDictionary<string, TList<TItem>>;
    function GetFileHash(const AFilePath: string): string;
  public
    constructor Create(AItemsManager: TItemsManager; ADuplicatesBtn: TBitbtn);
    destructor Destroy; override;
end;

implementation

constructor TDuplicatesController.Create(AItemsManager: TItemsManager; ADuplicatesBtn: TBitbtn);
begin
  FItemsManager :=  AItemsManager;
  FDuplicatesBtn := ADuplicatesBtn;
  FDuplicatesBtn.OnClick := DuplicatesBtnClick;
end;

destructor TDuplicatesController.Destroy;
var
  List: TList<TItem>;
begin
  if Assigned(FDuplicatesDictionary) then
  begin
    for List in FDuplicatesDictionary.Values do
      List.Free;
    FDuplicatesDictionary.Free;
  end;
  inherited;
end;

procedure TDuplicatesController.DuplicatesBtnClick(Sender: TObject);
var
  fmDuplicates: TfmDuplicates;
begin
  if FItemsManager.Count = 0 then
    Exit;

  FDuplicatesDictionary := BuildDuplicateGroups;

  fmDuplicates := TfmDuplicates.Create(nil, FDuplicatesDictionary);
  try
    fmDuplicates.ShowModal;
  finally
    fmDuplicates.Free;
  end;
end;

function TDuplicatesController.BuildDuplicateGroups: TDictionary<string, TList<TItem>>;
var
  Item: TItem;
  Hash: string;
  KeysToRemove: TList<string>;
  Key: string;
begin
  Result := TDictionary<string, TList<TItem>>.Create;
  for Item in FItemsManager.ItemsList do
  begin
    Hash := GetFileHash(Item.FilePath);

    if Result.ContainsKey(Hash) then
      Result[Hash].Add(Item)
    else
      Result.Add(Hash, TList<TItem>.Create(Item));
  end;
  KeysToRemove := TList<string>.Create;
  try
    for Key in Result.Keys do
      if Result[Key].Count = 1 then
        KeysToRemove.Add(Key);

    for Key in KeysToRemove do
    begin
      Result[Key].Free;
      Result.Remove(Key);
    end;
  finally
    KeysToRemove.Free;
  end;

  for Key in Result.Keys do
    Result[Key].Sort(
      TComparer<TItem>.Construct(
        function(const Left, Right: TItem): Integer
        begin
          Result := CompareText(Right.FileName, Left.FileName);
        end
      )
    );
end;

function TDuplicatesController.GetFileHash(const AFilePath: string): string;
var
  FileStream: TFileStream;
  MD5: TIdHashMessageDigest5;
begin
  FileStream := TFileStream.Create(AFilePath, fmOpenRead or fmShareDenyWrite);
  MD5 := TIdHashMessageDigest5.Create;
  try
    Result := MD5.HashStreamAsHex(FileStream);
  finally
    FileStream.Free;
    MD5.Free;
  end;
end;

end.
