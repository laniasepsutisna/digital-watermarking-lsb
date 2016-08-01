function varargout = about(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @about_OpeningFcn, ...
                   'gui_OutputFcn',  @about_OutputFcn, ...
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

function about_OpeningFcn(hObject, eventdata, handles, varargin)

	handles.output = hObject;

	guidata(hObject, handles);
	img=imread('software.png');    
	axes(handles.logo)         
	imshow(img) 

function varargout = about_OutputFcn(hObject, eventdata, handles) 

	varargout{1} = handles.output;

function logo_CreateFcn(hObject, eventdata, handles)
