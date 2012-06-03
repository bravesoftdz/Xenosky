unit Celestial_body_lib;

interface
uses math,table_func_lib,graphics,classes,streaming_class_lib;
type
TCelestialBody=class(streamingClass)
  private
    _vmag: Real; //зв. величина
    _title: string; //название
    _description: string; //описание
    _azimuth: Real; //азимут
    _altitude: Real; //угол места
    _ang_size: Real; //угол зрения
    procedure trackChange(value: Real; var name: Real);
  //    _filename: string;
//    procedure write_filename(fn: string);
  public
    //spectrum: table_func; //спектр
    //img: TBitmap; //изображение
    constructor Create(owner: TComponent; _name: TComponentName); overload; override;
    constructor Create(owner: TComponent); overload; override;

    destructor Destroy;
    procedure assign(Source:TPersistent); override;
  published
    img: TBitmap;
    spectrum: table_func;
    property vmag: Real read _vmag write trackChange(_vmag) //зв. величина
    property title: string read _title write _title;
    property description: string read _description write _description;
    property azimuth: Real read _azimuth write _azimuth;
    property altitude: Real read _altitude write _altitude;
    property ang_size: Real read _ang_size write _ang_size;
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

constructor TCelestialBody.Create(owner: TComponent; _name: TComponentName);
begin
  Inherited Create(owner,_name);
  spectrum:=table_func.Create(self,'spectrum');
  img:=TBitmap.Create;
end;

constructor TCelestialBody.Create(owner: TComponent);
begin
  Inherited Create(owner);
  spectrum:=table_func.Create(self);
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
initialization
RegisterClass(TCelestialBody);
end.
 