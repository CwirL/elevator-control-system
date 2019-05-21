mantener2 = get(handles.mantenerbode,'Value');
if mantener2 == 1
   hold on
else
   hold off
end

s=tf('s');
openLoop = G*H;
axes(handles.axes8)
margin(openLoop)

[Gm,Pm,Wcg,Wcp] = margin(openLoop);
Wcp =round(Wcp*100)/100;
Mf = round(Pm*100)/100;
GmdB=20*log10(Gm);
Mg = round(GmdB*100)/100;
set(handles.mftexto,'String',Mf);%
set(handles.mgtexto,'String',Mg);%
set(handles.fctexto,'String',Wcp);%

pico=20*log10(getPeakGain(openLoop));
set(handles.picotexto,'String',pico);

[m,p,w]=bode(openLoop);
mag = squeeze(m);
magx=20*log10(mag);

set(handles.picotexto,'String',pico);
if isempty(pico)
    fr='-';
else
    fr=w(magx == max(magx));
end
set(handles.frtexto,'String',fr);

bw=bandwidth(openLoop);
set(handles.bwtexto,'String',bw);

staticConstant
% [kp, kv, ka] = static_constants(numerador, denominador);
% set(handles.kptexto,'String',kp);%
% set(handles.kvtexto,'String',kv);%
% set(handles.katexto,'String',ka);%