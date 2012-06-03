unit xenosky_data_class;

interface

uses streaming_class_lib,classes,sysUtils,celestial_body_lib;

type
  xenosky_data=class(streamingClass)
  private
    function _bodies_count: Integer;
  public
    class function LoadFromFile(Filename: string): xenosky_data;
    property celestial_bodies_count: Integer read _bodies_count;
  end;

implementation

class function xenosky_data.LoadFromFile(Filename: string): xenosky_data;
var t: streamingClass;
begin
  t:=inherited LoadFromFile(Filename);
  if t is xenosky_data then
    result:=xenosky_data(t)
  else Raise Exception.Create('Data loaded is not xenosky_data');
end;

function xenosky_data._bodies_count: Integer;
var i,j: Integer;
begin
  j:=0;
  for i:=0 to componentCount-1 do
    if Components[i] is TCelestialBody then inc(j);
  result:=j;
end;


initialization
RegisterClass(xenosky_data);
end.
 