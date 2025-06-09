inherited frCadastroPadrao: TfrCadastroPadrao
  Left = 179
  Top = 453
  Caption = 'frCadastroPadrao'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    inherited Salvar: TToolButton
      OnClick = SalvarClick
    end
    inherited Consultar: TToolButton
      OnClick = ConsultarClick
    end
  end
end
