unit ufrConsultaPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ImgList,StdCtrls,Grids, DBGrids, DB,dbclient;

type
  TfrConsultaPadrao = class(TForm)
    ToolBar1: TToolBar;
    in_images: TImageList;
    ImageList1: TImageList;
    in_hot_images: TImageList;
    Consultar: TToolButton;
    Fechar: TToolButton;
    DS_Consulta_Padrao: TDataSource;
    DBgrid_Consulta_Padrao: TDBGrid;
    procedure FecharClick(Sender: TObject);
    procedure ConsultarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FTabela : TClientDataSet;
    FChave : String;
  public
    { Public declarations }
    function setTabela : TClientDataSet; virtual;abstract;
    function setChave : string;virtual;abstract;
    published
    property tabela: TClientDataSet read FTabela write FTabela;
  end;

var
  frConsultaPadrao: TfrConsultaPadrao;

implementation

{$R *.dfm}

procedure TfrConsultaPadrao.FecharClick(Sender: TObject);
begin
   close;
end;

procedure TfrConsultaPadrao.ConsultarClick(Sender: TObject);
begin
  if Owner is TEdit then
    begin
    TEdit(Owner).Text := Ftabela.FieldByName(FCHave).AsString;
    Tedit(Owner).setFocus;
    close;
    end;
end;

procedure TfrConsultaPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
     close;
end;

procedure TfrConsultaPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrConsultaPadrao.FormCreate(Sender: TObject);
begin
  Ftabela := setTabela;
  FChave := setChave;  if Assigned(FTabela) then
  begin
  DS_Consulta_Padrao.DataSet := FTabela;
  DBgrid_Consulta_Padrao.DataSource := DS_Consulta_Padrao;
  end;
  DBgrid_Consulta_Padrao.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgCancelOnExit];
end;

end.
