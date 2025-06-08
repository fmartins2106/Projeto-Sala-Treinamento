program Project1;

uses
  Forms,
  uDataModulo in '..\uDataModulo.pas' {dm_Treinamento_dataModulo: TDataModule},
  ufrPrincipal in '..\ufrPrincipal.pas' {frPrincipal},
  ufrSimples in '..\ufrSimples.pas' {frSimples},
  ufrCadastroPadrao in '..\ufrCadastroPadrao.pas' {frCadastroPadrao},
  ufrCadastroPessoa in '..\ufrCadastroPessoa.pas' {frCadastroPessoa},
  ufrCadastroSala in '..\ufrCadastroSala.pas' {frCadastroSala};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdm_Treinamento_dataModulo, dm_Treinamento_dataModulo);
  Application.CreateForm(TfrPrincipal, frPrincipal);
  Application.Run;
end.
