function y = f(T,k,sim,C)
%parameter:
%(X,Y)datapoint vector:row vector
%T:T(i) is the probability of ith data point belong to a cluster
%k:cardinality of eage
%tips:to improve speed, the weight of all eages can be calculated first
%initialization
    L = size(sim,1);
    %find 10 eages by ramdom to 
    for i = 1:L
      for j = 1:k
        sim(i) = sim(i)*T(C(i,j));
      end
    end
    y = sum(sim);
end