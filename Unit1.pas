unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, FMX.ListBox,System.JSON, System.ImageList,FMX.ImgList,IdHTTP,
  Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Memo1: TMemo;
    Button1: TButton;
    datehour: TLabel;
    température: TLabel;
    wind: TLabel;
    cloud: TLabel;
    humidity: TLabel;
    Précipité: TLabel;
    Pression: TLabel;
    latitude: TLabel;
    Longitude: TLabel;
    Text1: TText;
    Button2: TButton;
    texte: TLabel;
    localisation: TText;
    ImageControl3: TImageControl;
    ImageControl1: TImageControl;
    ImageControl2: TImageControl;
    ImageList1: TImageList;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    no: TLabel;
    o3: TLabel;
    so: TLabel;
    co: TLabel;
    icon: TImageControl;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);


  private

    { Déclarations privées }
  public
    { Déclarations publiques }
    nametown : string;

  end;

var
  Form1: TForm1;
  weather,MainJSON : TJSONObject;
  HTTP: TIdHTTP;
  PNG: TPngImage;
  iconBitmap : TBitmap;
  dioxydeazote,MonoxydeCarbone,trioxygene,dioxydeSodium,icone : string;

implementation

{$R *.fmx}
{$R *.Surface.fmx MSWINDOWS}

procedure TForm1.Button1Click(Sender: TObject);

begin
   Button1.Visible := False;
    co.Visible := True;
    datehour.Visible := True;
    température.Visible := True;
    wind.Visible := True;
    cloud.Visible := True;
    humidity.Visible := True;
    Précipité.Visible := True;
    Pression.Visible := True;
    latitude.Visible := True;
    Longitude.Visible := True;
    o3.Visible := True;
    so.Visible := True;
    Text1.Visible := True;
    Button2.Visible := True;
    texte.Visible := True;
    localisation.Visible := True;
    ImageControl1.Visible := True;
    ImageControl2.Visible := True;
    ImageControl3.Visible := True;
    Rectangle1.Visible := True;
    Rectangle2.Visible := True;
    Rectangle3.Visible := True;
    Rectangle4.Visible := True;
    no.Visible := True;

  RESTRequest1.Params.ParameterByName('q').Value := nametown;
  RESTRequest1.Execute;
  weather := TJSONObject.ParseJSONValue(RESTResponse1.Content)as TJSONObject;
  MainJSON := weather.GetValue <TJSONObject>('current');
  texte.Text := MainJSON.GetValue <string> ('condition.text');
  wind.Text := MainJSON.GetValue <string> ('wind_kph');
  température.Text := MainJSON.GetValue <string> ('temp_c');
  Pression.Text := MainJSON.GetValue <string> ('pressure_mb');
  Précipité.Text := MainJSON.GetValue <string> ('precip_mm');
  cloud.Text := MainJSON.GetValue <string> ('cloud');
  dioxydeazote :=MainJSON.GetValue <string> ('air_quality.no2');
  no.Text :=   Format('%.5s',[dioxydeazote ]);
  MonoxydeCarbone := MainJSON.GetValue <string> ('air_quality.co');
  co.Text :=  Format('%.5s',[MonoxydeCarbone]);
  trioxygene:= MainJSON.GetValue <string> ('air_quality.o3');
  o3.Text :=  Format('%.5s',[trioxygene]);
  dioxydeSodium := MainJSON.GetValue <string> ('air_quality.so2');
  so.Text :=  Format('%.5s',[dioxydeSodium]);
  humidity.Text := MainJSON.GetValue <string> ('humidity');
  icone := 'https:'+ MainJSON.GetValue <string> ('condition.icon');
     HTTP := TIdHTTP.Create(nil);
     PNG := TPngImage.Create;

     icon.Bitmap.Assign(PNG);
  MainJSON := weather.GetValue <TJSONObject>('location');
  latitude.Text := MainJSON.GetValue <string> ('lat');
  Longitude.Text := MainJSON.GetValue <string> ('lon');
  datehour.Text := MainJSON.GetValue <string> ('localtime');
  localisation.Text := MainJSON.GetValue <string> ('name')+ ','+
  MainJSON.GetValue <string> ('region')+','+ MainJSON.GetValue <string> ('country');



end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;






end.
