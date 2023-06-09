function circuit 
y = imread('circuit.png');
subplot('position',[0.01 0.01 0.99 0.99]);
image(y);
axis off;
uicontrol('Style','pushbutton',... 
          'Units','normalized',... 
          'Position',[0.01 0.01 0.3 0.05],... 
          'FontName','Georgia',...
          'FontSize',15,...
          'foregroundcolor','black',... 
          'String','Inapoi',...
          'Callback','close;rlcserie_interfata(R,L,C)');
end