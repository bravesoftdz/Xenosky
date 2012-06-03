unit current_working_file_info;
//��������, ��� ��� over-engineering,
//����� ���� �� �������� ���� ����� ���������� ����������
//�� ��� �������� - ����� ����� ������������ ���-�� ����� ������ ������� �������� ������ � ��.
interface

uses Controls;

type
TCurrentFileInfo=class
  private
    _FileName: string;
    _changed: boolean;
    procedure change_Filename(fn: string);
  public
    SaveButton: TControl;
    procedure Clear;
    procedure Change;
    constructor Create;
    property FileName: string read _FileName write change_FileName;
    property changed: boolean read _changed;
end;


implementation

constructor TCurrentFileInfo.Create;
begin
  inherited Create;
  SaveButton:=nil;
  FileName:='';
  Clear;
end;

procedure TCurrentFileInfo.Clear;
begin
  _changed:=false;
  if SaveButton<>nil then
    SaveButton.Enabled:=false;
end;

procedure TCurrentFileInfo.Change;
begin
  _changed:=true;
  if SaveButton<>nil then
    SaveButton.Enabled:=true;
end;

procedure TCurrentFileInfo.change_Filename(fn: string);
begin
  _FileName:=fn;
  if SaveButton<>nil then begin
    if FileName='' then
      SaveButton.Hint:='��������� ���...'
    else
      SaveButton.Hint:='��������� � '+FileName;
  end;
end;

end.
