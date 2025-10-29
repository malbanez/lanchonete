object frmPedidos: TfrmPedidos
  Left = 0
  Top = 0
  Caption = 'Gerenciamento de Pedidos'
  ClientHeight = 563
  ClientWidth = 895
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object dbvalorbruto: TDBText
    Left = 48
    Top = 496
    Width = 177
    Height = 33
    DataField = 'ValorBruto'
    DataSource = DM.dsPedidos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbvalordesconto: TDBText
    Left = 328
    Top = 496
    Width = 177
    Height = 33
    DataField = 'ValorDesconto'
    DataSource = DM.dsPedidos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBrown
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbvalortotal: TDBText
    Left = 608
    Top = 490
    Width = 185
    Height = 33
    DataField = 'ValorTotal'
    DataSource = DM.dsPedidos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -29
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 56
    Top = 465
    Width = 103
    Height = 25
    Caption = 'Valor bruto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 328
    Top = 465
    Width = 84
    Height = 25
    Caption = 'Desconto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 608
    Top = 465
    Width = 93
    Height = 25
    Caption = 'Valor total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbnavpedidos: TDBNavigator
    Left = 0
    Top = 0
    Width = 895
    Height = 41
    DataSource = DM.dsPedidos
    Align = alTop
    TabOrder = 0
  end
  object dbgpedidos: TDBGrid
    Left = 0
    Top = 41
    Width = 895
    Height = 177
    Align = alTop
    DataSource = DM.dsPedidos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DataHora'
        Title.Caption = 'Data'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'clientelookup'
        Title.Caption = 'Cliente'
        Width = 444
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorBruto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorDesconto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorTotal'
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 218
    Width = 895
    Height = 231
    Align = alTop
    Caption = 'Itens:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object dbnavitens: TDBNavigator
      Left = 2
      Top = 30
      Width = 891
      Height = 41
      DataSource = DM.dsPedidoitens
      Align = alTop
      TabOrder = 0
    end
    object dbgitenspedido: TDBGrid
      Left = 2
      Top = 71
      Width = 891
      Height = 158
      Align = alClient
      DataSource = DM.dsPedidoitens
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'itemlookup'
          Title.Caption = 'Item'
          Width = 306
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Quantidade'
          Width = 159
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorUnitario'
          ReadOnly = True
          Width = 261
          Visible = True
        end>
    end
  end
end
