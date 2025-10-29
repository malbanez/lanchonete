unit uFormCadUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,udm;

type
  Tfrmcadusuarios = class(TForm)
    dbgUsuarios: TDBGrid;
    dbnUsuarios: TDBNavigator;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dbeLogin: TDBEdit;
    Label2: TLabel;
    dbeSenha: TDBEdit;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    dblcbNivelAcesso: TDBLookupComboBox;
    Label4: TLabel;
    edtconfsenha: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure DMqryUsuariosAfterPost(DataSet: TDataSet);
    procedure DMqryUsuariosAfterCancel(DataSet: TDataSet);
    procedure edtconfsenhaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeSenhaChange(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmcadusuarios: Tfrmcadusuarios;

implementation

{$R *.dfm}






procedure Tfrmcadusuarios.dbeSenhaChange(Sender: TObject);
begin
  edtconfsenha.Text:= dm.qryUsuarios.FieldByName('senha').AsString;
end;

procedure Tfrmcadusuarios.DMqryUsuariosAfterCancel(DataSet: TDataSet);
begin
dbeSenha.Text := '';
  edtconfsenha.Text := '';
  DM.ConfirmacaoSenha := ''
end;

procedure Tfrmcadusuarios.DMqryUsuariosAfterPost(DataSet: TDataSet);
begin
  dbeSenha.Text := '';
  edtconfsenha.Text := '';
  DM.ConfirmacaoSenha := '';
end;

procedure Tfrmcadusuarios.edtconfsenhaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
DM.ConfirmacaoSenha := edtconfsenha.Text;
end;

procedure Tfrmcadusuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.qryNivelacesso.CLOSE;
  DM.qryUsuarios.Close;
  // Limpar a propriedade de confirmação ao fechar
  DM.ConfirmacaoSenha := '';
end;

procedure Tfrmcadusuarios.FormShow(Sender: TObject);
begin
  DM.qryUsuarios.Open;
  DM.qryNivelacesso.Open;
end;



end.
