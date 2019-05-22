axes(handles.axes2)
rlocus(G*H)
hold off
syms s k e t S

[num,den] = tfdata(ft,'v');
ra = routh(den, e);
[x,y] = size(ra);
for i = 1:x
    for j = y:-1:1
        ra(i,j+1) = ra(i,j);
    end
    ra(i,1) = S^+(x-i);
end
txtt = evalc('ra'); 
set(handles.text132,'String',txtt(10:end-3));
polesft = pole(ft);
poles_ft = evalc('polesft');
set(handles.text135,'String',poles_ft(16:end-2));
g = G2*G3;
[numg,deng] = tfdata(g);
g = poly2sym(cell2mat(numg),s)/poly2sym(cell2mat(deng),s);
[numh,denh] = tfdata(H);
h = poly2sym(cell2mat(numh),s)/poly2sym(cell2mat(denh),s);

switch val
    case 2 % Proporcional 
        cont = k;
        Tfuncion = (cont*g)/(1+cont*g*h);
        simplify(Tfuncion);
        [N,D] = numden(Tfuncion);
        DEN = coeffs(D, s , 'All');
        ra = routh(DEN, e);
        cond1 = ra(3,1)>0;
        cond2 = ra(4,1)>0;
        cond3 = ra(5,1)>0; 
        conds = [cond1 cond2 cond3];
        sol1 = (-313215 - 7015*sqrt(2001))/293088<k<(7015*sqrt(2001) - 313215)/293088;
        x1 = 0;
        x2 = (7015*sqrt(2001) - 313215)/293088;
        rs1 = linspace(x1,x2,100);
        zer = zeros(1,length(rs1));
        
        axes(handles.axes18)
        plot(rs1(2:length(rs1)-1),zer(2:length(rs1)-1),'b', rs1(1), zer(1), 'bo', rs1(length(rs1)), zer(1), 'bo');
        xlim([-0.01 0.01])
        %
        [x,y] = size(ra);
        for i = 1:x
            for j = y:-1:1
                ra(i,j+1) = ra(i,j);
            end
            ra(i,1) = S^+(x-i);
        end
        txtt = evalc('ra'); 
        set(handles.text131,'String',txtt(10:end-3));
        hold off
    case 3% Proporcional Integral
        cont = k*(1+1/(t*s));
        Tfuncion = (cont*g)/(1+cont*g*h);
        simplify(Tfuncion);
        [N,D] = numden(Tfuncion);
        DEN = coeffs(D, s , 'All');
        ra = routh(DEN, e);
        conds = ra(:,1).';
%         ymax = 10;
%         y = [0 ymax ymax 0];
%         x = [0 0 0.002 0.002];
%         axes(handles.axes18)
%         patch(x,y,'red')
%         y = [0 ymax ymax 0];
%         x = [76255/73272 76255/73272 2 2];
%         hold on 
%         patch(x,y,'blue')
%         xlim([-1.5 1.5])
%         ylim([-1.5 ymax])
%         hold off
        %Print Routh
        syms S;
        [x,y] = size(ra);
        for i = 1:x
            for j = y:-1:1
                ra(i,j+1) = ra(i,j);
            end
            ra(i,1) = S^+(x-i);
        end
        txtt = evalc('ra'); 
        set(handles.text131,'String',txtt(10:end-3));
        
    case 4% Proporcional derivativo
        cont = k*(1+(t*s));
        Tfuncion = (cont*g)/(1+cont*g*h);
        simplify(Tfuncion);
        [N,D] = numden(Tfuncion);
        DEN = coeffs(D, s , 'All');
        ra = routh(DEN, e);
        conds = ra(:,1).';
        
        
        
        
        
end