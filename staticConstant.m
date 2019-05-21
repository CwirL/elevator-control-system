[numol,denol] = tfdata(openLoop, 'v');
global wout1 mag1 wout mag errK wpos
syms x
%Hallar tipo y valor de dc
tipo=0;
dengain = 0;
j=length(denol)-1;
for i=1:1:length(denol)
    dengain = denol(i)*x^j+dengain;
    if denol(i)==0
        tipo=tipo+1;
    end
    j=j-1;
end
%Polos en origen
tipof=tipo
tipo = 1/s^tipo;

%Hallar gain dc
numgain = 0;
j=length(numol)-1;
for i = 1:1:length(numol)
    numgain =numol(i)*x^j+numgain;
    j=j-1;
end
dengain = factor(dengain);
numgain = factor(numgain);
%Denominador
cent=1;

kpos = [];
for i=1:1:length(dengain)
    str = char(dengain(i));
    for j=1:1:length(str)
        if str(j)=='x'
            kpos(cent) = i;
            cent = cent+1;
            break 
        end
    end
end
for i=1:1:length(kpos)
    dengain(kpos(i))=subs(dengain(kpos(i)),x,0);
end
denGain=1;
for i = 1:1:length(dengain)
    if dengain(i)~=0
        denGain = dengain(i)*denGain;
    end
end

%Numerador
cent=1;

kpos = [];
for i=1:1:length(numgain)
    str = char(numgain(i));
    for j=1:1:length(str)
        if str(j)=='x'
            kpos(cent) = i;
            cent = cent+1;
            break 
        end
    end
end
for i=1:1:length(kpos)
    numgain(kpos(i))=subs(numgain(kpos(i)),x,0);
end
numGain=1;
for i = 1:1:length(numgain)
    if numgain(i)~=0
        numGain = numgain(i)*numGain;
    end
    
end

dcGain = numGain/denGain;

tipo = tipo*eval(dcGain);
w=logspace(-6,4,1000);
[mag1,phase1,wout1] = bode(openLoop,w);
[mag,phase,wout] = bode(tipo,w);
wpos = 10e3;
minmagState = "off";
for i=1:1:length(mag)
    test = 20*log10(mag(i));
    if 20*log10(mag(i))<wpos && 20*log10(mag(i))>=0
        wpos = 20*log10(mag(i));
        minmag = mag(i);
        minmagState = "on";
        if i==length(mag) && minmag == undefined
            
        end
    end
end
if strcmp(minmagState,"off")
    margin(openLoop)
%     axes(handles.axes1)
%     [Gm,Pm,Wcg,Wcp] = margin(openLoop);
%     set(handles.text8,'string',Wcp);

    %set(handles.text11,'string',);
    %set(handles.text12,'string',);
%     set(handles.text13,'string',GmdB);
%     set(handles.text14,'string',Pm);
    Wcp =round(Wcp*100)/100;
    Pm = round(Pm*100)/100;
    GmdB=20*log10(Gm);
    GmdB = round(GmdB*100)/100;
    
    
else
    wpos1 = find(mag==minmag);
    errK = wout(wpos1);
    mag1=20*log10(mag1);
    mag=20*log10(mag);
    mag1 = mag1(:);
    mag = mag(:);
    
%     semilogx(wout1,mag1,'b',wout,mag,'r',errK,wpos,'o')
%     grid
%     axes(handles.axes1)
    switch tipof
    case 0
        %Constante de error de posicion
        set(handles.text73,'visible','on');
        set(handles.kptexto,'visible','on');
        set(handles.text72,'visible','off');
        set(handles.kvtexto,'visible', 'off');
        set(handles.text71,'visible','ff');
        set(handles.katexto,'visible','off');
        
        set(handles.text10,'string',dcGain);
    case 1
        %Constante de error de aceleracion
        set(handles.text73,'visible','off');
        set(handles.kptexto,'visible','off');
        set(handles.text72,'visible','on');
        set(handles.kvtexto,'visible', 'on');
        set(handles.text71,'visible','off');
        set(handles.katexto,'visible','off');
        
        set(handles.kvtexto,'string',errK);
    case 2
        %Constante de error de aceleracion
        set(handles.text73,'visible','off');
        set(handles.kptexto,'visible','off');
        set(handles.text72,'visible','off');
        set(handles.kvtexto,'visible', 'off');
        set(handles.text71,'visible','on');
        set(handles.katexto,'visible','on');
        set(handles.katexto,'string',sqrt(errK))
    end
%     margin(openLoop)
%     axes(handles.axes2)
    set(handles.pushbutton14,'visible','on');
end