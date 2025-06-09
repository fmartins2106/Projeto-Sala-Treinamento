object frPrincipal: TfrPrincipal
  Left = 359
  Top = 105
  Width = 547
  Height = 540
  Caption = 'frPrincipal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MenuSistema
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 531
    Height = 481
    Align = alClient
    Color = clGray
    TabOrder = 0
  end
  object MenuSistema: TMainMenu
    Left = 264
    Top = 144
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Empresa1: TMenuItem
        Caption = 'Empresa'
        OnClick = Empresa1Click
      end
      object Pessoa1: TMenuItem
        Caption = 'Pessoa'
        OnClick = Pessoa1Click
      end
      object Sala1: TMenuItem
        Caption = 'Sala'
        OnClick = Sala1Click
      end
      object Treinamento: TMenuItem
        Caption = 'Treinamento'
        OnClick = TreinamentoClick
      end
    end
    object Consulta1: TMenuItem
      Caption = 'Consulta'
      object ConsultaSalas1: TMenuItem
        Caption = 'Consulta Salas'
      end
    end
  end
end
