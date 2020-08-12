unit View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls,
  Vcl.WinXCtrls,
  Data.DB,
  Vcl.ComCtrls,
  Vcl.Grids,
  Vcl.DBGrids;

type
  TViewMain = class(TForm)
    {$REGION 'Componentes'}
    Panel1: TPanel;
    pnlTitulo: TPanel;
    lnInformacao: TLabel;
    imgNotificacao: TImage;
    pnInformacoes: TPanel;
    Label3: TLabel;
    edtUrlDonwload: TEdit;
    Label1: TLabel;
    sbLocalDonwload: TSearchBox;
    pnAdd: TPanel;
    DBGrid1: TDBGrid;
    ProgressBar1: TProgressBar;
    {$ENDREGION}
  private

  public

  end;

var
  ViewMain: TViewMain;

implementation

{$R *.dfm}

Initialization
  ReportMemoryLeaksOnShutdown := (DebugHook <> 0);


end.
