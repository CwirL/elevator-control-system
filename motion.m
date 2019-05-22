global ax19
ax19 = handles.axes19;
cla(ax19);
axes(ax19);
t = 0:0.01:30;
for i=1:length(tResponse)
   hold on
   plot(t(i),tResponse(i), 'b*')
   pause(0.0001)
end
ffb = tResponse;
tResponse = tResponse/max(tResponse);

axes(handles.axes17)
yourImage = imread('Ascensor1.jpg');
ascensor = imread('obj.jpg');
image(yourImage);
axis on
grid on
hold on
asc = image(200,300,ascensor);
for i=1:length(tResponse)
   asc.YData = 200+200*tResponse(i);
   pause(0.001)
       end
       
