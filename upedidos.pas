unit upedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids,FireDAC.Comp.Client, system.DateUtils, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TfrmPedidos = class(TForm)
    dbnavpedidos: TDBNavigator;
    dbgpedidos: TDBGrid;
    GroupBox1: TGroupBox;
    dbnavitens: TDBNavigator;
    dbgitenspedido: TDBGrid;
    dbvalorbruto: TDBText;
    dbvalordesconto: TDBText;
    dbvalortotal: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function ObterValorBrutoDoPedido: Double;
    function BuscarDataCadastro(AIDCliente: Integer): TDate;
    function VerificarItemNoPedido(ANomeLanche: string): Boolean;
    procedure AdicionarRefrigeranteGratisAoPedido;
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.dfm}

uses udm;

function TfrmPedidos.BuscarDataCadastro(AIDCliente: Integer): TDate;
var
  qryTemp: TFDQuery; // Query temporária para buscar dados
begin
  Result := 0; // Valor padrão para caso não encontre ou erro
  qryTemp := TFDQuery.Create(nil); // Cria a query temporária
  try
    qryTemp.Connection := DM.FDConn; // Usa a conexão do Data Module
    qryTemp.SQL.Text := 'SELECT DataCadastro FROM Clientes WHERE ID_Cliente = :pIDCliente';
    qryTemp.ParamByName('pIDCliente').AsInteger := AIDCliente;
    qryTemp.Open;
    if not qryTemp.IsEmpty then
    begin
      // Assumindo que DataCadastro está armazenado como TEXT na forma 'YYYY-MM-DD'
      Result := StrToDate(qryTemp.FieldByName('DataCadastro').AsString);
    end;
  finally
    qryTemp.Free; // Libera a query temporária
  end;
end;

procedure TfrmPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin

dm.qrylancheslookup.close;
dm.qryPedidos.close;
dm.qryPedidoItens.close;
end;

procedure TfrmPedidos.FormShow(Sender: TObject);
begin
  if not dm.qryclientes.active then
    dm.qryclientes.open;

    if not dm.qryPedidos.active then
    dm.qryPedidos.open;

    if not dm.qryPedidoItens.active then
    dm.qryPedidoItens.open;

    if not dm.qrylancheslookup.active then
      dm.qrylancheslookup.open;
end;

function Tfrmpedidos.ObterValorBrutoDoPedido: Double;
var
  TotalBruto: Double;
begin
  TotalBruto := 0.0;

  if DM.qryPedidoItens.Active then
  begin
    DM.qryPedidoItens.First;
    while not DM.qryPedidoItens.Eof do /
    begin

      TotalBruto := TotalBruto +
                    (DM.qryPedidoItens.FieldByName('ValorUnitario').AsFloat *
                     DM.qryPedidoItens.FieldByName('Quantidade').AsInteger);
      DM.qryPedidoItens.Next;
    end;
  end;
  Result := TotalBruto;
end;

function TfrmPedidos.VerificarItemNoPedido(ANomeLanche: string): Boolean;
var
  qryTemp: TFDQuery;
begin
  Result := False;
  qryTemp := TFDQuery.Create(nil);
  try
    qryTemp.Connection := DM.FDConn;

    qryTemp.SQL.Text := 'SELECT ID_Lanche FROM Lanches WHERE Nome = :pNomeLanche';
    qryTemp.ParamByName('pNomeLanche').AsString := ANomeLanche;
    qryTemp.Open;

    if not qryTemp.IsEmpty then
    begin

      qryTemp.Close;
      qryTemp.SQL.Text := 'SELECT COUNT(*) FROM Pedido_Itens WHERE ID_Pedido_FK = :pIDPedido AND ID_Lanche_FK = :pIDLanche';
      /
      qryTemp.ParamByName('pIDPedido').AsInteger := DM.qryPedidos.FieldByName('ID_Pedido').AsInteger;
      qryTemp.ParamByName('pIDLanche').AsInteger := qryTemp.FieldByName('ID_Lanche').AsInteger;
      qryTemp.Open;
      Result := (qryTemp.Fields[0].AsInteger > 0);
    end;
  finally
    qryTemp.Free;
  end;

end;

procedure TfrmPedidos.AdicionarRefrigeranteGratisAoPedido;
var
  qryTemp: TFDQuery;
  IDLancheRefrigerante: Integer;
begin

  IDLancheRefrigerante := 0;
  qryTemp := TFDQuery.Create(nil);
  try
    qryTemp.Connection := DM.FDConn;
    qryTemp.SQL.Text := 'SELECT ID_Lanche FROM Lanches WHERE Nome = "REFRIGERANTE"';
    qryTemp.Open;
    if not qryTemp.IsEmpty then
      IDLancheRefrigerante := qryTemp.FieldByName('ID_Lanche').AsInteger
    else
    begin
      ShowMessage('Erro: O Lanche "Refrigerante" não está cadastrado. Não foi possível adicionar o item grátis.');
      Exit;
    end;
  finally
    qryTemp.Free;
  end;

  if DM.qryPedidoItens.Active then
  begin
    DM.qryPedidoItens.Append;
    DM.qryPedidoItens.FieldByName('ID_Pedido_FK').AsInteger := DM.qryPedidos.FieldByName('ID_Pedido').AsInteger;
    DM.qryPedidoItens.FieldByName('ID_Lanche_FK').AsInteger := IDLancheRefrigerante;
    DM.qryPedidoItens.FieldByName('Quantidade').AsInteger := 1;
    DM.qryPedidoItens.FieldByName('ValorUnitario').AsFloat := 0.00;
    DM.qryPedidoItens.Post;
    ShowMessage('Refrigerante Grátis adicionado ao pedido!');
  end
  else
  begin
    ShowMessage('Erro: A lista de itens do pedido não está ativa. Não foi possível adicionar o refrigerante.');
  end;

end;





end.
