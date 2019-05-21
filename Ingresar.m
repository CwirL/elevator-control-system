function varargout = Ingresar(varargin)
% INGRESAR MATLAB code for Ingresar.fig
%      INGRESAR, by itself, creates a new INGRESAR or raises the existing
%      singleton*.
%
%      H = INGRESAR returns the handle to a new INGRESAR or the handle to
%      the existing singleton*.
%
%      INGRESAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INGRESAR.M with the given input arguments.
%
%      INGRESAR('Property','Value',...) creates a new INGRESAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Ingresar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Ingresar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Ingresar

% Last Modified by GUIDE v2.5 08-May-2019 20:10:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Ingresar_OpeningFcn, ...
                   'gui_OutputFcn',  @Ingresar_OutputFcn, ...
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


% --- Executes just before Ingresar is made visible.
function Ingresar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Ingresar (see VARARGIN)

% Choose default command line output for Ingresar
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Ingresar wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Ingresar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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
ft_reducida = balred(ft,2);
reducida = evalc('ft_reducida');
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



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global actuadornumSim actuadordenSim plantanumSim plantadenSim sensornumSim sensordenSim dataok
actuadornumSim    = get(handles.actuadornum,'String');
actuadordenSim    = get(handles.actuadorden,'String');
plantanumSim      = get(handles.plantanum,'String');
plantadenSim      = get(handles.plantaden,'String');
sensornumSim      = get(handles.sensornum,'String');
sensordenSim      = get(handles.sensorden,'String');
dataok = 1;
Ascensor
close(handles.figure1);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
