inherited uCadatroPadrao: TuCadatroPadrao
  Left = 244
  Top = 210
  Width = 792
  Caption = 'uCadatroPadrao'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 776
    inherited Cadastrar: TToolButton
      OnClick = CadastrarClick
    end
    inherited Consultar: TToolButton
      OnClick = ConsultarClick
    end
  end
end
