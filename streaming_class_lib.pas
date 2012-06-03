unit streaming_class_lib;

interface
uses Classes,sysutils;

type

streamingClass=class(TComponent)
  private

  protected
    procedure   GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    function    GetChildOwner: TComponent; override;
    procedure   SetOwner( aComponent: TComponent );
  public
    constructor Create(owner: TComponent; _name: TComponentName); overload; virtual;
    procedure SaveToFile(filename: string);
    class function LoadFromFile(filename: string): streamingClass;
    procedure SaveBinaryToFile(filename: string);
    procedure LoadBinaryFromFile(filename: string);
    function SaveToString: string;
    procedure LoadFromString(text: string);
    function CreateFromString(text: string): TComponent;
  end;

implementation

constructor streamingClass.Create(owner: TComponent;_name: TComponentName);
begin
  inherited Create(owner);
  name:=_name;
end;

procedure streamingClass.SetOwner(aComponent: TComponent);
begin
  if aComponent.Owner<>nil then
    aComponent.Owner.RemoveComponent( aComponent );
  InsertComponent( aComponent );
end;

function streamingClass.GetChildOwner: TComponent;
begin
  Result := self;
end;

procedure streamingClass.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  i : Integer;
begin
  inherited;
  for i := 0 to ComponentCount-1 do
    Proc( Components[i] );
end;

procedure streamingClass.SaveToFile(filename: string);
var
  BinStream: TMemoryStream;
  FileStream: TFileStream;
begin
  BinStream := TMemoryStream.Create;
  try
    FileStream := TFileStream.Create(filename,fmCreate);
    try
      BinStream.WriteComponent(Self);
      BinStream.Seek(0, soFromBeginning);
      ObjectBinaryToText(BinStream, FileStream);
    finally
      FileStream.Free;

    end;
  finally
    BinStream.Free
  end;

end;

function streamingClass.SaveToString: string;
var BinStream: TMemoryStream;
    StrStream: TStringStream;
    s: string;
begin
  BinStream:=TMemoryStream.Create;
  StrStream:=TStringStream.Create(s);
  BinStream.WriteComponent(Self);
  BinStream.Seek(0,soFromBeginning);
  ObjectBinaryToText(BinStream,StrStream);
  StrStream.Seek(0,soFromBeginning);
  SaveToString:=StrStream.DataString;
  StrStream.Free;
  BinStream.Free;
end;

class function streamingClass.LoadFromFile(filename: string): streamingClass;
var
  FileStream: TFileStream;
  BinStream: TMemoryStream;
  tmp: TComponent;
begin
  FileStream := TFileStream.Create(filename, fmOpenRead	);
  try
    BinStream := TMemoryStream.Create;
    try
      ObjectTextToBinary(FileStream, BinStream);
      BinStream.Seek(0, soFromBeginning);
      tmp:=BinStream.ReadComponent(nil);
      if tmp is streamingClass then
        result:=streamingClass(tmp)
      else
        raise Exception.Create('Loaded class is not streaming class');
    finally
      BinStream.Free;
    end;
  finally
    FileStream.Free;
  end;
end;

procedure streamingClass.LoadFromString(text: string);
var
  StrStream: TStringStream;
  BinStream: TMemoryStream;
begin
  BinStream:=TMemoryStream.Create;
  StrStream:=TStringStream.Create(text);
  ObjectTextToBinary(StrStream,BinStream);
  BinStream.Seek(0, soFromBeginning);
  BinStream.ReadComponent(Self);
  BinStream.Free;
  StrStream.Free;
end;

function streamingClass.CreateFromString(text: string): TComponent;
var
  StrStream: TStringStream;
  BinStream: TMemoryStream;
begin
  BinStream:=TMemoryStream.Create;
  StrStream:=TStringStream.Create(text);
  ObjectTextToBinary(StrStream,BinStream);
  BinStream.Seek(0, soFromBeginning);
  Result:=BinStream.ReadComponent(nil);
  BinStream.Free;
  StrStream.Free;
end;


procedure streamingClass.SaveBinaryToFile(filename: string);
var FileStream: TFileStream;
begin
  try
  FileStream:=TFileStream.Create(filename,fmCreate);
  FileStream.WriteComponent(Self);
  finally
  FileStream.Free;
  end;
end;

procedure streamingClass.LoadBinaryFromFile(filename: string);
var FileStream: TFileStream;
begin
  try
  FileStream:=TFileStream.Create(filename,fmOpenRead);
  FileStream.Seek(0, soFromBeginning);
  FileStream.ReadComponent(self);
  finally
  FileStream.Free;
  end;
end;



end.
