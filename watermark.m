function varargout = watermark(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @watermark_OpeningFcn, ...
                   'gui_OutputFcn',  @watermark_OutputFcn, ...
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

function watermark_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);
global key          
if isempty(key)     
key=0;              
global ext_out      
ext_out='bmp';      
global w_type       
w_type=0;           
end

function varargout = watermark_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;

function sourceimage_Callback(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function sourceimage_CreateFcn(hObject, eventdata, handles)

function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)

function edit4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtinsert_watermark_Callback(hObject, eventdata, handles)

function txtinsert_watermark_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function slider2_Callback(hObject, eventdata, handles)

function slider2_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function key_watermark_Callback(hObject, eventdata, handles)

function key_watermark_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function btn_insertwatermark_Callback(hObject, eventdata, handles)

set(handles.text_notifikasi,'String','Watermarking..');                                
img_in=get(handles.sourceimage,'String');                                          
if isempty(img_in)                                                           
    set(handles.text_notifikasi,'String','File Gambar Tidak Ditemukan!');         
    return                                                                   
end
img=imread(img_in);                                                          
st='';                                                                       
watermark=get(handles.txtinsert_watermark,'String');                                       
global key                                                                   
global ext_out                                                               
global w_type                                                                
imgw=0;                                                                      
k_plot=1;                                                                       

if key==0                                                                    
    if w_type==0                                                             
        [imgw st]=watermark_k(img,watermark);                                
    else
        [imgw st]=watermark_img(img,imread(watermark));                      
        k_plot=2;
    end
else
    if w_type==0 
        [imgw st]=watermark_k(img,watermark,str2num(get(handles.key_watermark,'String')));            
    else
        [imgw st]=watermark_img(img,imread(watermark),str2num(get(handles.key_watermark,'String')));  
        k_plot=2;
    end
end

img_out=get(handles.outputimage,'String');                                         
imwrite(imgw,[img_out '.' ext_out],ext_out);                                 
set(handles.text_notifikasi,'String',st);                                              

figure                                                                       
subplot(k_plot,2,1)                                                          
imshow(img)                                                                  
title(['Gambar Asli: "' img_in '"'])                                  
subplot(k_plot,2,2)                                                          
imshow(imgw)                                                                   
title(['Gambar Terwatermark: "' img_out '.' ext_out '"'])                   

if w_type==1                                                                 
    subplot(2,2,3)                                                           
    imshow(watermark)                                                        
    title(['Watermark: "' watermark '"'])                                    
end


function checkbox_Callback(hObject, eventdata, handles)

global key
key=1-key;                  

function rbbmp_Callback(hObject, eventdata, handles)
global ext_out
ext_out='bmp';      
        
function rbpng_Callback(hObject, eventdata, handles)
global ext_out
ext_out='png';              

function rbtiff_Callback(hObject, eventdata, handles)

global ext_out
ext_out='tiff';             

function rbtext_Callback(hObject, eventdata, handles)

global w_type
w_type=0;     

function rbimage_Callback(hObject, eventdata, handles)

global w_type
w_type=1;     


function figure1_CloseRequestFcn(hObject, eventdata, handles)
   

clear global key
clear global ext_out
clear global w_type

delete(hObject);

function btn_insertwatermark_CreateFcn(hObject, eventdata, handles)

function rbtext_CreateFcn(hObject, eventdata, handles)

function rbimage_CreateFcn(hObject, eventdata, handles)

function close_Callback(hObject, eventdata, handles)
close;

function outputimage_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function rbpng_CreateFcn(hObject, eventdata, handles)

function outputimage_Callback(hObject, eventdata, handles)
