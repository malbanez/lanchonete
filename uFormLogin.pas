unit uFormLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,udm;

type
  TfrmLogin = class(TForm)
    edtLogin: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtSenha: TMaskEdit;
    btnLogin: TButton;
    qryLogin: TFDQuery;
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  UsuarioDigitado: string;
  SenhaDigitada: string;
begin
  UsuarioDigitado := edtLogin.Text;
  SenhaDigitada := edtSenha.Text;


  DM.qryUsuarios.Close;
  DM.qryUsuarios.SQL.Text := 'SELECT  ID_Usuario,Login, Senha, NivelAcesso FROM Usuarios WHERE Login = :pLogin';
  DM.qryUsuarios.ParamByName('pLogin').AsString := UsuarioDigitado;
  DM.qryUsuarios.Open;

  if not DM.qryUsuarios.IsEmpty then
  begin

    if DM.HashSenha(SenhaDigitada) = dm.qryUsuarios.FieldByName('Senha').AsString then
    begin

      DM.UsuarioLogado := DM.qryUsuarios.FieldByName('Login').AsString;
      DM.NivelAcessoLogado := DM.qryUsuarios.FieldByName('NivelAcesso').AsInteger;

      ModalResult := mrOk;
    end
    else
    begin
      ShowMessage('Senha incorreta.');
    end;
  end
  else
  begin
    ShowMessage('Usuário não encontrado.');
  end;

  DM.qryUsuarios.Close;
end;

end.
