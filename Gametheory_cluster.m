%% cluster
function T = Gametheory_cluster(X, Y,sigma,sim,C)
%parameter
%(X,Y) data point vector: row vector
%sigma: converge limit


%initialization
T = zeros(size(X));
for i = 1:size(X,2)
    T(i) = 1/size(X,2);
end
T
error = 100 % converge when error = 0;
diff = zeros(size(T));%partial derivative vector of f(x)
step = 0.0001;%step to calculate derivative
j = 1;%record iterative times
while(error > sigma)
    %calculate partial derivative vector of f(x)
    for i = 1:size(T,2)
    left_t = T;
    left_t(i) = left_t(i)-step;
    right_t = T;
    right_t(i) = right_t(i)+step;
    diff(i) = (f(right_t,3,sim,C)-f(left_t,3,sim,C))/(2*step);
    end
   
    diff = diff.*T;
    s = sum(diff);
    T_0 = T;
    %update T(i) according to Baum-Eagon to update T
    for i = 1:size(T,2)
        T(i) = diff(i)/ s;
    end
    
    j = j + 1;
    error = sum(abs(T_0-T))
    
    %draw figure 
    %figure(2);
   
    fprintf(1,'%gth iterative \n',j);
    %plot(error)
    %drawnow;
end

end