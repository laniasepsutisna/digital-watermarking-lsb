function varargout = dewatermark(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dewatermark_OpeningFcn, ...
                   'gui_OutputFcn',  @dewatermark_OutputFcn, ...
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

function dewatermark_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

guidata(hObject, handles);
global key_d        
if isempty(key_d)   
key_d=0;            
global type         
type=0;             
end

function varargout = dewatermark_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function btnextract_Callback(hObject, eventdata, handles)

set(handles.txtwatermark,'String','Dewatermarking..');                        
img=get(handles.edit1,'String');                                        
if isempty(img)                                                         
    set(handles.txtwatermark,'String','File gambar!');    
    return                                                              
end
global key_d                                                            
global type                                                             
st='';                                                                  
if key_d==0                                                             
    if type==0
        st=dewatermark_k(imread(img));                                  
    else
        img_logo=dewatermark_img(imread(img));                          
    end
else                                                                    
    if type==0
        st=dewatermark_k(imread(img),str2num(get(handles.edit2,'String')));             
    else
        img_logo=dewatermark_img(imread(img),str2num(get(handles.edit2,'String')));     
    end
end

if type==1
    figure
    imshow(img_logo)
    title('Watermark')
    set(handles.txtwatermark,'String','Watermark: Image!');
else
    set(handles.txtwatermark,'String',st);                                        
end

function txtwatermark_Callback(hObject, eventdata, handles)

function txtwatermark_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function checkbox1_Callback(hObject, eventdata, handles)

global key_d
key_d=1-key_d;                     

function radiobutton1_Callback(hObject, eventdata, handles)

global type
type=0;         


function radiobutton2_Callback(hObject, eventdata, handles)

global type
type=1;         

function figure1_CloseRequestFcn(hObject, eventdata, handles)

clear global key_d                                 
clear global type 

delete(hObject);
