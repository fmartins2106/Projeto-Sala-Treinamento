inherited frConsultaSala: TfrConsultaSala
  Left = 323
  Top = 204
  Caption = 'frConsultaSala'
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBgrid_Consulta_Padrao: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'BDIDSALA'
        Title.Caption = 'ID Sala'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDNOMESALA'
        Title.Caption = 'Nome Sala'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BDLOTACAOSALA'
        Title.Caption = 'Lota'#231#227'o Sala'
        Width = 117
        Visible = True
      end>
  end
end
