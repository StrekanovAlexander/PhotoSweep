unit uFileController;

interface

uses
  System.IOUtils, System.SysUtils, System.Generics.Collections,
  Vcl.Dialogs, Vcl.Buttons,
  uAppEnums,
  uItem,
  uItemsManager,
  uLogger,
  uListViewController;

type TFileController = class
  private
    FItemsManager: TItemsManager;
    FListViewController: TListViewController;
    FSourceFolder: string;
    FTargetFolder: string;
    procedure Move;
    procedure Copy;
  public
    constructor Create(
      AItemsManager: TItemsManager;
      AListViewController: TListViewController;
      ASourceFolder: string;
      ATargetFolder: string
    );

    procedure Execute(ActionMode: TActionMode);
end;

implementation

constructor TFileController.Create(
  AItemsManager: TItemsManager;
  AListViewController: TListViewController;
  ASourceFolder: string;
  ATargetFolder: string
);
begin
  FItemsManager := AItemsManager;
  FListViewController := AListViewController;
  FSourceFolder := ASourceFolder;
  FTargetFolder := ATargetFolder;
end;

procedure TFileController.Execute(ActionMode: TActionMode);
begin
  case ActionMode of
    mdMove: Move;
    mdCopy: Copy;
  end;
end;

procedure TFileController.Move;
var
  Item: TItem;
  SourcePath, TargetPath, TempPath: string;
  MovedCount: Integer;
  ToMove: TList<TItem>;
  i: Integer;
begin
  if FItemsManager.GetSelectedItemsCount = 0 then
  begin
    ShowMessage('No files selected.');
    Exit;
  end;
  MovedCount := 0;
  ToMove := TList<TItem>.Create;
  try
    for i := 0 to FItemsManager.Count - 1 do
      if FItemsManager.GetItem(i).IsSelected then
        ToMove.Add(FItemsManager.GetItem(i));
    for Item in ToMove do
    begin
      SourcePath := Item.FilePath;
      TargetPath := TPath.Combine(FTargetFolder, Item.FileName);
      TempPath := TargetPath + '.part';
      try
        TFile.Copy(SourcePath, TempPath, True);
        if not FileExists(TempPath) then
        begin
          Logger.Add(Format('ERROR: Failed to copy %s to temp %s', [SourcePath, TempPath]));
          Continue;
        end;
        if FileExists(TargetPath) then
          TFile.Delete(TargetPath);
        TFile.Move(TempPath, TargetPath);
        TFile.Delete(SourcePath);
        Inc(MovedCount);
        Logger.Add(Format('Moved: %s -> %s', [SourcePath, TargetPath]));
      except
        on E: Exception do
        begin
          Logger.Add(Format('ERROR: Failed to move %s. Exception: %s', [SourcePath, E.Message]));
          if FileExists(TempPath) then
            TFile.Delete(TempPath);
        end;
      end;
    end;
    for Item in ToMove do
      FItemsManager.RemoveItem(Item);
  finally
    ToMove.Free;
  end;
  FListViewController.Refresh(FItemsManager);
  ShowMessage(Format('%d file(s) moved successfully.', [MovedCount]));
end;

procedure TFileController.Copy;
var
  Item: TItem;
  SourcePath, TargetPath: string;
  CopiedCount: Integer;
begin
  if FItemsManager.GetSelectedItemsCount = 0 then
  begin
    ShowMessage('No files selected.');
    Exit;
  end;
  CopiedCount := 0;
  for var i := 0 to FItemsManager.Count - 1 do
  begin
    Item := FItemsManager.GetItem(i);
    if Item.IsSelected then
    begin
      SourcePath := Item.FilePath;
      TargetPath := TPath.Combine(FTargetFolder, Item.FileName);
      try
        TFile.Copy(SourcePath, TargetPath, True);
        if FileExists(TargetPath) then
        begin
          Inc(CopiedCount);
          Logger.Add(Format('Copied: %s -> %s', [SourcePath, TargetPath]));
        end
        else
          Logger.Add(Format('ERROR: Failed to copy %s', [SourcePath]));
      except
        on E: Exception do
          Logger.Add(Format('ERROR: Failed to copy %s. Exception: %s', [SourcePath, E.Message]));
      end;
    end;
  end;
  ShowMessage(Format('%d file(s) copied successfully.', [CopiedCount]));
end;


end.
