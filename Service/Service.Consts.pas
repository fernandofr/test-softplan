unit Service.Consts;

interface

uses
  System.SysUtils;

type
  TProgressNotify = procedure(Progress: Integer) of object;

  TParamsDownloadFile = record
    URL: string;
    PathSave: string;
  end;

implementation

end.
