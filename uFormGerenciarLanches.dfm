object frmgerenciarLanches: TfrmgerenciarLanches
  Left = 0
  Top = 0
  Caption = 'Gerenciar lanches'
  ClientHeight = 563
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 240
    Top = 499
    Width = 187
    Height = 28
    Caption = 'Valor Total Calculado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 624
    Height = 49
    DataSource = DM.dsLanches
    Align = alTop
    TabOrder = 0
  end
  object gbLancheDetalhes: TGroupBox
    Left = 0
    Top = 49
    Width = 624
    Height = 216
    Align = alTop
    Caption = 'Lanches'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 3
      Top = 30
      Width = 624
      Height = 155
      DataSource = DM.dsLanches
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Nome'
          Width = 221
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Width = 346
          Visible = True
        end>
    end
  end
  object gbIngredientesLanche: TGroupBox
    Left = 0
    Top = 265
    Width = 624
    Height = 208
    Align = alTop
    Caption = 'Ingredientes:'
    TabOrder = 2
    object DBNavigator2: TDBNavigator
      Left = 2
      Top = 17
      Width = 620
      Height = 34
      DataSource = DM.dsLcanches_composicao
      Align = alTop
      TabOrder = 0
    end
    object dblanchecomposicao: TDBGrid
      Left = 2
      Top = 51
      Width = 620
      Height = 142
      Align = alTop
      DataSource = DM.dsLcanches_composicao
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'COMPOSICAO_INGRED_NOME'
          Title.Caption = 'Ingrediente'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Quantidade'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Width = 111
          Visible = True
        end>
    end
  end
  object DBEdit1: TDBEdit
    Left = 447
    Top = 496
    Width = 169
    Height = 36
    DataField = 'valortotalcalculado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
end
