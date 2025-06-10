unit ufrConsultaTreinamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrConsultaPadrao, DB, ImgList, Grids, DBGrids, ComCtrls,
  ToolWin,dbclient;

type
  TfrConsultaTreinamento = class(TfrConsultaPadrao)
  private
    { Private declarations }
  public
    { Public declarations }
    function setTabela : TClientDataSet; override;
    function setChave : string; override;
  end;

var
  frConsultaTreinamento: TfrConsultaTreinamento;

implementation

uses uDataModulo;

{$R *.dfm}

{ TfrConsultaTreinamento }

function TfrConsultaTreinamento.setChave: string;
begin
  Result := 'BDIDTREINAMENTO'
end;

function TfrConsultaTreinamento.setTabela: TClientDataSet;
begin
  Result := dm_Treinamento_dataModulo.CDS_TREINAMENTO;
end;

end.
