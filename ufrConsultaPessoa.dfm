inherited frConsultaPessoa: TfrConsultaPessoa
  Left = 344
  Top = 85
  Caption = 'frConsultaPessoa'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBgrid_Consulta_Padrao: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'BDIDPESSOA'
        Title.Caption = 'ID Nome'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNOMEPESSOA'
        Title.Caption = 'Nome'
        Width = 204
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDSOBRENOME'
        Title.Caption = 'Sobrenome'
        Width = 191
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDCPF'
        Title.Caption = 'CPF'
        Width = 190
        Visible = True
      end>
  end
  inherited DS_Consulta_Padrao: TDataSource
    DataSet = dm_Treinamento_dataModulo.CDS_PESSOA
  end
end
