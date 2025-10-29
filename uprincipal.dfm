object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Lanchonete'
  ClientHeight = 412
  ClientWidth = 603
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnShow = FormShow
  TextHeight = 15
  object lblUsuarioLogado: TLabel
    Left = 8
    Top = 8
    Width = 185
    Height = 32
    Caption = 'lblUsuarioLogado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblnivel: TLabel
    Left = 208
    Top = 8
    Width = 185
    Height = 32
    Caption = 'lblUsuarioLogado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object MainMenu1: TMainMenu
    Left = 72
    Top = 104
    object Administrao1: TMenuItem
      Caption = 'Administra'#231#227'o'
      object CadastroUsurios1: TMenuItem
        Caption = '&Gerenciar Usu'#225'rios'
        OnClick = CadastroUsurios1Click
      end
      object Produtos1: TMenuItem
        Caption = '&Card'#225'pio'
        OnClick = Produtos1Click
      end
      object Pedidos1: TMenuItem
        Caption = '&Pedidos'
        OnClick = Pedidos1Click
      end
      object Ingredientes1: TMenuItem
        Caption = '&Ingredientes'
        OnClick = Ingredientes1Click
      end
      object Lanches1: TMenuItem
        Caption = '&Lanches'
        OnClick = Lanches1Click
      end
      object Clientes1: TMenuItem
        Caption = 'C&lientes'
        OnClick = Clientes1Click
      end
      object Login1: TMenuItem
        Caption = 'L&ogin'
        OnClick = Login1Click
      end
    end
  end
end
