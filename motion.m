axes(handles.axes17)
yourImage = imread('Ascensor.jpg');
ascensor = imread('obj.jpg');
image(yourImage);
axis on
grid on
hold on
asc = image(200,300,ascensor);

while (1)
     for k=300:-1:100
    asc.YData = k;
    pause(0.005);
    end
     for k=100:1:300
    asc.YData = k;
    pause(0.005);
    end
end

