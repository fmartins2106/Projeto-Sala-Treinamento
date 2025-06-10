unit ufrConsultaPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,db,dbclient ,ufrConsultaPadrao, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrConsultaPessoa = class(TfrConsultaPadrao)
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela : TClientDataSet; override;
    function setChave : string; override;
  end;

var
  frConsultaPessoa: TfrConsultaPessoa;

implementation

uses uDataModulo;

{$R *.dfm}

{ TfrConsultaPessoa }

function TfrConsultaPessoa.setChave: string;
begin
  Result := 'BDIDPESSOA';
end;

function TfrConsultaPessoa.setTabela: TClientDataSet;
begin
   Result := dm_Treinamento_dataModulo.CDS_PESSOA;
end;

end.
