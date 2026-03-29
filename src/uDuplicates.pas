unit uDuplicates;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uItem,
  uItemsManager, Vcl.ComCtrls, System.ImageList, Vcl.ImgList,
  SVGIconImageListBase, SVGIconImageList, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfmDuplicates = class(TForm)
    lvwDuplicates: TListView;
    svgIcons: TSVGIconImageList;
    pnlSelectBtns: TPanel;
    btnSelect: TBitBtn;
    btnDeselect: TBitBtn;
    svgBtns: TSVGIconImageList;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure lvwDuplicatesItemChecked(Sender: TObject; Item: TListItem);
    procedure lvwDuplicatesCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnDeselectClick(Sender: TObject);
  private
    FCheckableIndices: TList<Integer>;
    FDuplicateGroups: TDictionary<string, TList<TItem>>;
    procedure PopulateList;
  public
    constructor Create(
      AOwner: TComponent;
      ADuplicateGroups: TDictionary<string, TList<TItem>>
    ); reintroduce;
  end;

var
  fmDuplicates: TfmDuplicates;

implementation

{$R *.dfm}

procedure TfmDuplicates.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDuplicates.btnDeselectClick(Sender: TObject);
var
  Item: TListItem;
begin
  for var i in FCheckableIndices do
  begin
    Item := lvwDuplicates.Items[i];
    Item.Checked := False;
    Item.ImageIndex := -1;
  end;
end;

procedure TfmDuplicates.btnSelectClick(Sender: TObject);
var
  Item: TListItem;
begin
  for var i in FCheckableIndices do
  begin
    Item := lvwDuplicates.Items[i];
    Item.Checked := True;
    Item.ImageIndex := 1;
  end;
end;

constructor TfmDuplicates.Create(
  AOwner: TComponent;
  ADuplicateGroups: TDictionary<string, TList<TItem>>
);
begin
  inherited Create(AOwner);
  FDuplicateGroups := ADuplicateGroups;
  FCheckableIndices := TList<Integer>.Create;
end;

procedure TfmDuplicates.FormShow(Sender: TObject);
begin
  PopulateList;
end;

procedure TfmDuplicates.lvwDuplicatesCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
const
  BG_GRAY = $00222222;
begin
  if Item.Data = nil then
  begin
    Sender.Canvas.Font.Color := clYellow;
    Sender.Canvas.Brush.Color := BG_GRAY;
    Sender.Canvas.FillRect(Item.DisplayRect(drBounds));
    Sender.Canvas.TextOut(Item.DisplayRect(drLabel).Left, Item.DisplayRect(drLabel).Top, Item.Caption);
    DefaultDraw := False;
  end
  else
    DefaultDraw := True;
end;

procedure TfmDuplicates.lvwDuplicatesItemChecked(Sender: TObject; Item: TListItem);
begin
  if (Item.Data = nil) or (FCheckableIndices.IndexOf(Item.Index) = -1) then
  begin
    Item.Checked := (Item.Data <> nil) and (Item.Index > 0) and (lvwDuplicates.Items[Item.Index-1].Data = nil);
    Exit;
  end;
  if Item.Checked then
    Item.ImageIndex := 1
  else
    Item.ImageIndex := -1;
end;

procedure TfmDuplicates.PopulateList;
var
  Pair: TPair<string, TList<TItem>>;
  Item: TItem;
  ListItem: TListItem;
  GroupIndex: Integer;
begin
  FCheckableIndices.Clear;
  lvwDuplicates.Items.BeginUpdate;
  try
    lvwDuplicates.Items.Clear;
    GroupIndex := 1;
    for Pair in FDuplicateGroups do
    begin
      ListItem := lvwDuplicates.Items.Add;
      ListItem.Caption := Format('Duplicates Group %d', [GroupIndex]);
      ListItem.Data := nil;
      ListItem.Checked := False;

      for var i := 0 to Pair.Value.Count - 1 do
      begin
        Item := Pair.Value[i];
        ListItem := lvwDuplicates.Items.Add;
        ListItem.Caption := Item.FileName;
        ListItem.SubItems.Add(Item.FilePath);
        ListItem.Data := Item;

        if i = 0 then
        begin
          ListItem.Checked := True;
          ListItem.ImageIndex := 0;
        end
        else
        begin
          ListItem.Checked := False;
          ListItem.ImageIndex := -1;
          FCheckableIndices.Add(ListItem.Index);
        end;
      end;
      Inc(GroupIndex);
    end;
  finally
    lvwDuplicates.Items.EndUpdate;
  end;
end;

end.
