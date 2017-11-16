function new_fan(ts, id)
  return {start=nil, finish=ts, top=0, bottom=id}
end

data = timeseries()
size = data:size()
ts0, id0 = data:get(1)
if size < 10 or size > 6000000 or ts0 < 0 then
  return false
end
--output = "- timeseries = [ "
--for i=1,size do
--  ts, id = data:get(i)
--  output = output.."("..ts..","..id..") "
--end
--return false
-- 1st pass: detect all possible fans
tsn, idn = data:get(size)
fan  = new_fan(tsn, idn)
fans = {}
nfan = 1
for i=size,1,-1 do
  --BAL_LOG(20, "getting i="..i.." from size="..size)
  ts, id = data:get(i)
  --BAL_LOG(20, "ts="..ts.." id="..id.." (end, top, bottom) = ("..fan['finish']..","..fan['top']..","..fan['bottom']..")")
  if id < fan['bottom'] then
    --BAL_LOG(0, "NEW FAN! id="..id.." < bottom="..fan['bottom'])
    fan['start'] = ts
    fans[nfan]   = fan
    nfan         = nfan + 1
    fan = new_fan(ts, id)
  end

  if id > fan['top'] then
    fan['top'] = id
  end
end
fan['start'] = 0
fans[nfan] = fan

if #fans == 0 then
  BAL_LOG(0, "not enough fans "..#fans.."; nevents="..size.." return FALSE; (ts,id), first="..ts0..","..id0..") last=("..tsn..","..idn..")")
  return false
end

-- 2nd pass: avoid false positives
regimes = {}
nregime = 1
for i=#fans,2,-1 do
  if fans[i]['top'] < fans[i-1]['bottom'] then
    fans[i]['finish'] = fans[i-1]['finish']
    regimes[nregime] = fans[i]
    nregime = nregime + 1
  end
end
regimes[nregime] = fans[i]
if #regimes < 2 then
  BAL_LOG(0, "not enough regimes "..#regimes.."; nfans="..#fans.." nevents="..size.." return FALSE; (ts,id), first="..ts0..","..id0..") last=("..tsn..","..idn..")")
  return false
end

howmuch = regimes[#regimes-1]['top']-regimes[1]['bottom']
WRstate(howmuch)
BAL_LOG(0, "return TRUE!!! howmuch="..howmuch.." size="..size.." #regimes="..#regimes.." nkeys="..RDstate().." (ts,id), first="..ts0..","..id0..") last=("..tsn..","..idn..")")
return true

--output = "["
--for i=1,#regimes do
--  fan = regimes[i]
--  BAL_LOG(0, i..": start="..fan['start'].." finish="..fan['finish'].." top="..fan['top'].." bottom="..fan['bottom'])
--  output = output..fan['start']..","
--end
--BAL_LOG(0, output)
