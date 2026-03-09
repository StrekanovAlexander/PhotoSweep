unit uToolsPanelController;

interface

uses
  System.Classes,
  Vcl.Buttons,
  Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Forms,
  Vcl.Graphics,
  uAppTypes,
  ufrSortTools, ufrDuplicateTools;

type
  TFrameClass = class of TFrame;

  TToolsPanelController = class
  private
    FOwner: TComponent;
    FAppMode: TAppMode;

    FPanelHost: TPanel;
    FBtnSort: TBitBtn;
    FBtnDuplicates: TBitBtn;

    FCurrentFrame: TFrame;

    procedure SetMode(AAppMode: TAppMode);
    procedure UpdateButtons;
    procedure LoadFrame(AFrameClass: TFrameClass);

  public
    constructor Create(AOwner: TComponent; APanelHost: TPanel;
      ASortBtn, ADuplicateBtn: TBitBtn);

    procedure SortClick(Sender: TObject);
    procedure DuplicateClick(Sender: TObject);

    property AppMode: TAppMode read FAppMode;
  end;

implementation

constructor TToolsPanelController.Create(
  AOwner: TComponent;
  APanelHost: TPanel;
  ASortBtn, ADuplicateBtn: TBitBtn
);
begin
  FOwner := AOwner;
  FPanelHost := APanelHost;
  FBtnSort := ASortBtn;
  FBtnDuplicates := ADuplicateBtn;

  FBtnSort.OnClick := SortClick;
  FBtnDuplicates.OnClick := DuplicateClick;

  SetMode(amSort);
end;

procedure TToolsPanelController.SetMode(AAppMode: TAppMode);
begin
  FAppMode := AAppMode;
  UpdateButtons;
   case FAppMode of
    amSort: LoadFrame(TfrSortTools);
    amDuplicates: LoadFrame(TfrDuplicateTools);
  end;
end;

procedure TToolsPanelController.UpdateButtons;
begin
  FBtnSort.Font.Style := [];
  FBtnDuplicates.Font.Style := [];

  case FAppMode of
    amSort: FBtnSort.Font.Style := [fsBold];
    amDuplicates: FBtnDuplicates.Font.Style := [fsBold];
  end;

  FBtnSort.Repaint;
  FBtnDuplicates.Repaint;
end;

procedure TToolsPanelController.SortClick(Sender: TObject);
begin
  SetMode(amSort);
end;

procedure TToolsPanelController.DuplicateClick(Sender: TObject);
begin
  SetMode(amDuplicates);
end;

procedure TToolsPanelController.LoadFrame(AFrameClass: TFrameClass);
begin
  if Assigned(FCurrentFrame) then
  begin
    FCurrentFrame.Free;
    FCurrentFrame := nil;
  end;

  FCurrentFrame := AFrameClass.Create(FOwner);
  FCurrentFrame.Parent := FPanelHost;
  FCurrentFrame.Align := alClient;
end;

end.
