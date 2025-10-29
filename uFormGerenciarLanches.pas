unit uFormGerenciarLanches;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.Mask;

type
  TfrmGerenciarLanches = class(TForm)
    gbLancheDetalhes: TGroupBox;
    gbIngredientesLanche: TGroupBox;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DBGrid1 : Tdbgrid;
    dblanchecomposicao: TDBGrid;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }


  public
    { Public declarations }



  end;

var
  frmGerenciarLanches: TfrmGerenciarLanches;

implementation

{$R *.dfm}

uses udm; // Para acessar o Data Module

{ TfrmGerenciarLanches }

procedure TfrmGerenciarLanches.FormShow(Sender: TObject);
begin


if not DM.qryLanches.Active then
    DM.qryLanches.Open;

  if not DM.qryIngredientes.Active then
    DM.qryIngredientes.Open;



  if not DM.qryLanches_composicao.active then
   dm.qrylanches_composicao.open;


end;





procedure TfrmGerenciarLanches.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DM.qryLanches.Active then
    DM.qryLanches.Close;


  if DM.qryIngredientes.Active then
    DM.qryIngredientes.Close;

    dm.qrylanches_composicao.close;

end;









end.
