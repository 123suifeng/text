
function varargout = ForceGUI(varargin)
% FORCEGUI MATLAB code for ForceGUI.fig
%      FORCEGUI, by itself, creates a new FORCEGUI or raises the existing
%      singleton*.
%
%      H = FORCEGUI returns the handle to a new FORCEGUI or the handle to
%      the existing singleton*.
%
%      FORCEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORCEGUI.M with the given input arguments.
%
%      FORCEGUI('Property','Value',...) creates a new FORCEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ForceGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ForceGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ForceGUI

% Last Modified by GUIDE v2.5 04-Mar-2017 22:46:18

% Begin initialization code - DO NOT EDIT

%{
h0=figure('menubar','none','toolbar','none','name','ForceGUI');
h1=uimenu(h0,'label','draw');
h11=uimenu(h1,'label','Membrane','callback','membrane');
h12=uimenu(h1,'label','Membrane','callback','membrane');
%}

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ForceGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ForceGUI_OutputFcn, ...
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


% --- Executes just before ForceGUI is made visible.
function ForceGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ForceGUI (see VARARGIN)

% Choose default command line output for ForceGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global ppp;
ppp=1;
global F1;
F1=0;
global F2;
F2=0;
global F3;
F3=0;
global F4;
F4=0;
global F5;
F5=0;
global F6;
F6=0;
global F7;
F7=0;
global F8;
F8=0;
global F9;
F9=0;
global F10;
F10=0;
global RF;
RF=0;
global L;
L=0;
global Thruster_Number;
Thruster_Number=0;
global row;
row=0;
global Column;
Column=0;

global statu;
global statu2;
statu=zeros(100,100);
statu2=zeros(100,100);


global position2;
global position3a;
global position3b;
global position2a;

position2=zeros(2,2);
position3a=zeros(3,2);
position3b=zeros(3,2);
position2a=zeros(2,2);

global data
data=0;

global n2;
global n3;
n2=0;
n3=0;
global realn2;
global realn3;

realn2=0;
realn3=0;
   
%set(handles.edit1,'selected','on');
% UIWAIT makes ForceGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = ForceGUI_OutputFcn(hObject, eventdata, handles) 
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

set(findobj('style','edit'),'string','')
       axes(handles.axes1)
       cla reset
        axes(handles.axes2)
       cla reset
        axes(handles.axes3)
       cla reset
        axes(handles.axes4)
       cla reset
        axes(handles.axes5)
       cla reset
        axes(handles.axes6)
       cla reset
        axes(handles.axes7)
       cla reset
        axes(handles.axes8)
       cla reset
       cla reset
        axes(handles.axes9)
       cla reset
        axes(handles.axes10)
       cla reset
 
%set(findobj('style','text'),'string','')

%set(handles.text2,'Micro Thruster Array Analysis');
%{
set(handles.text19,'String','X');
set(handles.text20,'String','Y');
set(handles.text22,'String','X');
set(handles.text23,'String','Y');

set(handles.text12,'String','Density');
set(handles.text13,'String','Accuracy');
set(handles.text14,'String','Controllable Range');
set(handles.text18,'String','Continuity of the Envelope Surface');
set(handles.text21,'String','Homogeneity of the Combination Scheme');

set(handles.text8,'String','Figure F-Mx');
set(handles.text9,'String','Figure F-My');
set(handles.text10,'String','Position');
set(handles.text28,'String','Input');
set(handles.text21,'String','Homogeneity of the Combination Scheme');

set(handles.text6,'String','Row');
set(handles.text7,'String','Column');
set(handles.text29,'String','F');
set(handles.text30,'String','L');

set(handles.text25,'String','F');
set(handles.text26,'String','Mx');
set(handles.text27,'String','My');

set(handles.text15,'String','F');
set(handles.text16,'String','Mx');
set(handles.text17,'String','My');

set(handles.text41,'String','[');
set(handles.text42,'String','[');
set(handles.text43,'String','[');

set(handles.text44,'String',']');
set(handles.text45,'String',']');
set(handles.text46,'String',']');

set(handles.text47,'String',',');
set(handles.text48,'String',',');
set(handles.text49,'String',',');

%}


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global row;
global column;

aa = get(handles.edit21,'String');
row = str2num(aa);

bb = get(handles.edit22,'String');
column=str2num(bb);

row=column;

global RF;
cc = get(handles.edit23,'String');%F
RF=str2num(cc);

dd = get(handles.edit24,'String');%l
L=str2num(dd);

global Thruster_Number;
Thruster_Number=row*column;

set(handles.text36,'String',Thruster_Number);%F


a=-column/2-0.5;
b=row/2+0.5;
c=0;
g=Thruster_Number;
axis tight;
Array= zeros(g,3);

h=1:1:g;
 
for i=1:1:row     
        b=b-1;
    for j=1:1:column
              a=a+1;
           if a>column/2
               a=-column/2+0.5;
           end
            c=c+1;
           Array(c,2) = a;
           Array(c,3) = b;

  axes(handles.axes11); 
 plot(handles.axes11,a,b,'ro','MarkerFaceColor','r');
 grid on;
 hold on;
       
    end
end

xlabel('X');ylabel('Y');



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global F1;
global F2;
global F3;
global F4;
global F5;
global F6;
global F7;
global F8;
global F9;
global F10;
global RF;
global Thruster_Number;
global Number;
global ppp;
global row;
global column;
global statu;
global statu2;
%set(handle_axes1,'xtick',[],'ytick',[],'xticklabel',[],'yticklable',[]);
 
Flag_Number=0;
n2=(column*row-1)/8;
n3=(column*row-1)/4;

            a=-column/2-0.5;
            b=row/2+0.5;
            c=0;
            g=Thruster_Number;
            axis tight;
            Array= zeros(g,3);
            h=1:1:g;


ff=0;

dd=0;

data2=0;
data3=0;
                
global position2;
global position3a;
global position3b;
global position2a;

global n2;
global n3;
global realn2;
global realn3;
global data;


n2=(column*row-1)/8;
n3=(column*row-1)/4;


sn2=realn2+realn3*3;
sn3=realn3*2;

Solution=cell((n2+n3),1);
Solution2=cell((n3*3/2),1);

position3a(1,1)=0;
position3a(1,2)=(row-1)/2;
position3a(2,1)=(row-1)/2;
position3a(2,2)=0;
position3a(3,1)=-(row-1)/2;
position3a(3,2)=-(row-1)/2;

position3b(1,1)=0;
position3b(1,2)=-(row-1)/2;
position3b(2,1)=-(row-1)/2;
position3b(2,2)=0;
position3b(3,1)=(row-1)/2;
position3b(3,2)=(row-1)/2;

position2(1,1)=-(row-1)/2;
position2(1,2)=(row-1)/2;
position2(2,1)=(row-1)/2;
position2(2,2)=-(row-1)/2;

k=(row-1)/2;
p=0;

for i =1 : n3
    
   t=mod(p,k);
    if mod(i,2) == 1

Solution(i,1)={position3a};
p=p+1;

 if mod(p,k)==0
        k=k-1;
        t=0;
        p=0;
 else
     t=mod(p,k);
 end
        
position3a(1,1)=0+t;
position3a(1,2)=k;
position3a(2,1)=k-t;
position3a(2,2)=0-t;
position3a(3,1)=-k;
position3a(3,2)=-k+t;
        
    else 
Solution(i,1)={position3b}  ;

position3b(1,1)=-position3a(1,1);
position3b(1,2)=-position3a(1,2);
position3b(2,1)=-position3a(2,1);
position3b(2,2)=-position3a(2,2);
position3b(3,1)=-position3a(3,1);
position3b(3,2)=-position3a(3,2);
      
    end        
 end

j=0;
q=0;
k=(row-1)/2;

for i =(n3+1) : (n2+n3)
Solution(i,1)={position2};
q=q+1;

t=mod(q,k);

if t==0
    k=k-1;
    j=j+1;
    q=0;
end

position2(1,1)=-(row-1)/2+t;
position2(1,2)=(row-1)/2-j;

position2(2,1)=-position2(1,1);
position2(2,2)=-position2(1,2);

end

w=1;
yy=1;
u=0;
r=0;
for i=1:(n3*3/2)
    
    d=mod(i,3*yy);
   A = Solution{(n3+1-w*2),1};
   
      if d==0
            w=w+1;            
      end

   switch d
       case 1
           position2a(1,1)= A(3,1);
           position2a(1,2)= A(3,2);
           position2a(2,1)= -A(3,1);
           position2a(2,2)= -A(3,2);
           
           Solution2(i,1)= {position2a};
           
       case 2
           position2a(1,1)= A(2,1);
           position2a(1,2)= A(2,2);
           position2a(2,1)= -A(2,1);
           position2a(2,2)= -A(2,2);
           
           Solution2(i,1)= {position2a};
           
       otherwise
           position2a(1,1)= A(1,1);
           position2a(1,2)= A(1,2);
           position2a(2,1)= -A(1,1);
           position2a(2,2)= -A(1,2);
           
           Solution2(i,1)= {position2a};
   end
     
end
   
flag=0;

            FL=0;         
switch ppp
    case 1
        Flag_Number=1;
      aaa= get(handles.edit1,'String');
      F1 = str2num(aaa);
      Number=round(F1/RF);
      axis tight;

      Thruster_Number=Thruster_Number-Number;
      set(handles.text26,'String',Number);
      set(handles.text36,'String',Thruster_Number);

             for i=1:1:row     
                    b=b-1;
                for j=1:1:column
                          a=a+1;
                       if a>column/2
                           a=-column/2+0.5;
                       end
                        c=c+1;
                       Array(c,2) = a;
                       Array(c,3) = b;

             axes(handles.axes1); 
             plot(handles.axes1,a,b,'ro','MarkerFaceColor','r');
             %axes(handles.axes11); 
             %plot(handles.axes11,a,b,'ro','MarkerFaceColor','r');%%%%%%
             grid on;
             hold on;

                end
             end
            
             bbb = mod(F1,6);
             ccc = fix(F1/6);
             
              switch bbb
                    case 1
                        e=0;
                        d=0;
                        flag=1;
                    case 2
                        d=1;
                        e=0;
                    case 3
                        d=0;
                        e=1;
                    case 4
                        d=2;%
                        e=0;
                    case 5
                        e=1;
                        d=1;
                    otherwise
                        d=0;
                        e=0;
              end
              
                    if flag==1
                       ccc=ccc-1;
                       e=e+1;
                       d=d+2;
                       flag = 0;
                    end
    
            if ccc*3<n2
               if ccc>0
                
                for i =1 : (ccc*3)
                                    A=Solution{n3+i,1};
                                    [m,n]=size(A);
                                    
                                    r=A(1,1)+(row+1)/2;
                                    u=-A(1,2)+(row+1)/2;
                                    
                                    axes(handles.axes1); 
                                    plot(handles.axes1,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                    axes(handles.axes11); 
                                    plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                    
                                    statu(u,r)=1;
                                    statu2(u,r)=1;

                                    r=A(2,1)+(row+1)/2;
                                    u=-A(2,2)+(row+1)/2;
                                    statu(u,r)=1;
                                    statu2(u,r)=1;
                                         
                                    axes(handles.axes1); 
                                    plot(handles.axes1,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                    axes(handles.axes11); 
                                    plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                  end
              
                              if e~=0
                                for i =1 : e
                                    A=Solution{i,1};
                                    [m,n]=size(A);

                                    r=A(1,1)+(row+1)/2;
                                    u=-A(1,2)+(row+1)/2;
                                    axes(handles.axes1); 
                                    plot(handles.axes1,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                    axes(handles.axes11); 
                                    plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                    statu(u,r)=1;
                                    statu2(u,r)=1;

                                    r=A(2,1)+(row+1)/2;
                                    u=-A(2,2)+(row+1)/2;
                                    statu(u,r)=1;
                                    statu2(u,r)=1;
                                    axes(handles.axes1); 
                                    plot(handles.axes1,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                    axes(handles.axes11); 
                                    plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');

                                    r=A(3,1)+(row+1)/2;
                                    u=-A(3,2)+(row+1)/2;
                                    statu(u,r)=1;
                                    statu2(u,r)=1;
                                    axes(handles.axes1); 
                                    plot(handles.axes1,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                    axes(handles.axes11); 
                                    plot(handles.axes11,A(3,1),A(3,2),'ro','MarkerFaceColor','k');

                                end

                                        if d~=0

                                        for i =1 : d
                                                A = Solution{(n3+ccc*3+i),1};
                                                [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                    axes(handles.axes1); 
                                    plot(handles.axes1,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                    axes(handles.axes11); 
                                    plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                               statu(u,r)=1;
                                               statu2(u,r)=1;
                                    axes(handles.axes1); 
                                    plot(handles.axes1,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                    axes(handles.axes11); 
                                    plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                               
                                        end
                                        
                                        end

                              else

                                        if d~=0
                                            if (ccc*3+d)>n2
                                                            for i =1 : n2
                                                             A=Solution{n3+i,1};
                                                            [m,n]=size(A);

                                                            r=A(1,1)+(row+1)/2;
                                                            u=-A(1,2)+(row+1)/2;
                                                            statu(u,r)=1;
                                                            statu2(u,r)=1;
                                                            axes(handles.axes1); 
                                                            plot(handles.axes1,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                            axes(handles.axes11); 
                                                            plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');

                                                            r=A(2,1)+(row+1)/2;
                                                            u=-A(2,2)+(row+1)/2;
                                                            axes(handles.axes1); 
                                                            plot(handles.axes1,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                            axes(handles.axes11); 
                                                            plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                            statu(u,r)=1;
                                                            statu2(u,r)=1;

                                                            end

                                                       
                                                        dd=dd+1;
                                                        dt=mod(dd,3);
                                                      

                                                        for i =1 : (d-n2)

                                                            D = Solution2{data+i,1};

                                                            r=D(1,1)+(row+1)/2
                                                            u=-D(1,2)+(row+1)/2
                                                            statu(u,r)=1;
                                                            statu2(u,r)=1;
                                                            axes(handles.axes1); 
                                                            plot(handles.axes1,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                            axes(handles.axes11); 
                                                            plot(handles.axes11,D(2,1),D(2,2),'ro','MarkerFaceColor','k');

                                                            r=-D(1,1)+(row+1)/2;
                                                            u=D(1,2)+(row+1)/2;
                                                            statu(u,r)=1;
                                                            statu2(u,r)=1;
                                                             axes(handles.axes1); 
                                                             plot(handles.axes1,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                             axes(handles.axes11); 
                                                             plot(handles.axes11,D(2,1),D(2,2),'ro','MarkerFaceColor','k');

                                                        end
                                                        data=data+d;
               
                                            else

                                                    for i =1 : d
                                                     
                                                 A=Solution{(n3+ccc*3+i),1};
                                                [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                axes(handles.axes1); 
                                                plot(handles.axes1,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                axes(handles.axes11); 
                                                plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                               statu(u,r)=1;
                                               statu2(u,r)=1;
                                               axes(handles.axes1); 
                                               plot(handles.axes1,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                               axes(handles.axes11); 
                                               plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                    end
                                                    
                                            end
                                            
                                        end
                              end

                              realn2=n2-ccc*3-d;
                              realn3=n3-e;
                             
               else
             
                             if e~=0
                                for i =1 : e
                                    A=Solution{i,1};
                                    [m,n]=size(A);

                                    r=A(1,1)+(row+1)/2;
                                    u=-A(1,2)+(row+1)/2;
                                    axes(handles.axes1); 
                                    plot(handles.axes1,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                    axes(handles.axes11); 
                                    plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                    statu(u,r)=1;
                                    statu2(u,r)=1;

                                    r=A(2,1)+(row+1)/2;
                                    u=-A(2,2)+(row+1)/2;
                                    statu(u,r)=1;
                                    statu2(u,r)=1;
             
                                     axes(handles.axes1); 
                                 
                                    plot(handles.axes1,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                    axes(handles.axes11); 
                                    plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');

                                    r=A(3,1)+(row+1)/2;
                                    u=-A(3,2)+(row+1)/2;
                                    statu(u,r)=1;
                                    statu2(u,r)=1;
                                                              

                                         axes(handles.axes1); 
                                         plot(handles.axes1,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                    axes(handles.axes11); 
                                    plot(handles.axes11,A(3,1),A(3,2),'ro','MarkerFaceColor','k');

                                end

                                        if d~=0

                                           for i =1 : d
                                                A = Solution{(n3+ccc*3+i),1};
                                                [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                               axes(handles.axes1); 
                                    plot(handles.axes1,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                    axes(handles.axes11); 
                                    plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                               statu(u,r)=1;
                                               statu2(u,r)=1;
                                              axes(handles.axes1); 
                                    plot(handles.axes1,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                    axes(handles.axes11); 
                                    plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                               
                                        end
                                        end

                              else
                                        if d~=0
                                            if (ccc*3+d)>n2
                                                            for i =1 : n2
                                                             A=Solution{n3+i,1};
                                                            [m,n]=size(A);

                                                            r=A(1,1)+(row+1)/2;
                                                            u=-A(1,2)+(row+1)/2;
                                                            statu(u,r)=1;
                                                            statu2(u,r)=1;
                                                             axes(handles.axes1); 
                                                            plot(handles.axes1,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                            axes(handles.axes11); 
                                    plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');

                                                            r=A(2,1)+(row+1)/2;
                                                            u=-A(2,2)+(row+1)/2;
                                                             axes(handles.axes1); 
                                                            plot(handles.axes1,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                              axes(handles.axes11); 
                                                              plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                            statu(u,r)=1;
                                                            statu2(u,r)=1;

                                                            end

                                                        dd=dd+1;
                                                        dt=mod(dd,3);
                                                      
                                                        for i =1 : (d-n2)

                                                            D = Solution2{data+i,1};

                                                            r=D(1,1)+(row+1)/2
                                                            u=-D(1,2)+(row+1)/2
                                                            statu(u,r)=1;
                                                            statu2(u,r)=1;
                                                            axes(handles.axes1); 
                                                             plot(handles.axes1,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                axes(handles.axes11); 
                                                              plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');

                                                            r=-D(1,1)+(row+1)/2;
                                                            u=D(1,2)+(row+1)/2;
                                                            statu(u,r)=1;
                                                            statu2(u,r)=1;
                                                            axes(handles.axes1); 
                                                             plot(handles.axes1,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                axes(handles.axes11); 
                                                              plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');

                                                        end
                                                        data=data+d;
                                      
                                                %%%%%%%%%%%
                                            else
                                                    for i =1 : d
                                                     
                                                 A=Solution{(n3+ccc*3+i),1};
                                                [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                 axes(handles.axes1); 
                                               plot(handles.axes1,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                               axes(handles.axes11); 
                                              plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                               statu(u,r)=1;
                                               statu2(u,r)=1;
                                               axes(handles.axes1); 
                                               plot(handles.axes1,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                               axes(handles.axes11); 
                                               plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                    end                       
                                            end      
                                        end
                              end

                              realn2=n2-ccc*3-d;
                              realn3=n3-e;    
               end
               
            else

                                for i =1 : n2
                                                 A=Solution{n3+i,1};
                                                [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                axes(handles.axes1); 
                                                 plot(handles.axes1,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                 axes(handles.axes11); 
                                               plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                axes(handles.axes1); 
                                                 plot(handles.axes1,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                 axes(handles.axes11); 
                                               plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                end
            
                            F1=F1-2*n2;
                            bbb = mod(F1,6);
                            ccc = fix(F1/6);
 
                            flag = 0;
                
                            switch bbb
                                case 1
                                    flag=1;
                                    e=0;
                                    d=0;
                                case 2
                                    d=1;
                                    e=0;
                                case 3
                                    d=0;
                                    e=1;
                                case 4
                                    d=2;
                                    e=0;
                                case 5
                                    e=1;
                                    d=1;
                                otherwise
                                    d=0;
                                    e=0;
                            end

                            if flag==1
                               ccc=ccc-1;
                               e=e+1;
                               d=d+2;
                               flag = 0;
                            end

               if ccc>0
                            for i =1 : (ccc*2)

                                                 A=Solution{i,1};
                                                [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                axes(handles.axes1); 
                                                 plot(handles.axes1,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                  axes(handles.axes11); 
                                               plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                 axes(handles.axes1); 
                                                 plot(handles.axes1,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                  axes(handles.axes11); 
                                               plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');

                                                r=A(3,1)+(row+1)/2;
                                                u=-A(3,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                 axes(handles.axes1); 
                                                 plot(handles.axes1,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                  axes(handles.axes11); 
                                               plot(handles.axes11,A(3,1),A(3,2),'ro','MarkerFaceColor','k');

                            end

                            if e~=0
                                for i =1 : e
                                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                     A=Solution{(i+ccc*2),1};
                                                    [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                 axes(handles.axes1); 
                                                 plot(handles.axes1,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                  axes(handles.axes11); 
                                               plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                 axes(handles.axes1); 
                                                 plot(handles.axes1,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                  axes(handles.axes11); 
                                               plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');

                                                r=A(3,1)+(row+1)/2;
                                                u=-A(3,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                 axes(handles.axes1); 
                                                 plot(handles.axes1,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                  axes(handles.axes11); 
                                               plot(handles.axes11,A(3,1),A(3,2),'ro','MarkerFaceColor','k');

                                end

                                        if d~=0
                                            dd=dd+1;
                                            dt=mod(dd,3);

                                            for i =1 : d

                                                D = Solution2{data+i,1};

                                                r=D(1,1)+(row+1)/2;
                                                u=-D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                axes(handles.axes1); 
                                                 plot(handles.axes1,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                  axes(handles.axes11); 
                                               plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
       
                                                r=-D(1,1)+(row+1)/2;
                                                u=D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                axes(handles.axes1); 
                                                 plot(handles.axes1,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                  axes(handles.axes11); 
                                               plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                        
                                            end
                                            data=data+d;

                                        end

                            else
                                        if d~=0
                                                    for i =1 : d
                                                      D = Solution2{data+i,1};
                                                r=D(1,1)+(row+1)/2;
                                                u=-D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                axes(handles.axes1); 
                                                 plot(handles.axes1,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                 axes(handles.axes11); 
                                               plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');

                                                r=D(2,1)+(row+1)/2;
                                                u=-D(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                axes(handles.axes1); 
                                                 plot(handles.axes1,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                 axes(handles.axes11); 
                                               plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');

                                              end
                                        end
                            end

                      
                              
                            if d==0
                                                
                                realn2=0;
                                realn3=n3-ccc*2-e;
                            else
                               
                                realn2=0;
                                realn3=n3-ccc*2-e-2;
                            end
               end
            
            end
            
    case 2
        Flag_Number=2;
      a= get(handles.edit2,'String');
      F2 = str2num(a);
        Number=round(F2/RF);  
      axis tight;
      Thruster_Number=Thruster_Number-Number;
      set(handles.text27,'String',Number);
      set(handles.text36,'String',Thruster_Number);
      
           for i=1:1:row     
                    b=b-1;
                for j=1:1:column
                          a=a+1;
                       if a>column/2
                           a=-column/2+0.5;
                       end
                        c=c+1;
                       Array(c,2) = a;
                       Array(c,3) = b;

              axes(handles.axes2); 
             plot(handles.axes2,a,b,'ro','MarkerFaceColor','r');
             grid on;
             hold on;

                end
           end
              FL=F2;
      
     case 3
         Flag_Number=3;
         a= get(handles.edit3,'String');
         F3 = str2num(a);
         Number=round(F3/RF);  
      axis tight;
      Thruster_Number=Thruster_Number-Number;
      set(handles.text28,'String',Number);
      set(handles.text36,'String',Thruster_Number);
      
       for i=1:1:row     
                    b=b-1;
                for j=1:1:column
                          a=a+1;
                       if a>column/2
                           a=-column/2+0.5;
                       end
                        c=c+1;
                       Array(c,2) = a;
                       Array(c,3) = b;

              axes(handles.axes3); 
             plot(handles.axes3,a,b,'ro','MarkerFaceColor','r');
             grid on;
             hold on;

                end
       end
         FL=F3;
            
        
     case 4
         Flag_Number=4;
      a= get(handles.edit4,'String');
      F4 = str2num(a);
      Number=round(F4/RF);  
      
      Thruster_Number=Thruster_Number-Number;
      set(handles.text29,'String',Number);
      set(handles.text36,'String',Thruster_Number);  
      
       for i=1:1:row     
                    b=b-1;
                for j=1:1:column
                          a=a+1;
                       if a>column/2
                           a=-column/2+0.5;
                       end
                        c=c+1;
                       Array(c,2) = a;
                       Array(c,3) = b;

              axes(handles.axes4); 
             plot(handles.axes4,a,b,'ro','MarkerFaceColor','r');
             grid on;
             hold on;

                end
       end
         FL=F4;
            
        
     case 5
         Flag_Number=5;
         a= get(handles.edit5,'String');
         F5 = str2num(a);
      Number=round(F5/RF);  
      
      Thruster_Number=Thruster_Number-Number;
      set(handles.text30,'String',Number);
      set(handles.text36,'String',Thruster_Number);  
      
       for i=1:1:row     
                    b=b-1;
                for j=1:1:column
                          a=a+1;
                       if a>column/2
                           a=-column/2+0.5;
                       end
                        c=c+1;
                       Array(c,2) = a;
                       Array(c,3) = b;

              axes(handles.axes5); 
             plot(handles.axes5,a,b,'ro','MarkerFaceColor','r');
             grid on;
             hold on;

                end
       end
         FL=F5;
              
     case 6
         Flag_Number=6;
         a= get(handles.edit6,'String');
         F6 = str2num(a);
      Number=round(F6/RF);  
      
      Thruster_Number=Thruster_Number-Number;
      set(handles.text31,'String',Number);
      set(handles.text36,'String',Thruster_Number);  
      
       for i=1:1:row     
                    b=b-1;
                for j=1:1:column
                          a=a+1;
                       if a>column/2
                           a=-column/2+0.5;
                       end
                        c=c+1;
                       Array(c,2) = a;
                       Array(c,3) = b;

              axes(handles.axes6); 
             plot(handles.axes6,a,b,'ro','MarkerFaceColor','r');
             grid on;
             hold on;

                end
       end
         FL=F6;
              
     case 7
         Flag_Number=7;
         a= get(handles.edit7,'String');
         F7 = str2num(a);

      Number=round(F7/RF);  
      
      Thruster_Number=Thruster_Number-Number;
      set(handles.text32,'String',Number);
      set(handles.text36,'String',Thruster_Number);  
      
       for i=1:1:row     
                    b=b-1;
                for j=1:1:column
                          a=a+1;
                       if a>column/2
                           a=-column/2+0.5;
                       end
                        c=c+1;
                       Array(c,2) = a;
                       Array(c,3) = b;

              axes(handles.axes7); 
             plot(handles.axes7,a,b,'ro','MarkerFaceColor','r');
             grid on;
             hold on;

                end
       end
       
         FL=F7;
                  
     case 8
         Flag_Number=8;
         a= get(handles.edit8,'String');
         F8 = str2num(a);

      Number=round(F8/RF);  
      
      Thruster_Number=Thruster_Number-Number;
      set(handles.text33,'String',Number);
      set(handles.text36,'String',Thruster_Number);  
      
       for i=1:1:row     
                    b=b-1;
                for j=1:1:column
                          a=a+1;
                       if a>column/2
                           a=-column/2+0.5;
                       end
                        c=c+1;
                       Array(c,2) = a;
                       Array(c,3) = b;

              axes(handles.axes8); 
             plot(handles.axes8,a,b,'ro','MarkerFaceColor','r');
             grid on;
             hold on;

                end
       end
              FL=F8;
              
     case 9
         Flag_Number=9;
         a= get(handles.edit9,'String');
         F9 = str2num(a);

      Number=round(F9/RF);  
      
      Thruster_Number=Thruster_Number-Number;
      set(handles.text34,'String',Number);
      set(handles.text36,'String',Thruster_Number);  
      
       for i=1:1:row     
                    b=b-1;
                for j=1:1:column
                          a=a+1;
                       if a>column/2
                           a=-column/2+0.5;
                       end
                        c=c+1;
                       Array(c,2) = a;
                       Array(c,3) = b;

              axes(handles.axes9); 
             plot(handles.axes9,a,b,'ro','MarkerFaceColor','r');
             grid on;
             hold on;

                end
       end
              FL=F9;
            
    otherwise
        Flag_Number=10;
        aaa= get(handles.edit10,'String');
        F10 = str2num(aaa);
        Number=round(F10/RF);
axis tight;
      Thruster_Number=Thruster_Number-Number;
      set(handles.text35,'String',Number);
      set(handles.text36,'String',Thruster_Number);
      
       for i=1:1:row     
                    b=b-1;
                for j=1:1:column
                          a=a+1;
                       if a>column/2
                           a=-column/2+0.5;
                       end
                        c=c+1;
                       Array(c,2) = a;
                       Array(c,3) = b;

              axes(handles.axes10); 
             plot(handles.axes10,a,b,'ro','MarkerFaceColor','r');
             grid on;
             hold on;

                end
       end
            
               FL=F10;             
end

if Flag_Number ~= 1
    
b = mod(FL,6);
c = fix(FL/6);

if realn2~=0 
  %realn2
                dd=0;
                data2=0;
                data3=0;

                flag = 0;
                switch b
                    case 1
                        flag=1;
                        e=0;
                        d=0;
                    case 2
                        d=1;
                        e=0;
                    case 3
                        d=0;
                        e=1;
                    case 4
                        d=2;
                        e=0;
                    case 5
                        e=1;
                        d=1;
                    otherwise
                        d=0;
                        e=0;
                end

                if flag==1
                   c=c-1;
                   e=e+1;
                   d=d+2;
                   flag = 0;
                end

          
           if c*3<realn2

               if c==0
              
                  if e~=0

                                for i = (n3-realn3+1) : (n3-realn3+e)
                                                     A=Solution{i,1};
                                                    [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                                plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                   switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                                plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');

                                                  r=A(3,1)+(row+1)/2;
                                                u=-A(3,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                   switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                                plot(handles.axes11,A(3,1),A(3,2),'ro','MarkerFaceColor','k');

                                     end

                                        if d~=0

                                        for i = (n2-realn2+c*3+1) : (n2-realn2+c*3+d)
                                                            A = Solution{(n3+i),1};
                                                            [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                               switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                                 plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                               statu(u,r)=1;
                                               statu2(u,r)=1;
                                                 switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                end
                                                axes(handles.axes11); 
                                               plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                           end
                                        end

                              else

                                        if d~=0
                                            realn2=realn2-1;
                                           
                                                    for i =(n2-realn2+c*3+1) : (n2-realn2+c*3+d)

                                                                        A=Solution{(n3+i),1};
                                                                        [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                 switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                                  plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                
                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                 switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                              plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');

                                                   end
                                        end
                              end 
               else
                   
                for i =(n2-realn2+1) : (n2-realn2+c*3)

                                    A=Solution{n3+i,1};
                                    [m,n]=size(A);

                                    r=A(1,1)+(row+1)/2;
                                    u=-A(1,2)+(row+1)/2;
                                    statu(u,r)=1;
                                    statu2(u,r)=1;
                                     switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                end
                                    axes(handles.axes11); 
                                    plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');

                                    r=A(2,1)+(row+1)/2;
                                    u=-A(2,2)+(row+1)/2;
                                    statu(u,r)=1;
                                    statu2(u,r)=1;
                                   switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                end
                                    axes(handles.axes11); 
                                    plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');

                end

                              if e~=0

                                for i = (n3-realn3+1) : (n3-realn3+e)
                                                     A=Solution{i,1};
                                                    [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                  switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');

                                                  r=A(3,1)+(row+1)/2;
                                                u=-A(3,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                           switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(3,1),A(3,2),'ro','MarkerFaceColor','b');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,A(3,1),A(3,2),'ro','MarkerFaceColor','k');

                                     end

                                        if d~=0

                                        for i = (n2-realn2+c*3+1) : (n2-realn2+c*3+d)
                                                            A = Solution{(n3+i),1};
                                                            [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                               switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                               statu(u,r)=1;
                                               statu2(u,r)=1;
                                     switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                end
                                                axes(handles.axes11); 
                                    plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                           end
                                        end

                              else

                                        if d~=0
                                                    for i =(n2-realn2+c*3+1) : (n2-realn2+c*3+d)

                                                                        A=Solution{(n3+i),1};
                                                                        [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                   switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                
                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                 switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');

                                                   end
                                        end
                              end

                              realn2=realn2-c*3-d;
                              realn3=realn3-e;
               end
               
                else
              
                   b = mod(FL,6);
                   c = fix(FL/6);
   %%%%%%%%
   
                            flag = 0;
                            switch b
                                case 1
                                    flag=1;
                                    e=0;
                                    d=0;
                                case 2
                                    d=1;
                                    e=0;
                                case 3
                                    d=0;
                                    e=1;
                                case 4
                                    d=2;
                                    e=0;
                                case 5
                                    e=1;
                                    d=1;
                                otherwise
                                    d=0;
                                    e=0;
                            end

                            if flag==1
                               c=c-1;
                               e=e+1;
                               d=d+2;
                               flag = 0;
                            end
                                                        
                    pp=3*c-realn2;
                    
                                               if pp~=0
                                                            
                                                          for i =1 : pp

                                                                D = Solution2{data+i,1};
                                                                r=D(1,1)+(row+1)/2;
                                                                u=-D(1,2)+(row+1)/2;
                                                                statu(u,r)=1;
                                                                statu2(u,r)=1;
                                                                switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                end
                                                                 axes(handles.axes11); 
                                    plot(handles.axes11,D(1,1),D(1,2),'ro','MarkerFaceColor','k');

                                                                r=-D(1,1)+(row+1)/2;
                                                                u=D(1,2)+(row+1)/2;
                                                                statu(u,r)=1;
                                                                statu2(u,r)=1;
                                                                 
                                                              
                                                                
                                                                switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                end
                                                                 axes(handles.axes11); 
                                    plot(handles.axes11,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                
                                                          end     
                                                              
                                                          
                                                         
                                                          data=data+pp;
                                             end
                                                        
                                for i = (n2-realn2+1) : n2
 
                                                 A=Solution{n3+i,1};
                                                [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                             switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                end
                             
                            if e~=0
                                for i =(n3-realn3+1) : (n3-realn3+e)
                                                     A=Solution{i,1};
                                                    [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                             switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                 switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');

                                                r=A(3,1)+(row+1)/2;
                                                u=-A(3,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                 switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,A(3,1),A(3,2),'ro','MarkerFaceColor','k');


                                end
                                        if d~=0
                                              data=data+pp;
                                                      
                                            if (mod(data,3)+d-3)<0
                                                ff=1;
                                            else
                                                ff=0;
                                            end
                                            
                                            for i =(data+1) : (data+d)
 
                                                D = Solution2{data+i,1};

                                                r=D(1,1)+(row+1)/2;
                                                u=-D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
        
                                                r=-D(1,1)+(row+1)/2;
                                                u=D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
               
                                            end
                                            data=data+d ;                                                                
                                        end
                                                                              
                            else
                                                            
                                        if d~=0

                                             if (mod(data,3)+d-3)<0
                                                ff=1;
                                            else
                                                ff=0;
                                             end
                                                    for i =(1+data) : (data+d)
                                                      
                                                D = Solution2{data+i,1};
                                                     
                                                r=D(1,1)+(row+1)/2;
                                                u=-D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                              switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,D(1,1),D(1,2),'ro','MarkerFaceColor','k');

                                                r=D(2,1)+(row+1)/2;
                                                u=-D(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,D(2,1),D(2,2),'ro','MarkerFaceColor','k');

                                                    end
                                                    
                                                      data=data+d;
                                                      
                                        end
                            end

                        flag0 = 1;

                            if d==0
                                realn2=0;%%%%%%%%%%%%%%%
                                realn3=realn3-e;
                            else
                                realn2=0;%%%%%%%%
                                realn3=realn3-ccc*2-e-ff*2;
                            end

                   end

           else
                   
                         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      
                dd=0;
                data2=0;
                data3=0;

                flag = 0;
                switch b
                    case 1
                        flag=1;
                        e=0;
                        d=0;
                    case 2
                        d=1;
                        e=0;
                    case 3
                        d=0;
                        e=1;
                    case 4
                        d=2;
                        e=0;
                    case 5
                        e=1;
                        d=1;
                    otherwise
                        d=0;
                        e=0;
                end

                if flag==1
                   c=c-1;
                   e=e+1;
                   d=d+2;
                   flag = 0;
                end
                
                data
                jj=n3-realn3-2*ceil(data/3)+1;
 %{
          for i =(1+data) : (data+d)
                                                      
                                                D = Solution2{data+i,1};
                                                     
                                                r=D(1,1)+(row+1)/2;
                                                u=-D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                              switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,D(1,1),D(1,2),'ro','MarkerFaceColor','b');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,D(1,1),D(1,2),'ro','MarkerFaceColor','b');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,D(1,1),D(1,2),'ro','MarkerFaceColor','b');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,D(1,1),D(1,2),'ro','MarkerFaceColor','b');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,D(1,1),D(1,2),'ro','MarkerFaceColor','b');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,D(1,1),D(1,2),'ro','MarkerFaceColor','b');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,D(1,1),D(1,2),'ro','MarkerFaceColor','b');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,D(1,1),D(1,2),'ro','MarkerFaceColor','b');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,D(1,1),D(1,2),'ro','MarkerFaceColor','b');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,D(1,1),D(1,2),'ro','MarkerFaceColor','b');

                                                r=D(2,1)+(row+1)/2;
                                                u=-D(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,D(2,1),D(2,2),'ro','MarkerFaceColor','b');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,D(2,1),D(2,2),'ro','MarkerFaceColor','b');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,D(2,1),D(2,2),'ro','MarkerFaceColor','b');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,D(2,1),D(2,2),'ro','MarkerFaceColor','b');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,D(2,1),D(2,2),'ro','MarkerFaceColor','b');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,D(2,1),D(2,2),'ro','MarkerFaceColor','b');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,D(2,1),D(2,2),'ro','MarkerFaceColor','b');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,D(2,1),D(2,2),'ro','MarkerFaceColor','b');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,D(2,1),D(2,2),'ro','MarkerFaceColor','b');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,D(2,1),D(2,2),'ro','MarkerFaceColor','b');

                                                    
          end
                                                    
                                                      data=data+d;
                %}
                         
                
                      for i =(n3-realn3+1) : (n3-realn3+2*c)
                                                     A=Solution{i,1};
                                                                                                        
                                                    [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                        switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                                 plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                                 plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');

                                                r=A(3,1)+(row+1)/2;
                                                u=-A(3,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                                 plot(handles.axes11,A(3,1),A(3,2),'ro','MarkerFaceColor','k');

                                end
                
                
                
                
                        if e~=0
%%%%%%%%
                                %for i =(n3-realn3-2*ceil(data/3)+1) : (n3-realn3-2*ceil(data/3)+e)
                                            for i =(n3-realn3+1) : (n3-realn3+e)
                                                     A=Solution{(i+c*2),1};
                                                                                                        
                                                    [m,n]=size(A);

                                                r=A(1,1)+(row+1)/2;
                                                u=-A(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                        switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                                 plot(handles.axes11,A(1,1),A(1,2),'ro','MarkerFaceColor','k');

                                                r=A(2,1)+(row+1)/2;
                                                u=-A(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(1,1),A(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(2,1),A(2,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                                 plot(handles.axes11,A(2,1),A(2,2),'ro','MarkerFaceColor','k');

                                                r=A(3,1)+(row+1)/2;
                                                u=-A(3,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,A(3,1),A(3,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                                 plot(handles.axes11,A(3,1),A(3,2),'ro','MarkerFaceColor','k');

                                end

                                        if d~=0
                                            
                                            if (mod(data,3)+d-3)<0
                                                ff=1;
                                            else
                                                ff=0;
                                            end
                                            

                                            for i =1 : d
  
                                                D = Solution2{data+i,1};

                                                r=D(1,1)+(row+1)/2;
                                                u=-D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                               switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                 
                                                r=-D(1,1)+(row+1)/2;
                                                u=D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                               switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                
                                            end
                                            
                                            data=data+d;  
                                            
                                        end                                  
                            else
                                                                
                                        if d~=0
                                            
                                            if (mod(data,3)+d-3)<0
                                                ff=1;
                                            else
                                                ff=0;
                                            end
%ttt=1
                                                    for i =(data+1) : (data+d)
                                                D = Solution2{data+i,1};
                                            
                                                r=D(1,1)+(row+1)/2;
                                                u=-D(1,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                                switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,D(1,1),D(1,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,D(1,1),D(1,2),'ro','MarkerFaceColor','k');

                                                r=D(2,1)+(row+1)/2;
                                                u=-D(2,2)+(row+1)/2;
                                                statu(u,r)=1;
                                                statu2(u,r)=1;
                                             switch Flag_Number
                                                    case 2
                                                        axes(handles.axes2); 
                                                 plot(handles.axes2,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                 case 3
                                                      axes(handles.axes3); 
                                                 plot(handles.axes3,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                     case 4
                                                          axes(handles.axes4); 
                                                 plot(handles.axes4,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                         case 5
                                                              axes(handles.axes5); 
                                                 plot(handles.axes5,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                             case 6
                                                                  axes(handles.axes6); 
                                                 plot(handles.axes6,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                 case 7
                                                                      axes(handles.axes7); 
                                                 plot(handles.axes7,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                     case 8
                                                                          axes(handles.axes8); 
                                                 plot(handles.axes8,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                         case 9
                                                                              axes(handles.axes9); 
                                                 plot(handles.axes9,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                                             case 10
                                                                                  axes(handles.axes10); 
                                                 plot(handles.axes10,D(2,1),D(2,2),'ro','MarkerFaceColor','k');
                                                end
                                                 axes(handles.axes11); 
                                    plot(handles.axes11,D(2,1),D(2,2),'ro','MarkerFaceColor','k');

                                                end
                                        end
                            end

                        flag0 = 1;

                            if d==0
                                realn2=0;
                                realn3=realn3-c*2-e;
                            else
                                realn2=0;
                                realn3=realn3-c*2-e-ff*2;%
                            end
end
end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ppp;
ppp=mod((ppp+1),10);
if ppp>10
    ppp=0;
end

set(handles.text39,'String',ppp);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ppp;
ppp=mod((ppp-1),10);
if ppp<0
    ppp=0;
end

set(handles.text39,'String',ppp);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, ~, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
algorithm
