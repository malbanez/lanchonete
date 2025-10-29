object frmClientes: TfrmClientes
  Left = 0
  Top = 0
  Caption = 'Clientes'
  ClientHeight = 441
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
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 624
    Height = 65
    DataSource = DM.dsClientes
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 72
    ExplicitTop = 8
    ExplicitWidth = 320
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 624
    Height = 376
    Align = alClient
    DataSource = DM.dsClientes
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 365
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataCadastro'
        Width = 133
        Visible = True
      end>
  end
end
