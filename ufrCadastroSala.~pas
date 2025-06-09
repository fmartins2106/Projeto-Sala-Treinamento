unit ufrCadastroSala;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrCadastroPadrao, ImgList, ComCtrls, ToolWin,db,dbclient,
  StdCtrls;

type
  TfrCadastroSala = class(TfrCadastroPadrao)
    Edit_id_sala: TEdit;
    Edit_Nome_Sala: TEdit;
    Edit_capacidade: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    Function setTabela: TClientDataSet; override;
    Function setIndice: String; override;
    Function setEdit_id: TEdit; override;
    Procedure Salvar; override;
    Function Consultar: TForm; override;
    Procedure Carregar; override;
  end;

var
  frCadastroSala: TfrCadastroSala;

implementation

uses uDataModulo;

{$R *.dfm}

{ TfrCadastroSala }

procedure TfrCadastroSala.Carregar;
begin
  inherited;
  Edit_id_sala.Text := Tabela.FieldByName('BDIDSALA').AsString;
  Edit_Nome_Sala.Text := Tabela.FieldByName('BDNOMESALA').AsString;
  Edit_Capacidade.Text := Tabela.FieldByName('BDLOTACAOSALA').AsString;
end;

function TfrCadastroSala.Consultar: TForm;
begin
    // faze depois.
end;

procedure TfrCadastroSala.Salvar;
begin
  inherited;
  Tabela.FieldByName('BDIDSALA').AsInteger := StrToIntDef(Edit_id_sala.Text,0);
  Tabela.FieldByName('BDNOMESALA').AsString := Edit_Nome_Sala.Text;
  Tabela.FieldByName('BDLOTACAOSALA').AsInteger := StrToIntDef(Edit_Capacidade.Text,0);
end;

function TfrCadastroSala.setEdit_id: TEdit;
begin
  Result  := Edit_id_sala;
end;

function TfrCadastroSala.setIndice: String;
begin
  Result := 'BDIDSALA';
end;

function TfrCadastroSala.setTabela: TClientDataSet;
begin
  Result := dm_Treinamento_dataModulo.CDS_SALA;
end;

end.
