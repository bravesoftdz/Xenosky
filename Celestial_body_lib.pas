unit Celestial_body_lib;

interface
uses math,table_func_lib_0_70,graphics,classes;
type
TCelestialBody=class(TPersistent)
  private
//    _filename: string;
//    procedure write_filename(fn: string);
  public
    spectrum: table_func; //������
    vmag: Real; //��. ��������
    title: string; //��������
    description: string; //��������
    azimuth: Real; //������
    altitude: Real; //���� �����
    img: TBitmap; //�����������
    ang_size: Real; //���� ������
    constructor Create;
    destructor Destroy;
    procedure assign(Source:TPersistent); override;
//    property spectrum_filename: string read _filename write write_filename;
end;

implementation

procedure TCelestialBody.assign(Source: TPersistent);
var s: TCelestialBody;
begin
  if Source is TCelestialBody then begin
    s:=TCelestialBody(Source);
//    spectrum_filename:=s.spectrum_filename;
    spectrum.assign(s.spectrum);
    vmag:=s.vmag;
    title:=s.title;
    description:=s.description;
    azimuth:=s.azimuth;
    altitude:=s.altitude;
    img.Assign(s.img);
    ang_size:=s.ang_size;
  end
  else inherited Assign(Source);
end;

constructor TCelestialBody.Create;
begin
  Inherited Create;
  spectrum:=table_func.Create;
  img:=TBitmap.Create;
end;

destructor TCelestialBody.Destroy;
begin
  spectrum.Free;
  img.Free;
  Inherited Destroy;
end;
(*
procedure TCelestialBody.write_filename(fn: string);
begin
  _filename:=fn;
  if fn<>'' then
    spectrum.LoadFromFile(fn);
end;
*)

end.
 