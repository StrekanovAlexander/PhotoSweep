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
  private
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

constructor TfmDuplicates.Create(
  AOwner: TComponent;
  ADuplicateGroups: TDictionary<string, TList<TItem>>
);
begin
  inherited Create(AOwner);
  FDuplicateGroups := ADuplicateGroups;
end;

procedure TfmDuplicates.FormShow(Sender: TObject);
begin
  PopulateList;
end;

procedure TfmDuplicates.lvwDuplicatesCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.Data = nil then
  begin
    Sender.Canvas.Font.Color := clYellow;
//    Sender.Canvas.Font.Style := [fsBold];
    if cdsSelected in State then
      Sender.Canvas.Brush.Color := $00222222 // темно-серый, даже при выделении
    else
      Sender.Canvas.Brush.Color := $00222222;
    Sender.Canvas.FillRect(Item.DisplayRect(drBounds));
    Sender.Canvas.TextOut(Item.DisplayRect(drLabel).Left, Item.DisplayRect(drLabel).Top, Item.Caption);
    DefaultDraw := False;
    {
    Sender.Canvas.Brush.Color := $00222222;
    Sender.Canvas.FillRect(Item.DisplayRect(drBounds));
    Sender.Canvas.Font.Color := clYellow;
    DefaultDraw := True;
    }
  end
  else
    DefaultDraw := True;
end;

procedure TfmDuplicates.lvwDuplicatesItemChecked(Sender: TObject;
  Item: TListItem);
var
  PrevItem: TListItem;
begin
  if Item.Data = nil then
  begin
    Item.Checked := False;
    Item.ImageIndex := -1;
    Exit;
  end;
  if Item.Index > 0 then
  begin
    PrevItem := lvwDuplicates.Items[Item.Index - 1];
    if PrevItem.Data = nil then
    begin
      Item.Checked := True;
      Exit;
    end;
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
        end;
      end;
      Inc(GroupIndex);
    end;
  finally
    lvwDuplicates.Items.EndUpdate;
  end;
end;

end.
