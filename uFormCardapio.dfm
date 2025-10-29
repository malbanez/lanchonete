object frmCardapio: TfrmCardapio
  Left = 0
  Top = 0
  Caption = 'Card'#225'pio'
  ClientHeight = 556
  ClientWidth = 858
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object DBText1: TDBText
    Left = 16
    Top = 392
    Width = 121
    Height = 33
    DataField = 'Nome'
    DataSource = DM.dsCardapio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object DBText2: TDBText
    Left = 16
    Top = 440
    Width = 529
    Height = 108
    DataField = 'Ingredientes'
    DataSource = DM.dsCardapio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object DBText3: TDBText
    Left = 624
    Top = 440
    Width = 137
    Height = 49
    Alignment = taCenter
    DataField = 'ValorTotal'
    DataSource = DM.dsCardapio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 80
    Width = 817
    Height = 297
    DataSource = DM.dsCardapio
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ingredientes'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorTotal'
        Visible = True
      end>
  end
end
