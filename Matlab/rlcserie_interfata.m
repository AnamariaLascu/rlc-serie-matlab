function rlcserie_interfata(R,L,C)

Fig=figure('Name','Conexiune RLC-Serie',...
    'Units','normalized',...
    'Position',[0.1 0.1 0.7 0.8],...
    'Color','#E0FFFF',...
    'NumberTitle','off');  

f=uimenu('Label','Documentatie');
uimenu(f,'Label','Titlu proiect','Callback','open(''Titlu proiect - web page.htm'')');
uimenu(f,'Label','Descriere proiect','Callback','open(''Descriere proiect - web page.htm'')');
uimenu(f,'Label','Ecuatii proiect','Callback','open(''Ecuatii proiect - web page.htm'')');
uimenu(f,'Label','Utilizare interfata','Callback','open(''Prezentare proiect GAC.pptx'')');
uimenu(f,'Label','Bibliografie','Callback','open(''Bibliografie - web page.htm'')');
uimenu(f,'Label','Iesire','Callback','close');

uicontrol('Style','pushbutton',... 
'Units','normalized',...
'Position',[0.1 0.51 0.08 .05],...
'string','Reset',...
'FontSize',12,...
'FontWeight','b',...
'FontAngle','i',...
'BackgroundColor', '#CC6699',...
'Callback','close;rlcserie_interfata(R,L,C)');

%%%%% Rezistenta
uicontrol('Style','Text',...
          'Units','Normalized',...
          'Position',[0.085,0.88,0.1,0.05],...
          'BackgroundColor','#3CB371',...
          'FontSize',11,...
          'FontWeight','b',...
          'String','Rezistenta R');

uicontrol('Style','Edit',...
    'Units','Normalized',...
    'Position',[0.087,0.83,0.05,0.03],...
    'FontSize',11,...
    'String',R,...
    'Callback','R=str2num(get(gco,''String''));');

uicontrol('Style','Text',...
    'Units','Normalized',...
    'Position',[0.15,0.83,0.05,0.03],...
    'BackgroundColor','#CC6699',...
    'FontSize',11,...
    'String','[Ohm]');

%%%%% Inductanta
uicontrol('Style','Text',...
    'Units','Normalized',...
    'Position',[0.085,0.77,0.1,0.05],...
    'BackgroundColor','#3CB371',...
    'FontSize',11,...
    'FontWeight','b',...
    'String','Inductanta L');

uicontrol('Style','Edit',...
    'Units','Normalized',...
    'Position',[0.09,0.73,0.05,0.03],...
    'FontSize',11,...
    'String',L,...
    'Callback','L=str2num(get(gco,''String''));');

uicontrol('Style','Text',...
    'Units','Normalized',...
    'Position',[0.15,0.73,0.03,0.03],...
    'BackgroundColor','#CC6699',...
    'FontSize',11,...
    'String','[H]');

%% Capacitatea 

uicontrol('Style','Text',...
    'Units','Normalized',...
    'Position',[0.085,0.67,0.1,0.05],...
    'BackgroundColor','#3CB371',...
    'FontSize',11,...
    'FontWeight','b',...
    'String','Capacitatea C');

uicontrol('Style','Edit',...
    'Units','Normalized',...
    'Position',[0.09,0.63,0.05,0.03],...
    'FontSize',10,...
    'String',C,...
    'Callback','C=str2num(get(gco,''String''));');

uicontrol('Style','Text',...
    'Units','Normalized',...
    'Position',[0.15,0.63,0.03,0.03],...
    'BackgroundColor','#CC6699',...
    'FontSize',10,...
    'String','[F]');

%----------------------------------------------
uicontrol('Style','pushbutton',... 
          'Units','normalized',... 
          'Position',[0.15 0.29 0.3 0.05],... 
          'FontName','Georgia',...
          'FontSize',17,...
          'foregroundcolor','black',... 
          'String','Circuit',...
          'BackgroundColor','#33CC99',...
          'Callback','close;circuit');
      
uicontrol('Style','pushbutton',... 
          'Units','normalized',... 
          'Position',[0.6 0.29 0.3 0.05],... 
          'FontName','Georgia',...
          'FontSize',17,...
          'foregroundcolor','black',... 
          'String','Filtre',...
          'BackgroundColor','#33CC99',...
          'Callback','close;filtre');

uicontrol('Style','pushbutton',... 
          'Units','normalized',... 
          'Position',[0.375 0.15 0.3 0.05],... 
          'FontName','Georgia',...
          'FontSize',17,...
          'foregroundcolor','black',... 
          'String','Functia de transfer',...
          'BackgroundColor','#33CC99',...
          'Callback','close;functie_de_transfer');
    
     
%---------------------------------------  
i0=1; % curentul la t=0
v0=1; % tensiunea pe condensator la t=0
h=0.001; % intervalul de timp
N=500; % numarul de iteratii
i=zeros(1,N);
v=zeros(1,N);
t=zeros(1,N);
i(1)=i0;
v(1)=v0;
t(1)=0;
i2(1)=i0;
v2(1)=v0;
for n=1:N
t(n+1)=n*h; % Metoda explicita a lui Euler
i(n+1)=i(n)+(-R/L*i(n)-1/L*v(n))*h;
v(n+1)=v(n)+1/C*i(n)*h; % Metoda implicita a lui Euler
i2(n+1)=L*C/(L*C+R*C*h+h^2)*i2(n)-C*h/(L*C+R*C*h+h^2)*v2(n);
v2(n+1)=(L*C+R*C*h)/(L*C+R*C*h+h^2)*v2(n)+L*h/(L*C+R*C*h+h^2)*i2(n);
end
subplot('position',[0.34 0.57 0.5 0.3]);
plot(t,i,t,i2)
axis([0 h*N 1.5*min(i) 1.5*max(i)])
legend('Metoda explicita a lui Euler', 'Metoda implicita a lui Euler')
title('Variatia curentului in circuitul RLC serie')
grid on;

