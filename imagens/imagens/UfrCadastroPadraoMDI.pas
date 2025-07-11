unit UfrCadastroPadraoMDI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormSimples, ImgList, ComCtrls, ToolWin, Dbclient, StdCtrls, ExtCtrls,
  DB;

type
  TfrCadastroPadraoMDI = class(TSimples)
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure EditCodigoExit (Sender : TObject);
    procedure confirmarClick(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure ConsultarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  FTabela: TClientDataSet;
  FIndice: String;
  FEditCodigo: TEdit;
  public
    { Public declarations }
    Function setTabela: TClientDataSet; virtual; abstract;
    Function setIndice: String; virtual; abstract;
    Function setEditCodigo: TEdit; virtual; abstract;
    Procedure Salvar; virtual; abstract;
    Function Consultar: TForm; virtual; abstract;
    Procedure Carregar; virtual; abstract;
    Procedure LimparCampos; virtual;
    published
    property Tabela: TClientDataSet read FTabela write FTabela;
  end;

var
  frCadastroPadraoMDI: TfrCadastroPadraoMDI;

implementation

{$R *.dfm}

{ TfrCadastroPadraoMDI }

procedure TfrCadastroPadraoMDI.LimparCampos;
var
i: integer;
begin
  for i := 0 to Self.ComponentCount-1 do
  begin
    if Self.Components[i] <> FEditCodigo then
    begin
      if Self.Components[i] is TEdit then
        TEdit(Self.Components[i]).Clear
      else
      if Self.Components[i] is TComboBox then
        TComboBox(Self.Components[i]).ItemIndex := -1;
    end;
  end;
end;

procedure TfrCadastroPadraoMDI.FormCreate(Sender: TObject);
begin
  inherited;
  FTabela := setTabela;
  FIndice := setIndice;
  FEditCodigo := setEditCodigo;

  if Assigned(FEditCodigo) then
  FEditCodigo.OnExit := EditCodigoExit;

  if (Trim (FIndice) <> EmptyStr) and Assigned (FTabela) then
  begin
  FTabela.IndexDefs.Clear;
  FTabela.IndexDefs.Add('i' + FIndice, FIndice, [ixCaseInsensitive]);
  FTabela.IndexFieldNames := FIndice;
  FTabela.open;
  end;
  limparCampos;
end;

procedure TfrCadastroPadraoMDI.EditCodigoExit(Sender: TObject);
begin
  if Assigned(FTabela) and Assigned(FEditCodigo) then
  begin
  FTabela.IndexFieldNames := FIndice;
  if FTabela.FindKey([StrToIntDef (trim(FEditCodigo.Text), 0)]) then
    carregar
  else
  limparCampos;
  end;
end;



procedure TfrCadastroPadraoMDI.confirmarClick(Sender: TObject);
begin
  inherited;
  if Assigned(FTabela) and Assigned(FEditCodigo) then
  begin
  FTabela.IndexFieldNames := FIndice;
  if FTabela.FindKey([StrToIntDef(Trim(FEditCodigo.Text), 0)]) then
  FTabela.Edit
  else
  begin
  FTabela.Insert;
  FTabela.FieldByName(FIndice).AsInteger := StrToIntDef(FEditCodigo.Text, 0);
  end;

  Salvar;
  FTabela.Post;
  FTabela.ApplyUpdates(0);
  FTabela.Refresh;

  if FEditCodigo.CanFocus then
      FEditCodigo.SetFocus;
  LimparCampos;
  end;
end;

procedure TfrCadastroPadraoMDI.CancelarClick(Sender: TObject);
begin

    if MessageDlg('Deseja realmente excluir esse registro?',mtInformation, [mbYes,mbNo],0) = mrYes then
    begin
      if Assigned(FTabela) and Assigned(FEditCodigo) then
      begin
        FTabela.IndexFieldNames := FIndice;
        if FTabela.FindKey([StrToIntDef(Trim(FEditCodigo.Text), 0)]) then
        FTabela.Delete;

        FTabela.ApplyUpdates(0);
        FTabela.Refresh;
        if FEditCodigo.CanFocus then
            FEditCodigo.SetFocus;
        limparCampos;
      end;
    end;

end;

procedure TfrCadastroPadraoMDI.ConsultarClick(Sender: TObject);
begin
  inherited;
  Consultar;
end;

procedure TfrCadastroPadraoMDI.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = vk_escape then
  begin
    if ActiveControl <> FEditCodigo then
    FEditCodigo.SetFocus
    else
        inherited;
    end
    else
    if key = vk_f3 then
    Consultar.OnClick(sender);
end;

end.
