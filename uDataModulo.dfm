object dm_Treinamento_dataModulo: Tdm_Treinamento_dataModulo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 729
  Top = 136
  Height = 319
  Width = 906
  object DSP_T_PESSOA: TDataSetProvider
    DataSet = T_PESSOA
    Left = 40
    Top = 144
  end
  object CDS_PESSOA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_T_PESSOA'
    Left = 40
    Top = 200
  end
  object SQLConnection_BDTreinamento: TSQLConnection
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      
        'Database=C:\Users\Master\OneDrive\Documentos\Delphi\ProjetoSiste' +
        'maTreinamento\Banco de dados\BANCO_TREINAMENTO.FDB'
      'RoleName=BDTREINAMENTO'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'ServerCharSet=WIN1252'
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Left = 72
    Top = 16
  end
  object T_PESSOA: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection_BDTreinamento
    TableName = 'T_PESSOA'
    Left = 48
    Top = 80
  end
  object T_SALA: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection_BDTreinamento
    TableName = 'T_SALA'
    Left = 176
    Top = 80
  end
  object T_EMPRESA: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection_BDTreinamento
    Left = 296
    Top = 88
  end
  object T_TREINAMENTO: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SQLConnection_BDTreinamento
    TableName = 'T_TREINAMENTO'
    Left = 408
    Top = 80
  end
  object DSP_T_SALA: TDataSetProvider
    DataSet = T_SALA
    Left = 168
    Top = 144
  end
  object DPS_T_TREINAMENTO: TDataSetProvider
    DataSet = T_TREINAMENTO
    Left = 408
    Top = 144
  end
  object CDS_SALA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_T_SALA'
    Left = 168
    Top = 200
  end
  object CDS_EMPRESA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_T_EMPRESA'
    Left = 288
    Top = 200
  end
  object CDS_TREINAMENTO: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DPS_T_TREINAMENTO'
    Left = 408
    Top = 200
  end
  object DPS_EMPRESA: TDataSetProvider
    DataSet = T_EMPRESA
    Left = 272
    Top = 152
  end
end
