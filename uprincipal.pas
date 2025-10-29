unit uprincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Administrao1: TMenuItem;
    CadastroUsurios1: TMenuItem;
    Produtos1: TMenuItem;
    Pedidos1: TMenuItem;
    Login1: TMenuItem;
    lblUsuarioLogado: TLabel;
    lblnivel: TLabel;
    Ingredientes1: TMenuItem;
    Lanches1: TMenuItem;
    Clientes1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure CadastroUsurios1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure Login1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Ingredientes1Click(Sender: TObject);
    procedure Lanches1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
udm, uformlogin, uformcadusuarios,uformcardapio,upedidos,uformcadingredientes,uformgerenciarlanches, uclientes;

procedure TfrmPrincipal.CadastroUsurios1Click(Sender: TObject);
begin

  if DM.NivelAcessoLogado = 1 then // 1 = Administrador
  begin
    with Tfrmcadusuarios.Create(Self) do
    try
      ShowModal; // Abre a tela de cadastro de usuários
    finally
      Free;
    end;
  end
  else
  begin
    ShowMessage('Você não tem permissão para acessar esta funcionalidade.');
  end;
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
      frmClientes:= TfrmClientes.Create(self);

  try

      frmClientes.ShowModal;

  finally
    frmClientes.free;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin

   with TFrmLogin.Create(Self) do
   try
     if ShowModal = mrOk then
     begin

       if Assigned(DM) then
       begin

          if Assigned(DM) and (DM.UsuarioLogado <> '') then
          begin
            lblUsuarioLogado.Caption := 'Usuário: ' + DM.UsuarioLogado;
            lblnivel.Caption := 'Nível:' + inttostr(dm.NivelAcessoLogado);

          end
          else
          begin
            lblUsuarioLogado.Caption := 'Usuário: N/A';
          end;


       end;
     end
     else
     begin

       Application.Terminate;
     end;
   finally
     Free;
   end;


end;

procedure TfrmPrincipal.Ingredientes1Click(Sender: TObject);
begin
   formCadIngredientes := TformCadIngredientes.Create(self);

  try

      formCadIngredientes.ShowModal;

  finally
    formCadIngredientes.free;
  end;
end;

procedure TfrmPrincipal.Lanches1Click(Sender: TObject);
begin
  with TfrmGerenciarLanches.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmPrincipal.Login1Click(Sender: TObject);
begin
  with TfrmLogin.Create(Self) do
  try
    if ShowModal = mrOk then
    begin

      ShowMessage('Login realizado com sucesso! Bem-vindo.');

    end
    else
    begin

      ShowMessage('Login cancelado ou falhou. O sistema será encerrado.');
      Application.Terminate;
    end;
  finally
    frmlogin.Free;
  end;
end;

procedure TfrmPrincipal.Pedidos1Click(Sender: TObject);
begin
 with TfrmPedidos.Create(self) do
  try
     begin
       ShowModal;
     end;
  finally
    free;
  end;
end;


procedure TfrmPrincipal.Produtos1Click(Sender: TObject);
begin

  frmCardapio:= TfrmCardapio.Create(self);

  try

      frmCardapio.ShowModal;

  finally
    frmcardapio.free;
  end;
end;

end.
