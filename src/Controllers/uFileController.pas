unit uFileController;

interface

uses
  Vcl.Dialogs, Vcl.Buttons,
  uItemsManager;

type TFileController = class
  private
    FItemsManager: TItemsManager;
    FSourceFolder: string;
    FTargetFolder: string;
    FMoveBtn: TBitBtn;
    FCopyBtn: TBitBtn;

    procedure MoveBtnClick(Sender: TObject);
    procedure CopyBtnClick(Sender: TObject);
  public
    constructor Create(
      AItemsManager: TItemsManager;
      ASourceFolder: string;
      ATargetFolder: string;
      AMoveBtn: TBitBtn;
      ACopyBtn: TBitBtn
    );

end;

implementation

constructor TFileController.Create(
  AItemsManager: TItemsManager;
  ASourceFolder: string;
  ATargetFolder: string;
  AMoveBtn: TBitBtn;
  ACopyBtn: TBitBtn
);
begin
  FItemsManager := AItemsManager;
  FSourceFolder := ASourceFolder;
  FTargetFolder := ATargetFolder;

  FMoveBtn := AMoveBtn;
  FCopyBtn := ACopyBtn;
  FMoveBtn.OnClick := MoveBtnClick;
  FCopyBtn.OnClick := CopyBtnClick;
end;

procedure TFileController.MoveBtnClick(Sender: TObject);
begin
  if FItemsManager.GetSelectedItemsCount = 0 then
  begin
    ShowMessage('No files selected.');
    Exit;
  end;

  ShowMessage('Moving files...');
end;

procedure TFileController.CopyBtnClick(Sender: TObject);
begin
  if FItemsManager.GetSelectedItemsCount = 0 then
  begin
    ShowMessage('No files selected.');
    Exit;
  end;
  ShowMessage('Copying files...');
end;

end.
