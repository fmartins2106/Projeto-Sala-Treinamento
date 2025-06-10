inherited frConsultaEmpresa: TfrConsultaEmpresa
  Left = 64
  Top = 170
  Width = 1461
  Caption = 'frConsultaEmpresa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 1445
  end
  inherited DBgrid_Consulta_Padrao: TDBGrid
    Width = 1445
    Columns = <
      item
        Expanded = False
        FieldName = 'BDIDEMPRESA'
        Title.Caption = 'ID Empresa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDIDCNPJ'
        Title.Caption = 'ID CNPJ'
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNOMEEMPRESA'
        Title.Caption = 'Nome Empresa'
        Width = 243
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDLOGRADOURO'
        Title.Caption = 'Logradouro'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDRUA'
        Title.Caption = 'Rua'
        Width = 282
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDBAIRRO'
        Title.Caption = 'Bairro'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDCEP'
        Title.Caption = 'CEP'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDCIDADE'
        Title.Caption = 'Cidade'
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDUFESTADO'
        Title.Caption = 'UF'
        Width = 48
        Visible = True
      end>
  end
end
