unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Colors,
  FMX.Ani, FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit,
  FMX.TabControl, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Response.Adapter, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo,
  System.ImageList, FMX.ImgList,Unit1;

type
  TForm4 = class(TForm)
    Rectangle1: TRectangle;
    Button1: TButton;
    ImageList1: TImageList;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    ImageControl2: TImageControl;
    ImageControl3: TImageControl;
    ImageControl4: TImageControl;
    Timer1: TTimer;
    TabItem5: TTabItem;
    Rectangle2: TRectangle;
    Button4: TButton;
    Text1: TText;
    ImageControl1: TImageControl;
    procedure Timer1Timer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    ville : string;
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}
procedure TForm4.Button4Click(Sender: TObject);
begin
   ville := Edit1.Text;
   if length ( ville) > 0 then
   begin
      form1.nametown := ville;
      form1.showModal;
      form4.close;
   end;

end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
   Timer1.Enabled := true;
   Timer1.Interval := 2000;
   TabControl1.Next(TTabTransition.None,
   TTabTransitionDirection.Normal);
   if (TabControl1.TabIndex = 4 ) then
      begin
        TabControl1.TabIndex := 0;
      end;
end;

end.
