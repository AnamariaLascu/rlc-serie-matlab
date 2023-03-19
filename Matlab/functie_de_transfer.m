clear all;
close all;

w= logspace(log10(0.00001),log10(100000),1000);
g=j*w;
V=10;
C=0.14;
R=10;
L=6;

H=V ./sqrt(R*R+(w*L-1./(w*C)).^2);
wo=1/sqrt(L*C)
Q1=wo*L/R
Q2=1/(wo*C*R)
B=R/L
w1=wo-(B/2)
w2=wo+(B/2)

figure();
semilogx(w,abs(H),'LineWidth',3)
xlabel('Frecventa (omega)','FontSize',15)
ylabel('Functia de transfer,|H(s)|','FontSize',15)
set(gca,'FontSize',15);
grid on;

uicontrol('Style','pushbutton',... 
 'Units','normalized',...
 'Position',[0.03 0.02 0.08 .05],...
 'string','Inapoi',...
 'Callback','close; rlcserie_interfata(R,L,C)');

