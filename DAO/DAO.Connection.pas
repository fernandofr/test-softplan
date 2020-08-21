unit DAO.Connection;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDac.DApt;

type
  TConnection = class(TDataModule)
    FConnection: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FQuery: TFDQuery;
    procedure ConnectionDataBase;
  public
    function GetConnection: TFDConnection;
    function Query: TFDQuery;
    procedure ClearQuery;
  end;

var
  Connection: TConnection;

implementation

uses
  Vcl.Forms,
  System.IniFiles;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TConnection.DataModuleCreate(Sender: TObject);
begin
  FConnection.Connected := False;
  ConnectionDataBase;
end;

procedure TConnection.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(FQuery) then
    FQuery.Free;
end;

function TConnection.GetConnection: TFDConnection;
begin
  Result := FConnection;
end;

procedure TConnection.ConnectionDataBase;
var
  Path: string;
  Ini: TIniFile;
begin
  Path := ExtractFilePath(Application.ExeName);

  if not FileExists(Path + 'Conexao.ini') then
    exit;

  Ini := TIniFile.Create(Path + 'Conexao.ini');
  try
    try
      FConnection.Connected := False;
    except
    end;

    FConnection.Params.Database := Ini.ReadString('Connection', 'Path', '');
    FConnection.Params.Add('LockingMode=Normal');
    FConnection.Connected := True;
  finally
    Ini.Free;
  end;
end;

function TConnection.Query: TFDQuery;
begin
  if  Assigned(FQuery) then
    Exit(FQuery);

  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConnection;

  Result := FQuery;
end;

procedure TConnection.ClearQuery;
begin
  if not Assigned(FQuery) then
    Exit;

  FQuery.SQL.Clear;
end;

end.
