unit untMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  ksInputList, FMX.Objects, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Edit, FMX.ScrollBox, FMX.Memo, FMX.Types, FMX.ListBox,
  ksToolBar;

type
  TfrmMain = class(TForm)
    Image1: TImage;
    ksInputList1: TksInputList;
    ToolBar1: TToolBar;
    ksToolbar1: TksToolbar;
    procedure FormCreate(Sender: TObject);
    procedure ksInputList1ItemButtonClick(Sender: TObject;
      AItem: TksInputListButtonItem; AID: string);
    procedure ksInputList1ItemTrackBarChange(Sender: TObject;
      AItem: TksInputListTrackBarItem; AID: string; AValue: Single);
    procedure ksInputList1ItemSwitchChanged(Sender: TObject;
      AItem: TksInputListSwitchItem; AID: string; AIsChecked: Boolean);
    procedure ksToolbar1MenuButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    FClipboard: string;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses System.UIConsts, Json, FMX.DialogService, untSideMenu;

{$R *.fmx}

procedure TfrmMain.FormCreate(Sender: TObject);
var
  ICount: integer;
begin
  for ICount := 1 to 3 do
  begin
  //ksInputList1.BeginUpdate;
  ksInputList1.Items.AddSeperator('SETTINGS');
  ksInputList1.Items.AddItemSelector('LOOKUP_1', Image1.Bitmap, 'Selector Item', '4', ['1','2','3','4','5','6','7','8','9','10']);
  ksInputList1.Items.AddEditBoxItem('PHONEEDIT_'+ICount.ToString, Image1.Bitmap, 'Phone Keyboard', '', 'NUMBER', TVirtualKeyboardType.PhonePad);
  ksInputList1.Items.AddEditBoxItem('URLEDIT_'+ICount.ToString, Image1.Bitmap, 'URL Keyboard', '', 'URL', TVirtualKeyboardType.URL);
  ksInputList1.Items.AddSwitchItem('SWITCH_1', Image1.Bitmap, 'Item 3', False);
  ksInputList1.Items.AddSwitchItem('SWITCH_2', Image1.Bitmap, 'Item 4', True);
  ksInputList1.Items.AddCheckBoxItem('CHECKBOX_1', Image1.Bitmap, 'Item 5', False);
  ksInputList1.Items.AddCheckBoxItem('CHECKBOX_2', Image1.Bitmap, 'Item 6', True);
  ksInputList1.Items.AddButtonItem('BUTTON_1', Image1.Bitmap, 'Item 7', 'Test');
  ksInputList1.Items.AddTrackBar('TRACKBAR_1', Image1.Bitmap, 'Item 8', 50, 100);
  //ksInputList1.EndUpdate;
end;
end;

procedure TfrmMain.ksInputList1ItemButtonClick(Sender: TObject;
  AItem: TksInputListButtonItem; AID: string);
begin
  ShowMessage('Button clicked: '+AID);
end;

procedure TfrmMain.ksInputList1ItemSwitchChanged(Sender: TObject;
  AItem: TksInputListSwitchItem; AID: string; AIsChecked: Boolean);
begin
  AItem.Title := (AID+'  '+BoolToStr(AIsChecked, True));
end;

procedure TfrmMain.ksInputList1ItemTrackBarChange(Sender: TObject;
  AItem: TksInputListTrackBarItem; AID: string; AValue: Single);
begin
  Caption := FloatToStr(AValue);
  AItem.Title := AValue.ToString;
end;


procedure TfrmMain.ksToolbar1MenuButtonClick(Sender: TObject);
begin
  frmMenu.ksSideMenu1.OpenMenu(Self);
end;

end.
