set(handles.funcion,'visible','on');
set(handles.entrada,'visible','on');
set(handles.actuadornum,'visible','on');
set(handles.actuadorden,'visible','on');
set(handles.plantanum,'visible','on');
set(handles.plantaden,'visible','on');
set(handles.sensornum,'visible','on');
set(handles.sensorden,'visible','on');
set(handles.text85,'visible','on');
set(handles.text86,'visible','on');
set(handles.text87,'visible','on');
set(handles.per,'visible','on');
set(handles.controlador,'visible','on');

global actuadornumSim actuadordenSim plantanumSim plantadenSim sensornumSim sensordenSim dataok
actuadornumSim    = get(handles.actuadornum,'String');
actuadordenSim    = get(handles.actuadorden,'String');
plantanumSim      = get(handles.plantanum,'String');
plantadenSim      = get(handles.plantaden,'String');
sensornumSim      = get(handles.sensornum,'String');
sensordenSim      = get(handles.sensorden,'String');
dataok = 1;

actuadornum    = str2num(get(handles.actuadornum,'String'));
actuadorden    = str2num(get(handles.actuadorden,'String'));
plantanum      = str2num(get(handles.plantanum,'String'));
plantaden      = str2num(get(handles.plantaden,'String'));
sensornum      = str2num(get(handles.sensornum,'String'));
sensorden      = str2num(get(handles.sensorden,'String'));

G2 = tf(actuadornum,actuadorden);
G3 = tf(plantanum,plantaden);
H = tf(sensornum,sensorden);
G = G2*G3;
ft = feedback(G,H) ;
T = evalc('ft');
set(handles.ft,'String',T);
ft_reducida = balred(ft,2);
reducida = evalc('ft_reducida');
set(handles.reducida,'String',reducida);
[numerador,denominador] = tfdata(ft,'v');
[A, B, C, D] = tf2ss(numerador,denominador);
A1=evalc('A');
B1=evalc('B');
C1=evalc('C');
D1=evalc('D');
set(handles.A,'String',A1);
set(handles.B,'String',B1);
set(handles.C,'String',C1);
set(handles.D,'String',D1);

set(handles.pushbutton25,'visible','on');