program lanchonete;

uses
  Vcl.Forms,
  uprincipal in 'uprincipal.pas' {frmPrincipal},
  Udm in 'Udm.pas' {DM: TDataModule},
  uFormLogin in 'uFormLogin.pas' {frmLogin},
  uFormCadIngredientes in 'uFormCadIngredientes.pas' {formCadIngredientes},
  uFormCardapio in 'uFormCardapio.pas' {frmCardapio},
  upedidos in 'upedidos.pas' {frmPedidos},
  uFormCadUsuarios in 'uFormCadUsuarios.pas' {frmcadusuarios},
  uFormGerenciarLanches in 'uFormGerenciarLanches.pas' {frmgerenciarLanches},
  uClientes in 'uClientes.pas' {frmClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
