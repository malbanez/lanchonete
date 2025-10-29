object formCadIngredientes: TformCadIngredientes
  Left = 0
  Top = 0
  Caption = 'Gerenciamento ingredientes'
  ClientHeight = 434
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 89
    Width = 526
    Height = 345
    Align = alBottom
    DataSource = DM.dsIngredientes
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
        Width = 360
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 108
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 526
    Height = 34
    DataSource = DM.dsIngredientes
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 624
  end
  object Panel1: TPanel
    Left = 0
    Top = 34
    Width = 526
    Height = 56
    Align = alTop
    TabOrder = 2
    ExplicitTop = 25
    ExplicitWidth = 624
    object Label2: TLabel
      Left = 367
      Top = 18
      Width = 29
      Height = 15
      Caption = 'Valor:'
    end
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 36
      Height = 15
      Caption = 'Nome:'
    end
    object DBEdit2: TDBEdit
      Left = 402
      Top = 15
      Width = 87
      Height = 23
      DataField = 'Valor'
      DataSource = DM.dsIngredientes
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 50
      Top = 15
      Width = 297
      Height = 23
      DataField = 'Nome'
      DataSource = DM.dsIngredientes
      TabOrder = 1
    end
  end
end
