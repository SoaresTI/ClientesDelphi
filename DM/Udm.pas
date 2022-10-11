unit Udm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  Tdm = class(TDataModule)
    con: TFDConnection;
    FBDriverLink1: TFDPhysFBDriverLink;
    RESTRequest1: TRESTRequest;
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
    QrClientes: TFDQuery;
    QrClientesCLI_TIPO: TStringField;
    QrClientesCLI_DOCUMENTO: TStringField;
    QrClientesCLI_DATA_CADASTRO: TDateField;
    QrClientesCLI_ATIVO: TStringField;
    QrClientesCLI_LAGRADOURO: TStringField;
    QrClientesCLI_NUMERO: TStringField;
    QrClientesCLI_CEP: TStringField;
    QrClientesCLI_BAIRRO: TStringField;
    QrClientesCLI_CIDADE: TStringField;
    QrClientesCLI_ESTADO: TStringField;
    QrClientesCLI_PAIS: TStringField;
    QrClientesCLI_NOME: TStringField;
    QrClientesCLI_RG_IE: TStringField;
    QrTelefones: TFDQuery;
    QrTelefonesTEL_ID: TIntegerField;
    QrTelefonesTEL_CLI_ID: TIntegerField;
    QrTelefonesTEL_TELEFONE: TStringField;
    QrClientesCLI_ID: TIntegerField;
    qrUtil: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses
  Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  con.Connected := False;
  con.Params.Clear;
  con.DriverName:='FB';
  con.Params.Add('database='+'C:\Users\PC01\Desktop\Felipe\Exercicios\DELPHI\Banco\BANCO.FDB');
  con.Params.Add('port=3050');
  con.Params.Add('server=LOCALHOST');
  con.Params.Add('user_name=SYSDBA');
  con.Params.Add('password=masterkey');
  con.Connected := true;

  if con.Connected = false then
  begin
    showmessage('Ocorreu algum erro ao conectar o banco de dados, verificar o caminho do mesmo!');
  end;
end;

end.
