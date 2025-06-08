unit uDataModulo;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, SimpleDS, DBClient, Provider,
  dialogs, FMTBcd;

type
  Tdm_Treinamento_dataModulo = class(TDataModule)
    DSP_T_PESSOA: TDataSetProvider;
    CDS_PESSOA: TClientDataSet;
    SQLConnection_BDTreinamento: TSQLConnection;
    T_PESSOA: TSQLTable;
    T_SALA: TSQLTable;
    T_EMPRESA: TSQLTable;
    T_TREINAMENTO: TSQLTable;
    DSP_T_SALA: TDataSetProvider;
    DPS_T_TREINAMENTO: TDataSetProvider;
    CDS_SALA: TClientDataSet;
    CDS_EMPRESA: TClientDataSet;
    CDS_TREINAMENTO: TClientDataSet;
    DPS_EMPRESA: TDataSetProvider;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_Treinamento_dataModulo: Tdm_Treinamento_dataModulo;

implementation

{$R *.dfm}

procedure Tdm_Treinamento_dataModulo.DataModuleCreate(Sender: TObject);
begin
  SQLConnection_BDTreinamento.Close;
  SQLConnection_BDTreinamento.LoginPrompt := False;
  SQLConnection_BDTreinamento.ConnectionName := 'FBConnection';
  SQLConnection_BDTreinamento.DriverName := 'Firebird';
  SQLConnection_BDTreinamento.GetDriverFunc := 'getSQLDriverINTERBASE';
  SQLConnection_BDTreinamento.LibraryName := 'dbexpint.dll';//'dbxfb.dll';
  SQLConnection_BDTreinamento.VendorLib := 'fbembed.dll';
  SQLConnection_BDTreinamento.Params.Clear;
  SQLConnection_BDTreinamento.Params.Values['DriverName'] := 'Firebird';
  SQLConnection_BDTreinamento.Params.Values['Database'] := 'C:\Users\Master\OneDrive\Documentos\Delphi\ProjetoSistemaTreinamento\Banco de dados\BANCO_TREINAMENTO.FDB';
  SQLConnection_BDTreinamento.Params.Values['RoleName'] := EmptyStr;
  SQLConnection_BDTreinamento.Params.Values['User_Name'] := 'SYSDBA';
  SQLConnection_BDTreinamento.Params.Values['Password'] := 'masterkey';
  SQLConnection_BDTreinamento.Params.Values['ServerCharSet'] := 'WIN1252';
  SQLConnection_BDTreinamento.Params.Values['SQLDialect'] := '3';
  SQLConnection_BDTreinamento.Params.Values['ErrorResourceFile'] := EmptyStr;
  SQLConnection_BDTreinamento.Params.Values['LocaleCode'] := '0000';
  SQLConnection_BDTreinamento.Params.Values['BlobSize'] := '-1';
  SQLConnection_BDTreinamento.Params.Values['CommitRetain'] := 'True';
  SQLConnection_BDTreinamento.Params.Values['WaitOnLocks'] := 'True';
  SQLConnection_BDTreinamento.Params.Values['IsolationLevel'] := 'ReadCommitted';
  SQLConnection_BDTreinamento.Params.Values['Trim Char'] := 'False';
  SQLConnection_BDTreinamento.Open;

  try
    SQLConnection_BDTreinamento.Connected := True;
    ShowMessage('Conexão com o banco de dados realizada com sucesso!');

    // LIGAÇÕES QUE FALTAVAM
    DSP_T_PESSOA.DataSet := T_PESSOA;
    CDS_PESSOA.ProviderName := 'DSP_T_PESSOA';
    // Ativando dataset (opcional, mas ajuda em testes)
    T_PESSOA.Active := True;
    CDS_PESSOA.Open;

    // Configuração SALA
    DSP_T_SALA.DataSet := T_SALA;
    CDS_SALA.ProviderName := 'DSP_T_SALA';
    T_SALA.Active := True;
    CDS_SALA.Open;


  except
    on E: Exception do
      ShowMessage('Erro ao conectar com o banco de dados: ' + E.Message);
  end;
end;
end.
