unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, FMX.ListBox;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Memo1: TMemo;
    Rectangle1: TRectangle;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private

    { Déclarations privées }
  public
    { Déclarations publiques }
    nametown : string;

  end;

var
  Form1: TForm1;


implementation

{$R *.fmx}


procedure TForm1.Button1Click(Sender: TObject);
begin
  RESTClient1.Params.ParameterByName('q').Value := nametown;
  RESTRequest1.Execute;
  Memo1.Text := RESTResponse1.JSonText;
end;

end.
