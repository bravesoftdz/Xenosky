unit fractal_terrain;

interface
uses math,ExtCtrls,windows;
type
  TFractal=class
    private
      _resX,_resY :Integer;
      pow: Integer;
      function avgsquarevals(i,j,stride: Integer): Real;
      function avgdiamondvals(i,j,stride: Integer): Real;
    public
      points: array of array of Real;
      roughness: Real;
      procedure SetResolution(x,y: Integer);
      property resX: Integer read _resX;
      property resY: Integer read _resY;
      procedure generate;

  end;
implementation

procedure TFractal.SetResolution(x,y: Integer);
var i,j: Integer;
begin
  i:=1; j:=0;
  while (i<x) or (i<y) do begin
    i:=i shl 1;
    inc(j);
  end;
  _resX:=i;
  _resY:=i;
  pow:=j;
  SetLength(points,i+1,i+1);
end;

procedure TFractal.generate;
var decrement,scale: Real;
    i,j,stride,subsize,oddline,k: Integer;
begin
  decrement:=power(2,-roughness);
  scale:=decrement;
  subsize:=_resX;
  stride:=subsize div 2;
  points[0,0]:=0.5;
  points[0,_resx]:=0.5;
  points[_resx,0]:=0.5;
  points[_resx,_resx]:=0.5;
  while stride>0 do begin
    i:=stride;
    while i<subsize do begin
      j:=stride;
      while j<subsize do begin
        points[i,j]:=scale*(random-0.5)+avgsquarevals(i,j,stride);
        j:=j+2*stride;
      end;
    i:=i+2*stride;
    end;

    oddline:=0;
    i:=0;
    while i<subsize do begin
      oddline:=1-oddline;
      j:=0;
      while j<subsize do begin
        if (oddline=1) and (j=0) then j:=j+stride;
        points[i,j]:=scale*(random-0.5)+avgdiamondvals(i,j,stride);
        if i=0 then points[subsize,j]:=points[i,j];
        if j=0 then points[i,subsize]:=points[i,j];
        j:=j+2*stride;
      end;
      i:=i+stride;
    end;
    scale:=scale*decrement;
    stride:=stride shr 1;

  end;




end;

function TFractal.avgsquarevals(i,j,stride: Integer): Real;
begin
  avgsquarevals:=(points[i-stride,j-stride]+points[i+stride,j-stride]+points[i-stride,j+stride]+points[i+stride,j+stride])/4;
end;

function TFractal.avgdiamondvals(i,j,stride: Integer): Real;
begin
  if i=0 then avgdiamondvals:=(points[i,j-stride]+points[i,j+stride]+points[_resX-stride,j]+points[i+stride,j])/4
  else
    if i=_resX then avgdiamondvals:=(points[i,j-stride]+points[i,j+stride]+points[i-stride,j]+points[stride,j])/4
    else
      if j=0 then avgdiamondvals:=(points[i-stride,j]+points[i+stride,j]+points[i,j+stride]+points[i,_resX-stride])/4
      else
        if j=_resX then avgdiamondvals:=(points[i-stride,j]+points[i+stride,j]+points[i,j-stride]+points[i,stride])/4
        else avgdiamondvals:=(points[i-stride,j]+points[i+stride,j]+points[i,j-stride]+points[i,j+stride])/4;
end;

end.
