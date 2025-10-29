object frmcadusuarios: Tfrmcadusuarios
  Left = 0
  Top = 0
  Caption = 'Cadastro de usu'#225'rios'
  ClientHeight = 507
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object dbgUsuarios: TDBGrid
    Left = 2
    Top = 240
    Width = 335
    Height = 241
    DataSource = DM.dsUsuarios
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Login'
        Width = 172
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NivelAcesso'
        Width = 100
        Visible = True
      end>
  end
  object dbnUsuarios: TDBNavigator
    Left = 0
    Top = 0
    Width = 346
    Height = 41
    DataSource = DM.dsUsuarios
    Align = alTop
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 41
    Width = 346
    Height = 168
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 67
      Top = 9
      Width = 33
      Height = 15
      Caption = 'Login:'
    end
    object Label2: TLabel
      Left = 65
      Top = 56
      Width = 35
      Height = 15
      Caption = 'Senha:'
    end
    object SpeedButton1: TSpeedButton
      Left = 392
      Top = 32
      Width = 23
      Height = 22
    end
    object Label3: TLabel
      Left = 16
      Top = 136
      Width = 84
      Height = 15
      Caption = 'N'#237'vel de acesso:'
    end
    object Label4: TLabel
      Left = 4
      Top = 96
      Width = 96
      Height = 15
      Caption = 'Confirme a senha:'
    end
    object dbeLogin: TDBEdit
      Left = 106
      Top = 6
      Width = 177
      Height = 23
      DataField = 'Login'
      DataSource = DM.dsUsuarios
      TabOrder = 0
    end
    object dbeSenha: TDBEdit
      Left = 106
      Top = 53
      Width = 177
      Height = 23
      DataField = 'Senha'
      DataSource = DM.dsUsuarios
      PasswordChar = '*'
      TabOrder = 1
      OnChange = dbeSenhaChange
    end
    object dblcbNivelAcesso: TDBLookupComboBox
      Left = 106
      Top = 132
      Width = 177
      Height = 23
      DataField = 'NivelAcesso'
      DataSource = DM.dsUsuarios
      KeyField = 'ID_Nivel'
      ListField = 'NivelNome'
      ListSource = DM.dsnivelacesso
      TabOrder = 3
    end
    object edtconfsenha: TMaskEdit
      Left = 106
      Top = 93
      Width = 177
      Height = 23
      PasswordChar = '*'
      TabOrder = 2
      Text = ''
      OnKeyUp = edtconfsenhaKeyUp
    end
  end
end
