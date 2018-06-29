function sim = similarity(X,Y,C,sigma)
%calculate similarity of three point
%parameter:
%(X,Y):data points vector
%C:k point in a eage

%three point 
p1 = C(1);
p2 = C(2);
p3 = C(3);

%calculate a line fit the three point
FO = fit([X(p1),X(p2),X(p3)]',[Y(p1),Y(p2),Y(p3)]','poly1');

%get parameter of fitting line
a = FO.p1;
b = FO.p2;

%formulation: y = a*x + b;
if (~isinf(a))
dist = ((abs(Y(p1)-a*X(p1)-b))+(abs(Y(p2)-a*X(p2)-b))+ ...
    (abs(Y(p3)-a*X(p3)-b)))/sqrt(a*a+1);
sim = dist/3;
sim = exp(-(sim/sigma)^2);
else
sim = 0.5;    
end
end
