unit uClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmClientes = class(TForm)
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;



implementation

{$R *.dfm}

uses uDm;

procedure TfrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.qryclientes.close;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  if not dm.qryclientes.active then
    dm.qryclientes.open;
end;

end.
