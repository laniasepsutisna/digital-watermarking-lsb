function varargout = ascii(varargin)
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @ascii_OpeningFcn, ...
                       'gui_OutputFcn',  @ascii_OutputFcn, ...
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

function ascii_OpeningFcn(hObject, eventdata, handles, varargin)

    handles.output = hObject;

    guidata(hObject, handles);
    img=imread('ascii.png');      
    axes(handles.ascii)        
    imshow(img) 
     
function varargout = ascii_OutputFcn(hObject, eventdata, handles) 
    varargout{1} = handles.output;
