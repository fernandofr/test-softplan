unit Helper.Question;

interface

type
  TInfoAsk = record
    Title: string;
    Text: string;
  end;

  TQuestion = class
  private
  protected
   function DoAsk(Info: TInfoAsk): Boolean;
  public
    class function Ask(const Title: string = ''; const Text: string = ''): Boolean; overload;
    class function Ask(Info: TInfoAsk): Boolean; overload;
  end;

implementation

uses
  Vcl.Dialogs,
  Vcl.Controls;

function TQuestion.DoAsk(Info: TInfoAsk): Boolean;
var
  TaskDialog: TTaskDialog;
begin
  TaskDialog := TTaskDialog.Create(nil);
  try
    TaskDialog.Caption := 'Download Manager';
    TaskDialog.Title := Info.Title;
    TaskDialog.Text := Info.Text;


    TaskDialog.CommonButtons := [];
    TaskDialog.CommonButtons := [tcbYes, tcbNo];

    TaskDialog.Execute;
    Result := TaskDialog.ModalResult in [mrOk, mrYes];
  finally
    TaskDialog.Free;
  end;
end;

class function TQuestion.Ask(Info: TInfoAsk): Boolean;
var
  Question: TQuestion;
begin
  Question := Self.Create;
  try
    Result := Question.DoAsk(Info);
  finally
    Question.Free;
  end;
end;

class function TQuestion.Ask(const Title, Text: string): Boolean;
var
  InfoAsk: TInfoAsk;
begin
  InfoAsk.Title := Title;
  InfoAsk.Text := Text;

  Result := Ask(InfoAsk);
end;

end.
