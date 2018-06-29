%% Game theory clustring without outlier
% generating two lines
x1 = [-1:0.1:1];
x2 = [-1:0.1:1];
x3 = [-1:0.1:1];
y1 = zeros(size(x1));
y2 = zeros(size(x2));
y3 = zeros(size(x3));
for i = 1:21
    y1(i) = 2*x1(i) + rand*(0.2);
    y2(i) = -2*x2(i) + rand*(0.2);
    y3(i) = rand*(4)-2;
end
%draw data point
figure(1)
scatter(x1,y1);
hold on;
scatter(x2,y2);
scatter(x3,y3,'red','filled');

X = [x1,x2,x3];
Y = [y1,y2,y3];

%% calculate weight of graph
    N = size(X,2);%calculate the size of data
    %N/2:because only half data are in one line
    C = nchoosek(1:N,3);%find eage of hypergraph:every 3 points own an eage
    L = size(C,1);
 
    y = 0;
    sim = zeros(L,1); 
    for i = 1:L
      sim(i) = similarity(X,Y,C(i,:),0.04);
    end
%% clustering
T = Gametheory_cluster(X, Y, 0.01,sim,C);

%% black point in a cluster
S = T>0.00001;
hold on
for i = 1:63
  if(S(i) >  0)
        X(i)
        Y(i)
        scatter(X(i),Y(i),'black','filled')
  end
end
  