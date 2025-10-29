unit uFormCardapio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,udm, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls;

type
  TfrmCardapio = class(TForm)
    DBGrid1: TDBGrid;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCardapio: TfrmCardapio;

implementation

{$R *.dfm}

procedure TfrmCardapio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dm.qryCardapio.Close;
end;

procedure TfrmCardapio.FormShow(Sender: TObject);
begin
dm.qryCardapio.Open;
end;

end.
