unit uDuplicatesController;

interface

uses
  System.SysUtils, System.Classes, IdHash, IdHashMessageDigest,
  System.Generics.Collections, System.Generics.Defaults,
  Vcl.Dialogs, Vcl.Buttons,
  uItem, uItemsManager,
  uListViewController, uFilterController,
  uDuplicates;

type TDuplicatesController = class
  private
    FItemsManager: TItemsManager;
    FListViewController: TListViewController;
    FFilterController: TFilterController;
    FDuplicatesDictionary: TDictionary<string, TList<TItem>>;
    FDuplicatesBtn: TBitbtn;

    procedure DuplicatesBtnClick(Sender: TObject);
    function BuildDuplicateGroups: TDictionary<string, TList<TItem>>;
    function GetFileHash(const AFilePath: string): string;
  public
    constructor Create(
      AItemsManager: TItemsManager;
      AListViewController: TListViewController;
      AFilterController: TFilterController;
      ADuplicatesBtn: TBitbtn
    );
    destructor Destroy; override;
end;

implementation

const
  MR_OK = 1;

constructor TDuplicatesController.Create(
  AItemsManager: TItemsManager;
  AListViewController: TListViewController;
  AFilterController: TFilterController;
  ADuplicatesBtn: TBitbtn
);
begin
  FItemsManager :=  AItemsManager;
  FListViewController := AListViewController;
  FFilterController := AFilterController;
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
    begin
      List.Clear;
      List.Free;
    end;
    FDuplicatesDictionary.Free;
  end;
  inherited;
end;

procedure TDuplicatesController.DuplicatesBtnClick(Sender: TObject);
var
  fmDuplicates: TfmDuplicates;
  Item: TItem;
begin
  if FItemsManager.Count = 0 then
    Exit;

  FDuplicatesDictionary.Free;
  FDuplicatesDictionary := BuildDuplicateGroups;

  if FDuplicatesDictionary.Count = 0 then
  begin
     ShowMessage('No duplicates.');
     Exit;
  end;

  FFilterController.ResetCheckBoxes;

  fmDuplicates := TfmDuplicates.Create(nil, FDuplicatesDictionary);
  try
    if fmDuplicates.ShowModal = MR_OK then
    begin
      for Item in fmDuplicates.SelectedDuplicatesList do
      begin
        if FileExists(Item.FilePath) then
          DeleteFile(Item.FilePath);
        FItemsManager.RemoveItem(Item);
      end;
      FListViewController.Refresh(FItemsManager);
    end;
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
