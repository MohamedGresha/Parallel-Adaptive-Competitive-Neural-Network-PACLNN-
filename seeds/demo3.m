function [bestk,bestw,ACL,clusterid,NMI,NN]=demo3()
% this is demo3.m a function tests differnet algorithms in estimating the number
% of clusters .
%
%NMI is the normalized mutual information between the cluster id vector and the class id vector. 

% Ahmed Tool Box
% MAR. 2013
%
% Updated by 
% Mohamed Gresha
% 2021

load seeds;

y = X';
X=y';
[X,varmin,varrange]=atscale(X);
y=X';

%% Select the algorithm
%[bestk,bestmu,bestcov,bestpp,clusterid] = mixtures4(y);        %Figueiredo 2002********
%[bestk,bestmu,bestcov,bestpp,clusterid]=atembic(y');        %BIC
%[bestk,bestmu,bestcov,bestpp,clusterid]=atemmi(y');         %MI***********
%[bestk,bestmu,bestcov,bestpp,clusterid]=atemmi_m(y');   %MI+CEM_Modified******
%[bestk,bestmu,bestcov,bestpp,MIPL,clusterid]=atemmipl(y');   %MI+CEM_PL******
 %[bestk,bestw,ACL,clusterid,ACL_vec,k_vec]=atacl(y');      % Competitive neural network
 
 
 
 [bestk,bestw,ACL,clusterid,NN]=atacl_n(y');
% [bestk,bestw,ACL,clusterid,NN]=atacl_parfor(y');

 
 
 % compute the normalized mutual information
if bestk == 1
    NMI = 0;
else
     classid=[1*ones(70,1);2*ones(70,1);3*ones(70,1)];
    pclass = [1/3 1/3 1/3];   %the probability of each class
    pcluster=[];                %bestpp;        %the probability of each cluster
    pclass_cluster=[];      %the probability that a member of cluster j belongs to class i
    n = length(classid);
    for i=1:3
        if i==1
            c1=1;
            c2=70;
        elseif i==2
            c1=71;
            c2=140;
        elseif i==3
            c1=141;
            c2=210;
        end
        for j=1:bestk
            nj=length(find(clusterid == j));
            nij=length(find(clusterid(c1:c2) == j));
            pclass_cluster(i,j)=nij/n;
            pcluster(j)= nj/n;
        end
    end
    Hclass = -sum(pclass.*log(pclass)/log(2));
    Hcluster = -sum(pcluster.*log(pcluster)/log(2));

    MI=0;       % the Mutual information
    for i=1:3
        for j=1:bestk
            if pclass_cluster(i,j) ~= 0
                MI = MI + pclass_cluster(i,j) * log(pclass_cluster(i,j)/(pclass(i) * pcluster(j)))/log(2);
            end
        end
    end
    NMI = MI / sqrt(Hclass * Hcluster);
end
return;        
