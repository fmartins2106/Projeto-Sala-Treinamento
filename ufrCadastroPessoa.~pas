unit ufrCadastroPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrCadastroPadrao, ImgList, ComCtrls, ToolWin, StdCtrls,dbclient,db;

type
  TfrCadastroPessoa = class(TfrCadastroPadrao)
    Edit_ID_Pessoa: TEdit;
    Edit_Nome: TEdit;
    Edit_Sobrenome: TEdit;
    Edit_CPF: TEdit;
    ID_Pessoa: TLabel;
    Nome: TLabel;
    Sobrenome: TLabel;
    Label4: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    Function setTabela: TClientDataSet; override; // Retorna o dataset da tabela de pessoas
    Function setIndice: String; override; // Retorna o campo usado como índice (chave primária)
    Function setEdit_id: TEdit; override; // Retorna o TEdit correspondente ao campo de ID
    Procedure Salvar; override;  // Preenche os campos do dataset com os dados dos edits
    Function Consultar: TForm; override; // Retorna o form de consulta relacionado a pessoa
    Procedure Carregar; override;  // Preenche os campos da tela com os dados do dataset
  end;

var
  frCadastroPessoa: TfrCadastroPessoa;

implementation

uses uDataModulo, ufrConsultaPessoa;

{$R *.dfm}

{ TfrCadastroPess }

procedure TfrCadastroPessoa.Carregar;
begin
  inherited;
  Edit_ID_Pessoa.Text := tabela.FieldByName('BDIDPESSOA').AsString;
  Edit_Nome.Text := tabela.FieldByName('BDNOMEPESSOA').AsString;
  Edit_Sobrenome.Text := tabela.FieldByName('BDSOBRENOME').AsString;
  Edit_CPF.Text := tabela.FieldByName('BDCPF').AsString;
end;

function TfrCadastroPessoa.Consultar: TForm;
begin
  Result := TfrConsultaPessoa.Create(Edit_ID_Pessoa);
end;

procedure TfrCadastroPessoa.Salvar;
begin
  inherited;
  Tabela.FieldByName('BDIDPESSOA').AsInteger := StrToIntDef(Edit_ID_Pessoa.Text,0);
  Tabela.FieldByName('BDNOMEPESSOA').AsString :=Edit_Nome.Text;
  Tabela.FieldByName('BDSOBRENOME').AsString :=Edit_Sobrenome.Text;
  Tabela.FieldByName('BDCPF').AsString := Edit_CPF.Text;
end;

function TfrCadastroPessoa.setEdit_id: TEdit;
begin
  Result := Edit_ID_Pessoa;
end;

function TfrCadastroPessoa.setIndice: String;
begin
  Result := 'BDIDPESSOA'
end;

function TfrCadastroPessoa.setTabela: TClientDataSet;
begin
  Result := dm_Treinamento_dataModulo.CDS_PESSOA;
end;

end.
