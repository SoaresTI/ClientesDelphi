program TesteDelphi;

uses
  Vcl.Forms,
  UClientes in 'Cadastro\UClientes.pas' {frm_clientes},
  Udm in 'DM\Udm.pas' {dm: TDataModule},
  Uutil in 'Utilidades\Uutil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_clientes, frm_clientes);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
