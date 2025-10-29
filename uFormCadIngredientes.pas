unit uFormCadIngredientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,uDM;

type
  TformCadIngredientes = class(TForm)
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadIngredientes: TformCadIngredientes;

implementation

{$R *.dfm}

procedure TformCadIngredientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DM.qryIngredientes.close;
end;

procedure TformCadIngredientes.FormShow(Sender: TObject);
begin
DM.qryIngredientes.Open;
end;

end.
