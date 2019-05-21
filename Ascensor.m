    function varargout = Ascensor(varargin)
% ASCENSOR MATLAB code for Ascensor.fig
%      ASCENSOR, by itself, creates a new ASCENSOR or raises the existing
%      singleton*.
%
%      H = ASCENSOR returns the handle to a new ASCENSOR or the handle to
%      the existing singleton*.
%
%      ASCENSOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASCENSOR.M with the given input arguments.
%
%      ASCENSOR('Property','Value',...) creates a new ASCENSOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Ascensor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Ascensor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Ascensor

% Last Modified by GUIDE v2.5 08-May-2019 22:57:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Ascensor_OpeningFcn, ...
                   'gui_OutputFcn',  @Ascensor_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Ascensor is made visible.
function Ascensor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Ascensor (see VARARGIN)

% Choose default command line output for Ascensor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Ascensor wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%  set(handles.,'visible','off');
set(handles.pushbutton25,'visible','off');
set(handles.uipanel18,'visible','off');

set(handles.funcion,'visible','off');
set(handles.entrada,'visible','off');
set(handles.actuadornum,'visible','off');
set(handles.actuadorden,'visible','off');
set(handles.plantanum,'visible','off');
set(handles.plantaden,'visible','off');
set(handles.sensornum,'visible','off');
set(handles.sensorden,'visible','off');
set(handles.text85,'visible','off');
set(handles.text86,'visible','off');
set(handles.text87,'visible','off');
set(handles.per,'visible','off');
set(handles.controlador,'visible','off');

set(handles.text73,'visible','off');
set(handles.kptexto,'visible','off');
set(handles.text72,'visible','off');
set(handles.kvtexto,'visible', 'off');
set(handles.text71,'visible','off');
set(handles.katexto,'visible','off');

set(handles.pushbutton14,'visible','off');
set(handles.uipanel11,'visible','off');


% set(handles.uipanel11,'visible','off');
axes(handles.axes1)
imagen = imread('Ascensor_diag.JPG');
image(imagen);
axis off


% --- Outputs from this function are returned to the command line.
function varargout = Ascensor_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val G2 G3 H numerador denominador ft P ft_p G
%Ingresar..
dataok =0;
global actuadornumSim actuadordenSim plantanumSim plantadenSim sensornumSim sensordenSim dataok

if (dataok) 
find_system('Name','simulink_ascensor');     open_system('simulink_ascensor');

%Controlador
switch val
    case 2 % Proporcional
        kp1 = str2num(get(handles.kp,'String'));
        controladornum = kp1;
        controladorden = 1;
        set_param('simulink_ascensor/Controlador','Controller','P');
        set_param('simulink_ascensor/Controlador','Form','Ideal');
        set_param('simulink_ascensor/Controlador','P',num2str(kp1));
        
    case 3% Proporcional Integral
        kp1 = str2num(get(handles.kp,'String'));
        ti1 = str2num(get(handles.ti,'String'));
        controladornum = [kp1*ti1,kp1];
        controladorden = [ti1 0];
        I = 1/ti1;
        set_param('simulink_ascensor/Controlador','Controller','PI');
        set_param('simulink_ascensor/Controlador','Form','Ideal');
        set_param('simulink_ascensor/Controlador','P',num2str(kp1));
        set_param('simulink_ascensor/Controlador','I',num2str(I));
        
    case 4% Proporcional Derivativo
        kp1 = str2num(get(handles.kp,'String'));
        td1 = str2num(get(handles.td,'String'));
        controladornum = [kp1*td1,kp1];
        controladorden = 1;
        set_param('simulink_ascensor/Controlador','Controller','PD');
        set_param('simulink_ascensor/Controlador','Form','Ideal');
        set_param('simulink_ascensor/Controlador','P',num2str(kp1));
        set_param('simulink_ascensor/Controlador','D',num2str(td1));
    case 5% Proporcional Integral Derivativo
        kp1 = str2num(get(handles.kp,'String'));
        td1 = str2num(get(handles.td,'String'));
        ti1 = str2num(get(handles.ti,'String'));
        controladornum = [ti1*td1*kp1 kp1*ti1 1*kp1];
        controladorden = [ti1 0];
end 
set_param('simulink_ascensor/Actuador','numerator',actuadornumSim);
set_param('simulink_ascensor/Actuador','denominator',actuadordenSim);
set_param('simulink_ascensor/Planta'  ,'numerator',plantanumSim);
set_param('simulink_ascensor/Planta'  ,'denominator',plantadenSim);
set_param('simulink_ascensor/Sensor'  ,'numerator',sensornumSim);   
set_param('simulink_ascensor/Sensor'  ,'denominator',sensordenSim);
% set_param('simulink_ascensor/Perturbaciones'  ,'Amplitude',perturbaciones); 
actuadornum = str2num(actuadornumSim);
actuadorden = str2num(actuadordenSim);
plantanum = str2num(plantanumSim);
plantaden = str2num(plantadenSim);
sensornum = str2num(sensornumSim);
sensorden = str2num(sensordenSim);
s = tf('s');
G1 = tf(controladornum,controladorden);
G2 = tf(actuadornum,actuadorden);
G3 = tf(plantanum,plantaden);
H = tf(sensornum,sensorden);
G = G1*G2*G3;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Respuesta en el dominio del tiempo

% Respuesta del sistema ante la perturbación
ft = feedback(G,H);
ft_reducida = balred(ft,2);
[numerador,denominador] = tfdata(ft,'v');
%Pole-Zero Plot of Dynamic System
axes(handles.axes2)
rlocus(G*H)

%%% Recordar %%%
% La respuesta del sistema es la superposicion 
% entre la respuesta a la perturbacion y a la entrada.

% Respuesta del sistema ante la perturbación.
t = 0:0.01:30;
per = get(handles.per,'Value');
P = feedback(G3,H*G1*G2);
switch per
    case 1
        ft_p = 0;
    case 2
        ft_p  = step(P,t);
    case 3
        ft_p  = impulse(P,t);
    case 4
        ft_p  = impulse(P/s,t);
    case 5
        ft_p  = impulse(P/s^2,t);
end

% Tipo de funcion de transferencia del sistema
funcion = get(handles.funcion,'Value');
switch funcion
    case 2
        ft2 = ft;
    case 3
        ft2 = ft_reducida;
end 
ft2
% 
entrada = get(handles.entrada,'Value');
mantener = get(handles.mantener,'Value');

timeRes

freqRes

save ft2
else
    msgbox('Por favor ingrese los datos')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%open_system('simulink_ascensor/Scope');
%set_param(gcs,'SimulationCommand','Start');
%save 'integrador.mat'





function actuadornum_Callback(hObject, eventdata, handles)
% hObject    handle to actuadornum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of actuadornum as text
%        str2double(get(hObject,'String')) returns contents of actuadornum as a double


% --- Executes during object creation, after setting all properties.
function actuadornum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to actuadornum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function plantaden_Callback(hObject, eventdata, handles)
% hObject    handle to plantaden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of plantaden as text
%        str2double(get(hObject,'String')) returns contents of plantaden as a double


% --- Executes during object creation, after setting all properties.
function plantaden_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plantaden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function actuadorden_Callback(hObject, eventdata, handles)
% hObject    handle to actuadorden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of actuadorden as text
%        str2double(get(hObject,'String')) returns contents of actuadorden as a double


% --- Executes during object creation, after setting all properties.
function actuadorden_CreateFcn(hObject, eventdata, handles)
% hObject    handle to actuadorden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function plantanum_Callback(hObject, eventdata, handles)
% hObject    handle to plantanum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of plantanum as text
%        str2double(get(hObject,'String')) returns contents of plantanum as a double


% --- Executes during object creation, after setting all properties.
function plantanum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plantanum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sensornum_Callback(hObject, eventdata, handles)
% hObject    handle to sensornum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sensornum as text
%        str2double(get(hObject,'String')) returns contents of sensornum as a double


% --- Executes during object creation, after setting all properties.
function sensornum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sensornum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sensorden_Callback(hObject, eventdata, handles)
% hObject    handle to sensorden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sensorden as text
%        str2double(get(hObject,'String')) returns contents of sensorden as a double


% --- Executes during object creation, after setting all properties.
function sensorden_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sensorden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function controladornum_Callback(hObject, eventdata, handles)
% hObject    handle to kp9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kp9 as text
%        str2double(get(hObject,'String')) returns contents of kp9 as a double


% --- Executes during object creation, after setting all properties.
function controladornum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kp9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function controladorden_Callback(hObject, eventdata, handles)
% hObject    handle to ti9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ti9 as text
%        str2double(get(hObject,'String')) returns contents of ti9 as a double


% --- Executes during object creation, after setting all properties.
function controladorden_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ti9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in funcion.
function funcion_Callback(hObject, eventdata, handles)
% hObject    handle to funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns funcion contents as cell array
%        contents{get(hObject,'Value')} returns selected item from funcion


% --- Executes during object creation, after setting all properties.
function funcion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in entrada.
function entrada_Callback(hObject, eventdata, handles)
% hObject    handle to entrada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns entrada contents as cell array
%        contents{get(hObject,'Value')} returns selected item from entrada


% --- Executes during object creation, after setting all properties.
function entrada_CreateFcn(hObject, eventdata, handles)
% hObject    handle to entrada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in mantener.
function mantener_Callback(hObject, eventdata, handles)
% hObject    handle to mantener (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mantener


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in controlador.
function controlador_Callback(hObject, eventdata, handles)
% hObject    handle to controlador (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns controlador contents as cell array
%        contents{get(hObject,'Value')} returns selected item from controlador
global val
val = get(handles.controlador,'value');
switch val
    case 2
        set(handles.kp,'visible','on')
        set(handles.td,'visible','off')
        set(handles.ti,'visible','off')
        set(handles.kp9,'visible','on')
        set(handles.td9,'visible','off')
        set(handles.ti9,'visible','off')
    case 3
        set(handles.kp,'visible','on')
        set(handles.ti,'visible','on')
        set(handles.td,'visible','off')
        set(handles.kp9,'visible','on')
        set(handles.ti9,'visible','on','String',"ti")
        set(handles.td9,'visible','off')
    case 4
        set(handles.kp,'visible','on')
        set(handles.td,'visible','on')
        set(handles.ti,'visible','off')
        set(handles.kp9,'visible','on')
        set(handles.td9,'visible','on','String',"td")
        set(handles.ti9,'visible','off')
    case 5
        set(handles.kp,'visible','on')
        set(handles.td,'visible','on')
        set(handles.ti,'visible','on')
        set(handles.kp9,'visible','on')
        set(handles.td9,'visible','on','String',"td")
        set(handles.ti9,'visible','on','String',"ti")
    case 6
        set(handles.kp,'visible','on')
        set(handles.ti,'visible','on')
        set(handles.td,'visible','on')
        set(handles.kp9,'visible','on')
        set(handles.ti9,'visible','on','String',"Beta")
        set(handles.td9,'visible','on','String',"T1")
    case 7
        set(handles.kp,'visible','on')
        set(handles.td,'visible','on')
        set(handles.ti,'visible','on')
        set(handles.kp9,'visible','on')
        set(handles.td9,'visible','on','String',"T1")
        set(handles.ti9,'visible','on','String',"Alfa")
    case 8
        set(handles.kp,'visible','on')
        set(handles.td,'visible','on')
        set(handles.ti,'visible','on')
        set(handles.kp9,'visible','on')
        set(handles.td9,'visible','on','String',"T2")
        set(handles.ti9,'visible','on','String',"T1")
end 

% --- Executes during object creation, after setting all properties.
function controlador_CreateFcn(hObject, eventdata, handles)
% hObject    handle to controlador (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function perturbaciones_Callback(hObject, eventdata, handles)
% hObject    handle to perturbaciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of perturbaciones as text
%        str2double(get(hObject,'String')) returns contents of perturbaciones as a double


% --- Executes during object creation, after setting all properties.
function perturbaciones_CreateFcn(hObject, eventdata, handles)
% hObject    handle to perturbaciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function perturbaden_Callback(hObject, eventdata, handles)
% hObject    handle to perturbaden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of perturbaden as text
%        str2double(get(hObject,'String')) returns contents of perturbaden as a double


% --- Executes during object creation, after setting all properties.
function perturbaden_CreateFcn(hObject, eventdata, handles)
% hObject    handle to perturbaden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to td9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of td9 as text
%        str2double(get(hObject,'String')) returns contents of td9 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to td9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kp9_Callback(hObject, eventdata, handles)
% hObject    handle to kp9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kp9 as text
%        str2double(get(hObject,'String')) returns contents of kp9 as a double


% --- Executes during object creation, after setting all properties.
function kp9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kp9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ti9_Callback(hObject, eventdata, handles)
% hObject    handle to ti9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ti9 as text
%        str2double(get(hObject,'String')) returns contents of ti9 as a double


% --- Executes during object creation, after setting all properties.
function ti9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ti9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function td9_Callback(hObject, eventdata, handles)
% hObject    handle to td9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of td9 as text
%        str2double(get(hObject,'String')) returns contents of td9 as a double


% --- Executes during object creation, after setting all properties.
function td9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to td9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function respuesta_Callback(hObject, eventdata, handles)
% hObject    handle to respuesta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function estabilidad_Callback(hObject, eventdata, handles)
% hObject    handle to estabilidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global G2 G3 H




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




function td_Callback(hObject, eventdata, handles)
% hObject    handle to td (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of td as text
%        str2double(get(hObject,'String')) returns contents of td as a double


% --- Executes during object creation, after setting all properties.
function td_CreateFcn(hObject, eventdata, handles)
% hObject    handle to td (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ti_Callback(hObject, eventdata, handles)
% hObject    handle to ti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ti as text
%        str2double(get(hObject,'String')) returns contents of ti as a double


% --- Executes during object creation, after setting all properties.
function ti_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kp_Callback(hObject, eventdata, handles)
% hObject    handle to kp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kp as text
%        str2double(get(hObject,'String')) returns contents of kp as a double


% --- Executes during object creation, after setting all properties.
function kp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global numerador denominador vkp vkv vka vbw vmg vmf vpico vfr
Panel=get(hObject,'String');
switch Panel
    case 'Respuesta en Frecuencia'
        set(handles.respuestafrecuencia,'visible','on');
        set(handles.respuestatiempo,'visible','off');
        set(hObject,'String','Respuesta en Tiempo');
        
        
    case 'Respuesta en Tiempo'
        set(handles.respuestafrecuencia,'visible','off');
        set(handles.respuestatiempo,'visible','on');
        set(hObject,'String','Respuesta en Frecuencia');
end
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in mantenerbode.
function mantenerbode_Callback(hObject, eventdata, handles)
% hObject    handle to mantenerbode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mantenerbode


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)%Visualizar






% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
F = getframe(handles.axes8);
Image = frame2im(F);
imwrite(Image, 'bode.jpg')
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global vkp vkv vka vbw vmg vmf vpico vfr 
switch(get(eventdata.NewValue, 'Tag'))
    case 'kprb'
        tanos = vkp;
    case 'kvrb'
        tanos = vkv;
    case 'karb'
        tanos = vka;
    case 'bwrb'
        tanos = vbw;
    case 'mgrb'
        tanos = vmg;
    case 'mfrb'
        tanos = vmf;
    case 'picorb'
        tanos = vpico;
    case 'fresonanterb'
        
        tanos = vfr;
        
end
kr=0:5:100;
axes(handles.axes10) 
plot(kr,tanos);
grid on;



% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% --- Executes during object creation, after setting all properties.
function pushbutton4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in popupmenu10.
function popupmenu10_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu10 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu10


% --- Executes during object creation, after setting all properties.
function popupmenu10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in per.
function per_Callback(hObject, eventdata, handles)
% hObject    handle to per (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns per contents as cell array
%        contents{get(hObject,'Value')} returns selected item from per


% --- Executes during object creation, after setting all properties.
function per_CreateFcn(hObject, eventdata, handles)
% hObject    handle to per (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Aper_Callback(hObject, eventdata, handles)
% hObject    handle to Aper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Aper as text
%        str2double(get(hObject,'String')) returns contents of Aper as a double


% --- Executes during object creation, after setting all properties.
function Aper_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Aper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function comp3_Callback(hObject, eventdata, handles)
% hObject    handle to comp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comp3 as text
%        str2double(get(hObject,'String')) returns contents of comp3 as a double


% --- Executes during object creation, after setting all properties.
function comp3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function comp2_Callback(hObject, eventdata, handles)
% hObject    handle to comp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comp2 as text
%        str2double(get(hObject,'String')) returns contents of comp2 as a double


% --- Executes during object creation, after setting all properties.
function comp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function comp1_Callback(hObject, eventdata, handles)
% hObject    handle to comp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comp1 as text
%        str2double(get(hObject,'String')) returns contents of comp1 as a double


% --- Executes during object creation, after setting all properties.
function comp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)I
Ingresar2


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
region_estable


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
global wout1 mag1 wout mag errK wpos
axes(handles.axes16)
semilogx(wout1,mag1,'b',wout,mag,'r',errK,wpos,'o')
grid
set(handles.uipanel11,'visible','on');
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
   set(handles.uipanel11,'visible','off'); 
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit29_Callback(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit29 as text
%        str2double(get(hObject,'String')) returns contents of edit29 as a double


% --- Executes during object creation, after setting all properties.
function edit29_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit30_Callback(hObject, eventdata, handles)
% hObject    handle to actuadornum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of actuadornum as text
%        str2double(get(hObject,'String')) returns contents of actuadornum as a double


% --- Executes during object creation, after setting all properties.
function edit30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to actuadornum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit31_Callback(hObject, eventdata, handles)
% hObject    handle to actuadorden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of actuadorden as text
%        str2double(get(hObject,'String')) returns contents of actuadorden as a double


% --- Executes during object creation, after setting all properties.
function edit31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to actuadorden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit32_Callback(hObject, eventdata, handles)
% hObject    handle to plantanum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of plantanum as text
%        str2double(get(hObject,'String')) returns contents of plantanum as a double


% --- Executes during object creation, after setting all properties.
function edit32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plantanum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit33_Callback(hObject, eventdata, handles)
% hObject    handle to plantaden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of plantaden as text
%        str2double(get(hObject,'String')) returns contents of plantaden as a double


% --- Executes during object creation, after setting all properties.
function edit33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plantaden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit34_Callback(hObject, eventdata, handles)
% hObject    handle to sensornum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sensornum as text
%        str2double(get(hObject,'String')) returns contents of sensornum as a double


% --- Executes during object creation, after setting all properties.
function edit34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sensornum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit35_Callback(hObject, eventdata, handles)
% hObject    handle to sensorden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sensorden as text
%        str2double(get(hObject,'String')) returns contents of sensorden as a double


% --- Executes during object creation, after setting all properties.
function edit35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sensorden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
set(handles.uipanel18,'visible','on');
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (s  ee GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
set(handles.uipanel18,'visible','off');
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
motion
