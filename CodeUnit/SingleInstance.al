codeunit 50301 "SingleIns Tracking Error"
{
    SingleInstance = true;

    procedure SetPostingError(DocNo: Code[20]; Error: Text)
    begin
        StoredDocNo := DocNo;
        StoredError := Error;
    end;

    procedure GetPostingError(DocNo: Code[20]): Text
    begin
        if StoredDocNo = DocNo then
            exit(StoredError);
    end;

    procedure Clear()
    begin
        StoredDocNo := '';
        StoredError := '';
    end;

    var
        StoredError: Text;
        StoredDocNo: Code[20];
}