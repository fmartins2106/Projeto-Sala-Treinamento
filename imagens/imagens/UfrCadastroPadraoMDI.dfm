inherited frCadastroPadraoMDI: TfrCadastroPadraoMDI
  Left = 404
  Top = 242
  Caption = 'frCadastroPadraoMDI'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Height = 46
    ButtonHeight = 44
    ButtonWidth = 51
    Flat = True
    ShowCaptions = True
    inherited confirmar: TToolButton
      Top = 0
      OnClick = confirmarClick
    end
    inherited Consultar: TToolButton
      Left = 51
      Top = 0
      OnClick = ConsultarClick
    end
    inherited Cancelar: TToolButton
      Left = 102
      Top = 0
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 46
    Width = 709
    Height = 455
    Align = alClient
    TabOrder = 1
  end
end
