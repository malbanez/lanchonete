object DM: TDM
  OnCreate = DataModuleCreate
  Height = 543
  Width = 640
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=E:\EMBARCADERO\PROJETOS\TESTE_FOXCON\dados.sqlite'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 80
    Top = 56
  end
  object SQLiteLink: TFDPhysSQLiteDriverLink
    Left = 152
    Top = 56
  end
  object qryIngredientes: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT ID_Ingrediente, Nome, Valor FROM Ingredientes')
    Left = 64
    Top = 160
    object qryIngredientesID_Ingrediente: TFDAutoIncField
      FieldName = 'ID_Ingrediente'
      Origin = 'ID_Ingrediente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object qryIngredientesNome: TWideStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 50
    end
    object qryIngredientesValor: TFloatField
      FieldName = 'Valor'
      Origin = 'Valor'
      Required = True
      currency = True
    end
  end
  object dsIngredientes: TDataSource
    DataSet = qryIngredientes
    Left = 152
    Top = 160
  end
  object qryLanches: TFDQuery
    AfterOpen = qryLanchesAfterOpen
    AfterScroll = qryLanchesAfterScroll
    OnNewRecord = qryLanchesNewRecord
    Connection = FDConn
    SQL.Strings = (
      
        'SELECT ID_Lanche, Nome, Descricao, Preco FROM Lanches ORDER BY N' +
        'ome')
    Left = 272
    Top = 152
    object qryLanchesID_Lanche: TFDAutoIncField
      FieldName = 'ID_Lanche'
      Origin = 'ID_Lanche'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object qryLanchesNome: TWideStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 50
    end
    object qryLanchesDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object qryLanchesPRECO: TFloatField
      FieldName = 'PRECO'
      Origin = 'PRECO'
    end
  end
  object dsLanches: TDataSource
    AutoEdit = False
    DataSet = qryLanches
    Left = 360
    Top = 152
  end
  object qryPedidos: TFDQuery
    OnNewRecord = qryPedidosNewRecord
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      '    P.ID_Pedido,'
      '    P.ID_Cliente_FK,'
      '    P.Datahora,'
      '    P.valorbruto,'
      '    P.ValorDesconto,'
      '    P.ValorTotal'
      'FROM'
      '    Pedidos P'
      'LEFT JOIN'
      '    Clientes C ON P.ID_Cliente_FK = C.ID_Cliente'
      'ORDER BY'
      '    P.datahora DESC, P.ID_Pedido DESC')
    Left = 56
    Top = 224
    object qryPedidosID_Pedido: TFDAutoIncField
      FieldName = 'ID_Pedido'
      Origin = 'ID_Pedido'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object qryPedidosID_Cliente_FK: TIntegerField
      FieldName = 'ID_Cliente_FK'
      Origin = 'ID_Cliente_FK'
    end
    object qryPedidosValorBruto: TFloatField
      FieldName = 'ValorBruto'
      Origin = 'ValorBruto'
    end
    object qryPedidosValorDesconto: TFloatField
      FieldName = 'ValorDesconto'
      Origin = 'ValorDesconto'
    end
    object qryPedidosValorTotal: TFloatField
      FieldName = 'ValorTotal'
      Origin = 'ValorTotal'
    end
    object qryPedidosclientelookup: TStringField
      FieldKind = fkLookup
      FieldName = 'clientelookup'
      LookupDataSet = qryclientes
      LookupKeyFields = 'ID_Cliente'
      LookupResultField = 'Nome'
      KeyFields = 'ID_Cliente_FK'
      Size = 50
      Lookup = True
    end
    object qryPedidosDataHora: TWideStringField
      FieldName = 'DataHora'
      Origin = 'DataHora'
      Required = True
    end
    object qryPedidosdatacliente: TStringField
      FieldKind = fkLookup
      FieldName = 'datacliente'
      LookupDataSet = qryclientes
      LookupKeyFields = 'ID_Cliente'
      LookupResultField = 'DataCadastro'
      KeyFields = 'ID_Cliente_FK'
      Lookup = True
    end
  end
  object dsPedidos: TDataSource
    DataSet = qryPedidos
    Left = 144
    Top = 224
  end
  object qryclientes: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from clientes')
    Left = 264
    Top = 336
    object qryclientesID_Cliente: TFDAutoIncField
      FieldName = 'ID_Cliente'
      Origin = 'ID_Cliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object qryclientesNome: TWideStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 50
    end
    object qryclientesDataCadastro: TWideStringField
      FieldName = 'DataCadastro'
      Origin = 'DataCadastro'
      Required = True
      EditMask = '!99/99/0000;1;_'
      Size = 10
    end
  end
  object dsClientes: TDataSource
    AutoEdit = False
    DataSet = qryclientes
    Left = 352
    Top = 336
  end
  object qryUsuarios: TFDQuery
    BeforePost = qryUsuariosBeforePost
    OnNewRecord = qryUsuariosNewRecord
    Connection = FDConn
    UpdateOptions.AssignedValues = [uvEInsert, uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'SELECT'
      '  ID_Usuario,'
      '  LOGIN,    '
      '  Senha,    '
      '  NivelAcesso'
      'FROM Usuarios')
    Left = 256
    Top = 400
    object qryUsuariosID_Usuario: TFDAutoIncField
      FieldName = 'ID_Usuario'
      Origin = 'ID_Usuario'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object qryUsuariosLogin: TWideStringField
      FieldName = 'Login'
      Origin = 'Login'
      Required = True
      Size = 50
    end
    object qryUsuariosSenha: TWideStringField
      FieldName = 'Senha'
      Origin = 'Senha'
      Required = True
      Size = 50
    end
    object qryUsuariosNivelAcesso: TIntegerField
      FieldName = 'NivelAcesso'
      Origin = 'NivelAcesso'
    end
  end
  object dsUsuarios: TDataSource
    DataSet = qryUsuarios
    Left = 344
    Top = 400
  end
  object qryPedidoItens: TFDQuery
    AfterPost = qryPedidoItensAfterPost
    AfterDelete = qryPedidoItensAfterDelete
    IndexFieldNames = 'ID_Pedido_FK'
    MasterSource = dsPedidos
    MasterFields = 'ID_Pedido'
    DetailFields = 'ID_Pedido_FK'
    Connection = FDConn
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'select * from pedido_itens')
    Left = 48
    Top = 288
    object qryPedidoItensID_Pedido_Item: TFDAutoIncField
      FieldName = 'ID_Pedido_Item'
      Origin = 'ID_Pedido_Item'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object qryPedidoItensID_Pedido_FK: TIntegerField
      FieldName = 'ID_Pedido_FK'
      Origin = 'ID_Pedido_FK'
    end
    object qryPedidoItensID_Lanche_FK: TIntegerField
      FieldName = 'ID_Lanche_FK'
      Origin = 'ID_Lanche_FK'
    end
    object qryPedidoItensQuantidade: TIntegerField
      FieldName = 'Quantidade'
      Origin = 'Quantidade'
      OnChange = qryPedidoItensQuantidadeChange
      OnValidate = qryPedidoItensQuantidadeValidate
    end
    object qryPedidoItensValorUnitario: TFloatField
      FieldName = 'ValorUnitario'
      Origin = 'ValorUnitario'
      currency = True
    end
    object qryPedidoItensitemlookup: TStringField
      FieldKind = fkLookup
      FieldName = 'itemlookup'
      LookupDataSet = qryLanches
      LookupKeyFields = 'ID_Lanche'
      LookupResultField = 'Nome'
      KeyFields = 'ID_Lanche_FK'
      Size = 50
      Lookup = True
    end
  end
  object dsPedidoitens: TDataSource
    DataSet = qryPedidoItens
    Left = 136
    Top = 288
  end
  object qry_pedidos_itens_modificacoes: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from pedidos_itens_modificacoes')
    Left = 48
    Top = 344
  end
  object dsPedidos_itens_modificacoes: TDataSource
    DataSet = qry_pedidos_itens_modificacoes
    Left = 136
    Top = 344
  end
  object dsLcanches_composicao: TDataSource
    AutoEdit = False
    DataSet = qrylanches_composicao
    Left = 472
    Top = 56
  end
  object qryNivelacesso: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT 1 AS ID_Nivel, '#39'Administrador'#39' AS NivelNome'
      'UNION ALL'
      'SELECT 2 AS ID_Nivel, '#39'Atendente'#39' AS NivelNome;')
    Left = 248
    Top = 472
  end
  object dsnivelacesso: TDataSource
    DataSet = qryNivelacesso
    Left = 336
    Top = 472
  end
  object qrycardapio: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT'
      '  L.Nome,'
      
        '  /* GROUP_CONCAT '#233' espec'#237'fico do SQLite para listar os ingredie' +
        'ntes */'
      '  GROUP_CONCAT(I.Nome, '#39', '#39') AS Ingredientes,'
      '  /* Soma o valor dos ingredientes */'
      '  SUM(IFNULL(LC.Valor,0.0) ) AS ValorTotal'
      'FROM Lanches L'
      'LEFT JOIN Lanche_Composicao LC ON L.ID_Lanche = LC.ID_Lanche_FK'
      
        'LEFT JOIN Ingredientes I ON LC.ID_Ingrediente_FK = I.ID_Ingredie' +
        'nte'
      'GROUP BY L.ID_Lanche, L.Nome')
    Left = 32
    Top = 424
    object qrycardapioNome: TWideStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 50
    end
    object qrycardapioIngredientes: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Ingredientes'
      Origin = 'Ingredientes'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object qrycardapioValorTotal: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'ValorTotal'
      Origin = 'ValorTotal'
      ProviderFlags = []
      ReadOnly = True
      currency = True
    end
  end
  object dsCardapio: TDataSource
    DataSet = qrycardapio
    Left = 96
    Top = 424
  end
  object qryprecolanche: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT '
      '        L.ID_Lanche, '
      '        L.Nome AS NomeLanche, '
      '        ( '
      '           '
      '            COALESCE(SUM(I.Valor * LC.Quantidade), 0.0)'
      '        ) AS ValorTotalCalculado '
      '    FROM'
      '        Lanches L '
      '    LEFT JOIN '
      '        Lanche_Composicao LC ON L.ID_Lanche = LC.ID_Lanche_FK '
      '    LEFT JOIN '
      
        '        Ingredientes I ON LC.ID_Ingrediente_FK = I.ID_Ingredient' +
        'e '
      '    WHERE '
      '        L.ID_LANCHE=1'
      '    GROUP BY'
      '        L.ID_Lanche, L.Nome, L.PRECO')
    Left = 480
    Top = 160
    object qryprecolancheID_Lanche: TFDAutoIncField
      FieldName = 'ID_Lanche'
      Origin = 'ID_Lanche'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object qryprecolancheNomeLanche: TWideStringField
      FieldName = 'NomeLanche'
      Origin = 'Nome'
      Required = True
      Size = 50
    end
    object qryprecolancheValorTotalCalculado: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'ValorTotalCalculado'
      Origin = 'ValorTotalCalculado'
      ProviderFlags = []
      ReadOnly = True
      currency = True
    end
  end
  object qrylanches_composicao: TFDQuery
    AfterEdit = qryLanches_composicaoAfterEdit
    BeforePost = qryLanches_composicaoBeforePost
    AfterPost = qryLanches_composicaoAfterPost
    AfterDelete = qryLanches_composicaoAfterDelete
    IndexFieldNames = 'ID_Lanche_FK'
    MasterSource = dsLanches
    MasterFields = 'ID_Lanche'
    DetailFields = 'ID_Lanche_FK'
    Connection = FDConn
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'SELECT * FROM Lanche_Composicao')
    Left = 272
    Top = 237
    object qrylanches_composicaoID_Composicao: TFDAutoIncField
      FieldName = 'ID_Composicao'
      Origin = 'ID_Composicao'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object qrylanches_composicaoID_Lanche_FK: TIntegerField
      FieldName = 'ID_Lanche_FK'
      Origin = 'ID_Lanche_FK'
    end
    object qrylanches_composicaoID_Ingrediente_FK: TIntegerField
      FieldName = 'ID_Ingrediente_FK'
      Origin = 'ID_Ingrediente_FK'
    end
    object qrylanches_composicaoQuantidade: TFloatField
      FieldName = 'Quantidade'
      Origin = 'Quantidade'
      OnChange = qryLanches_composicaoQuantidadeChange
    end
    object qrylanches_composicaoCOMPOSICAO_INGRED_NOME: TStringField
      FieldKind = fkLookup
      FieldName = 'COMPOSICAO_INGRED_NOME'
      LookupDataSet = qryIngredientes
      LookupKeyFields = 'ID_Ingrediente'
      LookupResultField = 'Nome'
      KeyFields = 'ID_Ingrediente_FK'
      Size = 50
      Lookup = True
    end
    object qrylanches_composicaoVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      currency = True
    end
  end
  object qrylancheslookup: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT ID_Lanche, Nome, Preco FROM Lanches ORDER BY Nome')
    Left = 448
    Top = 248
    object qrylancheslookupID_Lanche: TFDAutoIncField
      FieldName = 'ID_Lanche'
      Origin = 'ID_Lanche'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object qrylancheslookupNome: TWideStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 50
    end
    object qrylancheslookupPRECO: TFloatField
      FieldName = 'PRECO'
      Origin = 'PRECO'
    end
  end
end
