unit ufrPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, dbclient,db;

type
  TfrPrincipal = class(TForm)
    Panel1: TPanel;
    MenuSistema: TMainMenu;
    Cadastro1: TMenuItem;
    Empresa1: TMenuItem;
    Pessoa1: TMenuItem;
    Sala1: TMenuItem;
    Treinamento: TMenuItem;
    procedure Pessoa1Click(Sender: TObject);
    procedure Sala1Click(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure TreinamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPrincipal: TfrPrincipal;

implementation

uses ufrCadastroPessoa, uDataModulo, ufrCadastroSala, ufrCadastroEmpresa,
  ufrCadastroTreinamento, ufrConsultaPessoa;

{$R *.dfm}


procedure TfrPrincipal.Pessoa1Click(Sender: TObject);
begin
  TfrCadastroPessoa.Create(Self).Show;
end;

procedure TfrPrincipal.Sala1Click(Sender: TObject);
begin
   TfrCadastroSala.Create(Self).Show;
end;

procedure TfrPrincipal.Empresa1Click(Sender: TObject);
begin
  TfrCadastroEmpresa.Create(Self).Show;
end;

procedure TfrPrincipal.TreinamentoClick(Sender: TObject);
begin
  TfrCadastroTreinamento.Create(Self).Show;
end;

end.
