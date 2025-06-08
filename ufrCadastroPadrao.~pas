unit ufrCadastroPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrSimples, ImgList, ComCtrls,Mask, ToolWin,dbclient, StdCtrls,DB;

type
  TfrCadastroPadrao = class(TfrSimples)
    procedure ConsultarClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
    procedure SalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ed_idExit(Sender: TObject);
  private
    { Private declarations }
    t_tabela : TClientDataSet; //representa a tabela de dados associada ao formulário
    t_indice : string; // armazena o nome do campo (ou campos) que será usado como índice para buscar dados
    t_edit_id : TEdit; //associado ao campo do índice principal (geralmente o ID).

    //Esses três métodos são abstratos e devem ser implementados nas subclasses (formulários filhos),
    //por isso o TuCadatroPadrao é pensado como uma classe base genérica reutilizável.
  public
    { Public declarations }
    function setTabela: TClientDataSet; virtual; abstract;
    function setIndice: String; virtual; abstract;
    function setEdit_id: TEdit; virtual; abstract;
    procedure salvar; virtual; abstract;
    function consultar: TForm; virtual; abstract;
    procedure carregar; virtual; abstract;
    procedure limpar_campos; virtual;
    function get_chave_composta: Boolean; virtual;
    function get_insercao_chave_composta: Boolean; virtual;
    published
    property tabela: TClientDataSet read t_tabela write t_tabela;
    // Propriedade pública que permite acessar ou definir o dataset associado ao formulário.
    // Essa propriedade expõe o campo privado `t_tabela`, que representa a tabela de dados usada
    // para carregar, salvar, consultar e excluir registros no formulário.
    // É usada pelas classes descendentes para manipular diretamente os dados
  end;

var
  frCadastroPadrao: TfrCadastroPadrao;

implementation

uses uDataModulo, Math;

{$R *.dfm}

procedure TfrCadastroPadrao.ConsultarClick(Sender: TObject);
begin
  inherited;
  consultar;
end;


procedure TfrCadastroPadrao.SalvarClick(Sender: TObject);
// Realiza o salvamento do registro:
// - Se já existe, edita o registro atual;
// - Se não existe, insere novo registro;
// - Preenche campos primários, chama método de salvamento abstrato e aplica atualizações
var w_encontrou : Boolean;
begin
  inherited;
  if Assigned(t_tabela) and Assigned(t_edit_id) then
    begin
      t_tabela.IndexFieldNames := t_indice;
      if Pos(';',t_indice) > 0 then
        w_encontrou := get_chave_composta
      else
        w_encontrou := t_tabela.FindKey([StrToIntDef(Trim(t_edit_id.Text),0)]);
      if w_encontrou then
        t_tabela.Edit
      else
      begin
        t_tabela.Insert;
        if not get_insercao_chave_composta then
          t_tabela.FieldByName(t_indice).AsInteger := StrToIntDef(t_edit_id.Text, 0);
      end;
      salvar;
      t_tabela.Post;
      t_tabela.ApplyUpdates(0);
      t_tabela.Refresh;
      if t_edit_id.CanFocus then
        t_edit_id.SetFocus;
      limpar_campos;
   end;
end;

procedure TfrCadastroPadrao.ExcluirClick(Sender: TObject);
// Exclui o registro atual após confirmação do usuário.
// Atualiza o dataset e reposiciona o foco no campo de ID
begin
  inherited;
  if MessageDlg('Deseja realmente excluir esse registro?', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      if Assigned(t_tabela) and Assigned(t_edit_id) then
        begin
         t_tabela.IndexFieldNames := t_indice;
         if t_tabela.FindKey([StrToIntDef(Trim(t_edit_id.Text),0)]) then
          t_tabela.Delete;
          t_tabela.ApplyUpdates(0);
          t_tabela.Refresh;
          if t_edit_id.CanFocus then
          t_edit_id.SetFocus;
        end;
    end;
end;

function TfrCadastroPadrao.get_chave_composta: Boolean;
// Define se o formulário usa uma chave composta (por padrão, não).
begin
  Result := False;
end;

function TfrCadastroPadrao.get_insercao_chave_composta: Boolean;
// Define se a chave composta será inserida manualmente (por padrão, não).
begin
  Result := false;
end;

procedure TfrCadastroPadrao.limpar_campos;
// Limpa os campos de entrada do formulário (TEdit e TMaskEdit),
// exceto o campo de ID principal
var
i : integer;
begin
  for i := 0 to Self.ComponentCount -1 do
    begin
      if self.Components[1] <> t_edit_id then
        begin
          if Self.Components[i] is TEdit then
            TEdit(Self.Components[i]).Clear
          else
          if Self.Components[i] is TMaskEdit then
            TMaskEdit(Self.Components[i]).Clear;
        end;
    end;
end;

procedure TfrCadastroPadrao.FormCreate(Sender: TObject);
// Inicializa o formulário:
// - Define os objetos herdados (tabela, índice e campo ID);
// - Atribui evento ao campo ID;
// - Cria índice, abre o dataset e limpa os campos.
begin
  inherited;
  t_tabela := setTabela;
  t_indice := setIndice;
  t_edit_id := setEdit_id;

  if Assigned(t_edit_id) then
    t_edit_id.OnExit := ed_idExit;
  if (trim(t_indice) <> EmptyStr) and Assigned(t_tabela) then
  begin
    t_tabela.IndexDefs.Clear;
    t_tabela.IndexDefs.Add('iPK'+ t_indice, t_indice, [ixCaseInsensitive]);
    t_tabela.IndexFieldNames := t_indice;
    t_tabela.Open;
  end;
  limpar_campos;
end;

procedure TfrCadastroPadrao.ed_idExit(Sender: TObject);
// Quando o usuário sai do campo de ID, o sistema tenta localizar o registro:
// - Se encontrado, carrega os dados no formulário;
// - Se não encontrado, limpa os campos.
var
  w_encontrou: Boolean;
begin
  if Assigned(t_tabela) and Assigned(t_edit_id) then
  begin
    t_tabela.IndexFieldNames := t_indice;
    if Pos(';', t_indice) > 0 then
      w_encontrou := get_chave_composta
    else
      w_encontrou := t_tabela.FindKey([StrToIntDef(Trim(t_edit_id.Text), 0)]);

    if w_encontrou then
      carregar
    else
      limpar_campos;
  end;
end;

end.
