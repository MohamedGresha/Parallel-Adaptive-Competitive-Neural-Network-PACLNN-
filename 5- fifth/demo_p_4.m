function [bestk,bestw,ACL,clusterid,NMI,NN]=demo_p_4()
% this is demo1.m a function tests differnet algorithms in estimating the number
% of clusters .
%
%NMI is the normalized mutual information between the cluster id vector and the class id vector. 

%Ahmed Rafat
%Mohamed Gresha
%Oct. 18

load ('d_900000.mat');

[X,varmin,varrange]=atscale(X);
y=X';

%% Select the algorithm
%[bestk,bestmu,bestcov,bestpp,clusterid] = mixtures4(y);         %Figueiredo 2002********
%[bestk,bestmu,bestcov,bestpp,clusterid]=atembic(y');            %BIC
%[bestk,bestmu,bestcov,bestpp,clusterid]=atemmi(y');             %MI***********
%[bestk,bestmu,bestcov,bestpp,clusterid]=atemmi_m(y');           %MI+CEM_Modified******
%[bestk,bestmu,bestcov,bestpp,MIPL,clusterid]=atemmipl(y');      %MI+CEM_PL******
[bestk,bestw,ACL,clusterid,NN]=atacl_parfor(y');      % Competitive neural network

% compute the normalized mutual information
if bestk == 1
    NMI = 0;
else
    classid=[1*ones(180000,1);
         2*ones(180000,1);
         3*ones(180000,1);
         4*ones(180000,1);
         5*ones(180000,1)];
    pclass = [180000/900000 180000/900000 180000/900000 180000/900000 180000/900000];   %the probability of each class
    pcluster=[];                %bestpp;        %the probability of each cluster
    pclass_cluster=[];      %the probability that a member of cluster j belongs to class i
    n = length(classid);
    for i=1:5
        if i==1
            c1=1;
            c2=180000;
        elseif i==2
            c1=180001;
            c2=360000;
        elseif i==3
            c1=360001;
            c2=540000;
        elseif i==4
            c1=540001;
            c2=720000;
        elseif i==5
            c1=720001;
            c2=900000;
        end
        for j=1:bestk
            nj=length(find(clusterid == j));
            nij=length(find(clusterid(c1:c2) == j));
            pclass_cluster(i,j)=nij/n;
            pcluster(j)= nj/n;
        end
    end
    [g,h]=size(pcluster);
    for w=1:h
        if pcluster(w)== 0
            pcluster(w)= 0.000001;
        end
    end
    Hclass = -sum(pclass.*log(pclass)/log(2));
    Hcluster = -sum(pcluster.*log(pcluster)/log(2));

    MI=0;       % the Mutual information
    for i=1:5
        for j=1:bestk
            if pclass_cluster(i,j) ~= 0
                MI = MI + pclass_cluster(i,j) * log(pclass_cluster(i,j)/(pclass(i) * pcluster(j)))/log(2);
            end
        end
    end
    NMI = MI / sqrt(Hclass * Hcluster);
end
return;        
