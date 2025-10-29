unit Udm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,System.DateUtils;

type

  TOnLancheValorCalculado = procedure(Sender: TObject; AValorTotal: Currency) of object;

  TDM = class(TDataModule)
    FDConn: TFDConnection;
    SQLiteLink: TFDPhysSQLiteDriverLink;
    qryIngredientes: TFDQuery;
    dsIngredientes: TDataSource;
    qryLanches: TFDQuery;
    dsLanches: TDataSource;
    qryPedidos: TFDQuery;
    dsPedidos: TDataSource;
    qryclientes: TFDQuery;
    dsClientes: TDataSource;
    qryUsuarios: TFDQuery;
    dsUsuarios: TDataSource;
    qryPedidoItens: TFDQuery;
    dsPedidoitens: TDataSource;
    qry_pedidos_itens_modificacoes: TFDQuery;
    dsPedidos_itens_modificacoes: TDataSource;
    dsLcanches_composicao: TDataSource;
    qryNivelacesso: TFDQuery;
    dsnivelacesso: TDataSource;
    qryUsuariosID_Usuario: TFDAutoIncField;
    qryUsuariosLogin: TWideStringField;
    qryUsuariosSenha: TWideStringField;
    qryUsuariosNivelAcesso: TIntegerField;
    dsCardapio: TDataSource;
    qryIngredientesID_Ingrediente: TFDAutoIncField;
    qryIngredientesNome: TWideStringField;
    qryIngredientesValor: TFloatField;
    qrycardapio: TFDQuery;
    qryprecolanche: TFDQuery;
    qryprecolancheID_Lanche: TFDAutoIncField;
    qryprecolancheNomeLanche: TWideStringField;
    qryprecolancheValorTotalCalculado: TFloatField;
    qrylanches_composicao: TFDQuery;
    qrylanches_composicaoID_Composicao: TFDAutoIncField;
    qrylanches_composicaoID_Lanche_FK: TIntegerField;
    qrylanches_composicaoID_Ingrediente_FK: TIntegerField;
    qrylanches_composicaoQuantidade: TFloatField;
    qrylanches_composicaoCOMPOSICAO_INGRED_NOME: TStringField;
    qrycardapioNome: TWideStringField;
    qrycardapioIngredientes: TWideStringField;
    qrycardapioValorTotal: TFloatField;
    qryclientesID_Cliente: TFDAutoIncField;
    qryclientesNome: TWideStringField;
    qryclientesDataCadastro: TWideStringField;
    qryPedidosID_Pedido: TFDAutoIncField;
    qryPedidosID_Cliente_FK: TIntegerField;
    qryPedidosValorBruto: TFloatField;
    qryPedidosValorDesconto: TFloatField;
    qryPedidosValorTotal: TFloatField;
    qryPedidoItensID_Pedido_Item: TFDAutoIncField;
    qryPedidoItensID_Pedido_FK: TIntegerField;
    qryPedidoItensID_Lanche_FK: TIntegerField;
    qryPedidoItensQuantidade: TIntegerField;
    qryPedidoItensValorUnitario: TFloatField;
    qryPedidosclientelookup: TStringField;
    qryPedidoItensitemlookup: TStringField;
    qryLanchesID_Lanche: TFDAutoIncField;
    qryLanchesNome: TWideStringField;
    qryLanchesDESCRICAO: TWideStringField;
    qryLanchesPRECO: TFloatField;
    qrylanches_composicaoVALOR: TFloatField;
    qryPedidosDataHora: TWideStringField;
    qrylancheslookup: TFDQuery;
    qrylancheslookupID_Lanche: TFDAutoIncField;
    qrylancheslookupNome: TWideStringField;
    qrylancheslookupPRECO: TFloatField;
    qryPedidosdatacliente: TStringField;
    procedure qryUsuariosBeforePost(DataSet: TDataSet);
    procedure qryUsuariosNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qryLanchesAfterScroll(DataSet: TDataSet);
    procedure qryLanchesNewRecord(DataSet: TDataSet);
    procedure qryLanches_composicaoAfterPost(DataSet: TDataSet);
    procedure qryLanches_composicaoAfterDelete(DataSet: TDataSet);
    procedure qryLanches_composicaoBeforePost(DataSet: TDataSet);
    procedure qryLanchesAfterOpen(DataSet: TDataSet);
    procedure qryLanches_composicaoAfterEdit(DataSet: TDataSet);
    procedure qryLanches_composicaoQuantidadeChange(Sender: TField);
    procedure qryPedidoItensAfterPost(DataSet: TDataSet);
    procedure qryPedidoItensAfterDelete(DataSet: TDataSet);

    procedure qryPedidosNewRecord(DataSet: TDataSet);
    procedure qryPedidoItensQuantidadeValidate(Sender: TField);
    procedure qryPedidoItensQuantidadeChange(Sender: TField);



  private

    FConfirmacaoSenha: string;
    FUsuarioLogado: string;


    procedure CalcularValorTotalLanche;

    procedure ValorTotalLancheSQL(ALancheID: Integer);

  public

    NivelAcessoLogado : Integer;
    property ConfirmacaoSenha: string read FConfirmacaoSenha write FConfirmacaoSenha;
    property UsuarioLogado: string read FUsuarioLogado write FUsuarioLogado;


    function HashSenha(const AText: string): string;
    function GetValorBrutoPedido(APedidoID: Integer): Currency;
    procedure AtualizarTotaisPedidoMestre(APedidoID: Integer);
    function VerificarBrindeRefrigerante(APedidoID: Integer): Boolean;

  end;

var
  DM: TDM;
  valortotallanche : double;


implementation



{$R *.dfm}

uses
uformcadusuarios,Vcl.Dialogs,uformgerenciarlanches;

{ TDM }

procedure TDM.DataModuleCreate(Sender: TObject);
begin
 fdconn.Connected := true;
end;

function TDM.GetValorBrutoPedido(APedidoID: Integer): Currency;
begin
  result := 0.00; // Valor padrão em caso de ID inválido ou sem itens

  if APedidoID = 0 then // Para pedidos novos, o valor bruto inicial é 0
    Exit;

  with TFDQuery.Create(nil) do // Cria uma query temporária para o cálculo
  try
    Connection := FDConn;
    SQL.Text :=
      'SELECT COALESCE(SUM(PI.Quantidade * PI.ValorUnitario), 0.0) AS ValorTotal ' +
      'FROM Pedido_Itens PI ' +
      'WHERE PI.ID_Pedido_FK = ' + inttostr(APedidoID);


    Open;

    if not IsEmpty then
      Result := FieldByName('ValorTotal').AsCurrency;
  finally
    Free; // Libera a query temporária
  end;
end;

procedure TDM.ValorTotalLancheSQL(ALancheID: Integer);
begin


  // Garante que a query de preço está fechada antes de configurar

  if qryLanches.RecordCount > 0 then
  begin

  if qryPrecoLanche.Active then
    qryPrecoLanche.Close;

  // Define o SQL diretamente no código
 qryPrecoLanche.SQL.Text :=
    'SELECT ' +
    '    L.ID_Lanche, ' +
    '    L.Nome AS NomeLanche, ' +
    '    ( ' +
    '        COALESCE(SUM(IFNULL(I.Valor, 0.0) * IFNULL(LC.Quantidade, 0.0)), 0.0) ' +
    '    ) AS ValorTotalCalculado ' +
    'FROM ' +
    '    Lanches L ' +
    'LEFT JOIN ' +
    '    Lanche_Composicao LC ON L.ID_Lanche = LC.ID_Lanche_FK ' +
    'LEFT JOIN ' +
    '    Ingredientes I ON LC.ID_Ingrediente_FK = I.ID_Ingrediente ' +
    'WHERE ' +
    '    L.ID_Lanche = ' + IntToStr(ALancheID) + ' ' +
    'GROUP BY ' +
    '    L.ID_Lanche, L.Nome;';



    qryPrecoLanche.Open;
  end;

  if not (qryLanches.State in [dsEdit, dsInsert]) then
   begin
    qrylanches.edit;
    qryLanchesPRECO.ascurrency:= qryprecolancheValorTotalCalculado.ascurrency;
    qrylanches.Post;
   end;





end;

function TDM.VerificarBrindeRefrigerante(APedidoID: Integer): Boolean;
var
  TemXSalada: Boolean;
  TemBatataFrita: Boolean;
begin
  Result := False; // Padrão: não ganhou

  // colocando como constantes pelo prazo, mas o ideal é montar uma tela de regras de descontos.
  const ID_XSALADA = 5;
  const ID_BATATA_FRITA = 6;

  TemXSalada := False;
  TemBatataFrita := False;

  // Usa uma query temporária para verificar os itens
  with TFDQuery.Create(nil) do
  try
    Connection := FDConn;
    SQL.Text :=
      'SELECT PI.ID_Lanche_FK FROM Pedido_Itens PI WHERE PI.ID_Pedido_FK = ' + inttostr(APedidoID);

    Open;

    while not Eof do
    begin
      if FieldByName('ID_Lanche_FK').AsInteger = ID_XSALADA then
        TemXSalada := True;
      if FieldByName('ID_Lanche_FK').AsInteger = ID_BATATA_FRITA then
        TemBatataFrita := True;

      // Se ambos foram encontrados, não precisa continuar
      if TemXSalada and TemBatataFrita then
      begin
        Result := True;
        Break;
      end;
      Next;
    end;
  finally
    Free;
  end;

end;

function TDM.HashSenha(const AText: string): string;
begin
Result := 'HASH_' + AText;
end;





procedure TDM.qryLanchesAfterOpen(DataSet: TDataSet);
begin
  qryIngredientes.Open;
end;

procedure TDM.qryLanchesAfterScroll(DataSet: TDataSet);
var
valor : string;
begin
  if qrylanches_composicao.Active=false then
    qrylanches_composicao.open;

  //qryLanches_composicao.ParamByName('PID_LANCHE').AsInteger := qryLanchesID_Lanche.Value;


  qryLanches_composicao.Refresh;
  if qryLanchesID_Lanche.Value > 0 then
   ValorTotalLancheSQL(qryLanchesID_Lanche.Value);
end;



procedure TDM.qryLanchesNewRecord(DataSet: TDataSet);
begin
  qrylanches.FieldByName('Nome').AsString := '';
  qrylanches.FieldByName('Descricao').AsString := '';
  qrylanches.FieldByName('Preco').AsCurrency := 0.00; // Preço base do lanche


end;

procedure TDM.qryLanches_composicaoAfterDelete(DataSet: TDataSet);
begin
ValorTotalLancheSQL(qryLanchesID_Lanche.Value);
end;

procedure TDM.qryLanches_composicaoAfterEdit(DataSet: TDataSet);
begin
qryIngredientes.Locate('ID_Ingrediente', qryLanches_composicao.FieldByName('ID_Ingrediente_FK').AsInteger, []);
  qryLanches_composicaoVALOR.Value := qryLanches_composicaoQuantidade.Value *  qryIngredientes.FieldByName('Valor').AsCurrency;
end;

procedure TDM.qryLanches_composicaoAfterPost(DataSet: TDataSet);
begin

 qryLanches_composicao.Refresh;
 ValorTotalLancheSQL(qryLanchesID_Lanche.Value);
end;

procedure TDM.qryLanches_composicaoBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('ID_Lanche_FK').IsNull then
  begin
    DataSet.FieldByName('ID_Lanche_FK').AsInteger := DM.qryLanches.FieldByName('ID_Lanche').AsInteger;
  end;

  // Validação: Garante que um ingrediente foi selecionado
  if DataSet.FieldByName('ID_Ingrediente_FK').IsNull then
  begin
    ShowMessage('Por favor, selecione um ingrediente.');
    Abort;
  end;

  // Validação: Garante que a quantidade é válida (se a coluna Quantidade existir)
  if not DataSet.FieldByName('Quantidade').IsNull and (DataSet.FieldByName('Quantidade').AsFloat <= 0) then
  begin
    ShowMessage('A quantidade do ingrediente deve ser maior que zero.');
    Abort;
  end;

  qryIngredientes.Locate('ID_Ingrediente', qryLanches_composicao.FieldByName('ID_Ingrediente_FK').AsInteger, []);
  qryLanches_composicaoVALOR.Value := qryLanches_composicaoQuantidade.Value *  qryIngredientes.FieldByName('Valor').AsCurrency;
end;

procedure TDM.qryLanches_composicaoQuantidadeChange(Sender: TField);
begin
 qryIngredientes.Locate('ID_Ingrediente', qryLanches_composicao.FieldByName('ID_Ingrediente_FK').AsInteger, []);
  qryLanches_composicaoVALOR.Value := qryLanches_composicaoQuantidade.Value *  qryIngredientes.FieldByName('Valor').AsCurrency;
end;

procedure TDM.qryPedidoItensAfterDelete(DataSet: TDataSet);
var
  CurrentPedidoID: Integer;
begin
  inherited;



  // Chama a atualização dos totais do pedido MESTRE
  if (qryPedidos.Active) and (not qryPedidos.IsEmpty) then
  begin
    CurrentPedidoID := qryPedidos.FieldByName('ID_Pedido').AsInteger;
    AtualizarTotaisPedidoMestre(CurrentPedidoID);
  end;


end;

procedure TDM.qryPedidoItensAfterPost(DataSet: TDataSet);
var
  CurrentPedidoID: Integer;
begin
  inherited;


  // Chama a atualização dos totais do pedido MESTRE
  if (qryPedidos.Active) and (not qryPedidos.IsEmpty) then
  begin
    CurrentPedidoID := qryPedidos.FieldByName('ID_Pedido').AsInteger;
    AtualizarTotaisPedidoMestre(CurrentPedidoID);
  end;


end;

procedure TDM.qryPedidoItensQuantidadeChange(Sender: TField);
var
  LancheID: Integer;
  LanchePreco: Currency;
  CurrentPedidoID: Integer;
  OldLanchesLookupBookmark: TBookmark;
begin
  inherited;

  LancheID := qryLanchesID_Lanche.Value;

  // Salva a posição atual da qryLanchesLookup para restaurar depois
  OldLanchesLookupBookmark := DM.qryLanchesLookup.GetBookmark;
  try
    // Busca o preço do lanche na DM.qryLanchesLookup
    if DM.qryLanchesLookup.Locate('ID_Lanche', LancheID, []) then
    begin
      LanchePreco := DM.qryLanchesLookup.FieldByName('Preco').AsCurrency;

      // Atribui o PREÇO UNITÁRIO do lanche ao campo ValorUnitario do item do pedido
      qryPedidoItensValorUnitario.AsCurrency := LanchePreco;
    end
    else
    begin
      // Se o lanche não foi encontrado, zera o ValorUnitario
      qryPedidoItens.FieldByName('ValorUnitario').AsCurrency := 0.00;
    end;
  finally

    DM.qryLanchesLookup.GotoBookmark(OldLanchesLookupBookmark);
    DM.qryLanchesLookup.FreeBookmark(OldLanchesLookupBookmark);
  end;


end;

procedure TDM.qryPedidoItensQuantidadeValidate(Sender: TField);
begin

//
end;

procedure TDM.qryPedidosNewRecord(DataSet: TDataSet);
begin
inherited; // Chama a implementação padrão se houver

  // Preenche a DataHora com a data e hora atuais, formatada como string
  DataSet.FieldByName('DataHora').AsString := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);

  // Inicializa outros campos para novos pedidos, se necessário
  DataSet.FieldByName('ValorBruto').AsCurrency := 0.00;
  DataSet.FieldByName('ValorDesconto').AsCurrency := 0.00;
  DataSet.FieldByName('ValorTotal').AsCurrency := 0.00;
  if DataSet.FindField('Status') <> nil then // Se você tiver um campo Status
    DataSet.FieldByName('Status').AsString := 'Aberto'; // Ex: Status inicial
  if DataSet.FindField('RefrigeranteGratis') <> nil then
    DataSet.FieldByName('RefrigeranteGratis').AsBoolean := False;


end;



procedure TDM.qryUsuariosBeforePost(DataSet: TDataSet);
var
Senhadigitada : string;
SenhaConfirmada : string;
begin
  if (DataSet.State = dsInsert) or (DataSet.State = dsEdit) then
 begin
  SenhaDigitada := DataSet.FieldByName('Senha').AsString;
  SenhaConfirmada := ConfirmacaoSenha;

  // --- VALIDAÇÃO DAS SENHAS ---
  if SenhaDigitada = '' then
  begin
   ShowMessage('A senha não pode ser vazia.');
   Abort;
  end;

  if SenhaDigitada <> SenhaConfirmada then
  begin
    ShowMessage('A senha e a confirmação de senha não coincidem.');
    Abort;
   end;
   // --- FIM DA VALIDAÇÃO ---

   // --- Lógica de HASH da Senha ---
  if (DataSet.State = dsInsert) or
   ((DataSet.State = dsEdit) and (SenhaDigitada <> DataSet.FieldByName('Senha').OldValue)) then
   begin
     DataSet.FieldByName('Senha').AsString := HashSenha(SenhaDigitada);
   end;



    ConfirmacaoSenha := '';
  end;

end;

procedure TDM.qryUsuariosNewRecord(DataSet: TDataSet);
begin
  ConfirmacaoSenha := '';
  DataSet.FieldByName('Senha').AsString := '';
  DataSet.FieldByName('NivelAcesso').AsInteger := 2;
end;


procedure TDM.AtualizarTotaisPedidoMestre(APedidoID: Integer);

var
  ValorBrutoCalculado: Currency;
  DescontoDoPedido: Currency;
  ValorTotalFinal: Currency;
  DataCadastroCliente: TDateTime;
  MesesCadastro: Integer;
  AplicaDescontoPorValor: Boolean;
  AplicaDescontoPorCliente: Boolean;
  GanhouRefrigerante,ItemEncontrado: Boolean;
  OldState: TDataSetState;
  IDRefrigerante: Integer;

begin

 //FIXO POR ENQUANTO
  IDRefrigerante:= 7;


  if APedidoID = 0 then
     Exit;

   // Guarda o estado atual para restaurar
   OldState := qryPedidos.State;
   // Localiza o pedido (se não estiver já nele)
   if not qryPedidos.Locate('ID_Pedido', APedidoID, []) then
     Exit;

   // Verifica se estamos em modo de inserção, se sim, pode não ter todos os dados ainda

  if OldState = dsInsert then
     Exit;


  // 1. Calcula o Valor Bruto

  ValorBrutoCalculado := GetValorBrutoPedido(APedidoID);
   DescontoDoPedido := 0.00; // Reinicia o desconto para recalcular

   // --- REGRAS DE DESCONTO ---

  // Regra 1: 3% de desconto se o valor total do pedido for acima de R$50,00

  AplicaDescontoPorValor := (ValorBrutoCalculado > 50.00);
   if AplicaDescontoPorValor then
     DescontoDoPedido := DescontoDoPedido + (ValorBrutoCalculado * 0.03); // Acumula 3%



  // Regra 2: Mais 5% se o cliente for cadastrado há mais de 6 meses
   AplicaDescontoPorCliente := False;

   if not qryPedidos.FieldByName('ID_Cliente_FK').IsNull then // Só verifica se tem cliente
   begin
     DataCadastroCliente := qryPedidos.FieldByName('datacliente').AsDateTime;

     MesesCadastro := Trunc(MonthsBetween(DataCadastroCliente, Date));
     if MesesCadastro > 6 then
       AplicaDescontoPorCliente := True;
     end;



  if AplicaDescontoPorCliente then
    DescontoDoPedido := DescontoDoPedido + (ValorBrutoCalculado * 0.05); // Acumula mais 5%



  // --- REGRA DO BRINDE (REFRIGERANTE GRÁTIS) ---
  GanhouRefrigerante := VerificarBrindeRefrigerante(APedidoID);

  ItemEncontrado := False;
    // Tenta encontrar um item "refrigerante" grátis já existente no pedido
    if not qryPedidoItens.IsEmpty then
    begin
      qryPedidoItens.First;
      while not qryPedidoItens.Eof do
      begin
        // Um refrigerante grátis é reconhecido pelo ID e ValorUnitario = 0
        if (qryPedidoItens.FieldByName('ID_Lanche_FK').AsInteger = IDRefrigerante) and
           (qryPedidoItens.FieldByName('ValorUnitario').AsCurrency = 0.00) then
        begin
          ItemEncontrado := True;
          Break;
        end;
        qryPedidoItens.Next;
      end;
    end;

    if GanhouRefrigerante and not ItemEncontrado then
    begin
      // Se ganhou e o item não está lá, adiciona
      qryPedidoItens.Append;
      try
        qryPedidoItens.FieldByName('ID_Pedido_FK').AsInteger := APedidoID;
        qryPedidoItens.FieldByName('ID_Lanche_FK').AsInteger := IDRefrigerante;
        qryPedidoItens.FieldByName('Quantidade').AsFloat := 1.0;
        qryPedidoItens.FieldByName('ValorUnitario').AsCurrency := 0.00; // Grátis!
        qryPedidoItens.Post;
      except
        qryPedidoItens.Cancel;
        raise;
      end;
    end
    else if not GanhouRefrigerante and ItemEncontrado then
    begin
      // Se não ganhou mais e o item está lá, remove
      qryPedidoItens.Delete;

    end;


  // 3. Calcula o Valor Total Final

  ValorTotalFinal := ValorBrutoCalculado - DescontoDoPedido;
  // 4. Salva os novos valores nos campos físicos do pedido
  qryPedidos.Edit;

  try

    qryPedidos.FieldByName('ValorBruto').AsCurrency := ValorBrutoCalculado;
    qryPedidos.FieldByName('ValorDesconto').AsCurrency := DescontoDoPedido; // Atribui o desconto calculado
    qryPedidos.FieldByName('ValorTotal').AsCurrency := ValorTotalFinal;
    // Atualiza o campo de brinde
    if qryPedidos.FindField('RefrigeranteGratis') <> nil then
      qryPedidos.FieldByName('RefrigeranteGratis').AsBoolean := GanhouRefrigerante;

    qryPedidos.Post;

  except
    qryPedidos.Cancel;
    raise;

  end;



  // Restaura o estado original se foi Browse (Locate já faz isso, mas para clareza)
  if OldState = dsBrowse then
    qryPedidos.First;

end;

procedure TDM.CalcularValorTotalLanche;
var
 ValorBase: Currency;
 ValorIngredientes: Currency;
 OldActive: Boolean;
 LancheID: Integer;
begin
  // Verifique se há um lanche selecionado para calcular
  if qryLanches.IsEmpty then
  begin

    Exit;
  end;

  // Guarda o ID do lanche atual para garantir que o detalhe esteja correto
  LancheID := qryLanches.FieldByName('ID_Lanche').AsInteger;


 ValorIngredientes := 0.00;


  if qryLanches_composicao.Active then
  begin

    qryLanches_composicao.Refresh;
  end else begin

    qryLanches_composicao.Open;
  end;


 try
  qryLanches_composicao.DisableControls;
  qryLanches_composicao.First;
  while not qryLanches_composicao.EOF do
  begin
   qryIngredientes.Locate('ID_Ingrediente', qryLanches_composicao.FieldByName('ID_Ingrediente_FK').AsInteger, []);
   if not qryIngredientes.IsEmpty then
   begin
    ValorIngredientes := ValorIngredientes +
              (qryIngredientes.FieldByName('Valor').AsCurrency *
               qryLanches_composicao.FieldByName('Quantidade').AsFloat);
   end;
   qryLanches_composicao.Next;
  end;
 finally
  qryLanches_composicao.EnableControls;

 end;

 valortotallanche := ValorIngredientes;


end;

end.
