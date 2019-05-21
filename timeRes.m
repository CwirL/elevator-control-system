
axes(handles.axes17)
yourImage = imread('Ascensor.jpg');
ascensor = imread('obj.jpg');
switch entrada
    case 1
        msgbox('Por favor ingrese el tipo de función para ver la respuesta en tiempo.')
    case 2 % Escalón Unitario
       ft34 = step(ft2,t);
       ff = ft34 + ft_p;
       
       if mantener == 1
           hold on
       else
           hold off
       end
       axes(handles.axes3)
       ylim([-1.5 1.5])
       
       for i=1:length(ff)
           hold on
           plot(t(i),ff(i), 'b*')
           pause(0.0001)
       end
       ffb = ff;
       ff = ff/max(ff);
       axes(handles.axes17)
        yourImage = imread('Ascensor.jpg');
        ascensor = imread('obj.jpg');
        image(yourImage);
        axis on
        grid on
        hold on
        asc = image(200,300,ascensor);
       for i=1:length(ff)
           asc.YData = 200+200*ff(i);
           pause(0.001)
       end
       
       
       y = lsiminfo(ff,t,0);
       %ts1 = y.SettlingTime;
       Mp1 = (max(ff)-ff(end))/ff(end);
       for i=1:length(t)
           if ff(i) == ff(end)
                tr1 = t(i);
                break
           end 
       end
       for i=length(t):-1:1
           if ff(i) > (ff(end)-ff(end)*0.2) || ff(i) > (ff(end)+ff(end)*0.2)
                ts1 = t(i);
                %break
           end 
       end
       tp1 = y.MaxTime;
       set(handles.Mp,'String',num2str(Mp1)); 
       set(handles.ts,'String',num2str(ts1));
       set(handles.tr,'String',num2str(tr1));
       set(handles.tp,'String',num2str(tp1));

   case 3 %Entrada impulso

       if mantener == 1
           hold on
       else
           hold off
       end

       axes(handles.axes3)
       impulse(ft2,t);
       [y, t1] = impulse(ft2);
       y = y + ft_p;
       s = lsiminfo(y,t1,0);
       ts1 = s.SettlingTime;
       tp1 = s.MaxTime;
       set(handles.Mp,'String',NaN); 
       set(handles.ts,'String',num2str(ts1));
       set(handles.tr,'String',NaN);
       set(handles.tp,'String',num2str(tp1));

   case 4 %Entrada Rampa 
       u = t;
       [y, t1] = lsim(ft2,u,t);
       y = y + ft_p;
       if mantener == 1
           hold on
       else
           hold off
       end
       axes(handles.axes3)
       plot(t1,y,t,u,'r--')
       s = lsiminfo(y,t1,1);
       ts1 = s.SettlingTime;
       tp1 = s.MaxTime;
       set(handles.Mp,'String',NaN); 
       set(handles.ts,'String',num2str(ts1));
       set(handles.tr,'String',NaN);
       set(handles.tp,'String',num2str(tp1));

   case 5 %Entrada Parábola

       u = t.^2;
       [y, t1] = lsim(ft2,u,t);
       y = y + ft_p;
       if mantener == 1
           hold on
       else
           hold off
       end
       axes(handles.axes3)
       plot(t1,y,t,u,'r--')
       s = lsiminfo(y,t1,1);
       ts1 = s.SettlingTime;
       tp1 = s.MaxTime;
       set(handles.Mp,'String',NaN); 
       set(handles.ts,'String',num2str(ts1));
       set(handles.tr,'String',NaN);
       set(handles.tp,'String',num2str(tp1));
end