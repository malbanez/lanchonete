object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Login'
  ClientHeight = 262
  ClientWidth = 360
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 56
    Top = 58
    Width = 47
    Height = 21
    Caption = 'Login:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 52
    Top = 127
    Width = 51
    Height = 21
    Caption = 'Senha:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtLogin: TEdit
    Left = 109
    Top = 56
    Width = 169
    Height = 23
    TabOrder = 0
  end
  object edtSenha: TMaskEdit
    Left = 109
    Top = 125
    Width = 169
    Height = 23
    PasswordChar = '*'
    TabOrder = 1
    Text = ''
  end
  object btnLogin: TButton
    Left = 128
    Top = 192
    Width = 105
    Height = 41
    Caption = '&Login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
    OnClick = btnLoginClick
  end
  object qryLogin: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      
        'SELECT ID_Usuario, NivelAcesso FROM Usuarios WHERE Login = :pLog' +
        'in AND Senha = :pSenha')
    Left = 288
    Top = 192
    ParamData = <
      item
        Name = 'PLOGIN'
        ParamType = ptInput
      end
      item
        Name = 'PSENHA'
        ParamType = ptInput
      end>
  end
end
