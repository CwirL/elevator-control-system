global ax3 tResponse
switch entrada
    case 1
        msgbox('Por favor ingrese el tipo de función para ver la respuesta en tiempo.')
    case 2 % Escalón Unitario
       [tResponse, t1] = step(ft2,t);
       tResponse = tResponse + ft_p;
       
       if mantener == 1
           hold on
       else
           hold off
       end
       ax3 = handles.axes3;
       axes(ax3)
       plot(t,tResponse,'r-')
%        hold on 
%        step(ft2,t)
%        ylim([-1.5 1.5])
       
       y = lsiminfo(tResponse,t);
       stepinfo(ft2)
       %ts1 = y.SettlingTime;
       
       Mp1 = (max(tResponse)-tResponse(end))/tResponse(end);
       for i=1:length(t)
           if tResponse(i) == tResponse(end)
                tr1 = t(i);
                break
           end 
       end
       for i=length(t):-1:1
           if tResponse(i) > (tResponse(end)-tResponse(end)*0.2) || tResponse(i) > (tResponse(end)+tResponse(end)*0.2)
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

       
       impulse(ft2,t);
       [tResponse, t1] = impulse(ft2);
       tResponse = tResponse + ft_p;
       axes(handles.axes3)
       plot(t1,tResponse)
%        ylim([-1.5 1.5])
       s = lsiminfo(tResponse,t1,0);
       ts1 = s.SettlingTime;
       tp1 = s.MaxTime;
       set(handles.Mp,'String',NaN); 
       set(handles.ts,'String',num2str(ts1));
       set(handles.tr,'String',NaN);
       set(handles.tp,'String',num2str(tp1));

   case 4 %Entrada Rampa 
       u = t;
       [tResponse, t1] = lsim(ft2,u,t);
       tResponse = tResponse + ft_p;
       if mantener == 1
           hold on
       else
           hold off
       end
       axes(handles.axes3)
       plot(t1,tResponse,t,u,'r-')
%        ylim([-1.5 1.5])
       s = lsiminfo(tResponse,t1,1);
       ts1 = s.SettlingTime;
       tp1 = s.MaxTime;
       set(handles.Mp,'String',NaN); 
       set(handles.ts,'String',num2str(ts1));
       set(handles.tr,'String',NaN);
       set(handles.tp,'String',num2str(tp1));

   case 5 %Entrada Parábola

       u = t.^2;
       [tResponse, t1] = lsim(ft2,u,t);
       tResponse = tResponse + ft_p;
       if mantener == 1
           hold on
       else
           hold off
       end
       axes(handles.axes3)
       plot(t1,tResponse,t,u,'r-')
%        ylim([-1.5 1.5])
       s = lsiminfo(tResponse,t1,1);
       ts1 = s.SettlingTime;
       tp1 = s.MaxTime;
       set(handles.Mp,'String',NaN); 
       set(handles.ts,'String',num2str(ts1));
       set(handles.tr,'String',NaN);
       set(handles.tp,'String',num2str(tp1));
end