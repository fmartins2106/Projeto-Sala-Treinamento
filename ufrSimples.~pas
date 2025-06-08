unit ufrSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ToolWin, ImgList;

type
  TfrSimples = class(TForm)
    in_images: TImageList;
    in_hot_images: TImageList;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    Salvar: TToolButton;
    Consultar: TToolButton;
    Excluir: TToolButton;
    procedure ExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frSimples: TfrSimples;

implementation

{$R *.dfm}



procedure TfrSimples.ExcluirClick(Sender: TObject);
begin
  close;
end;

procedure TfrSimples.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
     close;
end;

procedure TfrSimples.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree; //indica que o formulário deve ser liberado da memória ao ser fechado.
end;

end.
