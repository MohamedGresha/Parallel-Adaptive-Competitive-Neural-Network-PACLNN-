% run an algorithm to estimate the number of clusters in a data set
% for 100 times and save the results

% Ahmed Rafat
% Mar. 13

% Pima data set
kopt=[];
NMI_vec=[];
bestk_vec=[];
ACLopt=[];

base_path = 'D:\1-Paper\paper 1\00-MATLAB\new\big\1-first data_big\NEW';
for q=1:5                %run the Algorithm 10 time to
    
    tic
    
    [bestk,bestw,ACL,clusterid,NMI,NN]=demo_s;     %sequention processing    
    
    time=toc;
    
%     kopt=[kopt bestk];
%     NMI_vec=[NMI_vec;NMI];
%     bestk_vec=[bestk_vec;bestk];
%     ACLopt=[ACLopt;ACL];
    
    SS5(q).NN=NN;
    SS5(q).kopt=bestk;
    SS5(q).NMI=NMI;
    SS5(q).bestk=bestk;
    SS5(q).ACL=ACL;
    SS5(q).time=time;
    
    %     NMI_vec=[NMI_vec;NMI];
    %     bestk_vec=[bestk_vec;bestk];
    %     ACLopt=[ACLopt;ACL];
    %subfolder = ('New folder2');
    file_name=sprintf('0_acl_SS%d.mat',q);
    save(fullfile(base_path,file_name), 'bestk', 'bestw', 'ACL', 'clusterid', 'NMI','time','NN','SS5');
end

save(fullfile(base_path,'acl_SS'), 'NN', 'SS5');
disp('===========================================');
% disp('kopt=');
% disp(length(find(kopt==3)));
[val,id] = min([SS5.ACL]);
%[val,id]=min(ACLopt);
disp('======> Min ACL <======');
disp('ACL=');
disp(val);
disp('kopt=');
disp(SS5(id).kopt);
disp('NMIopt=');
disp(SS5(id).NMI);
disp('time=');
disp(SS5(id).time);
[val,id]=max([SS5.NMI]);
disp('======> Max NMI<======');
disp('MAXNMI=');
disp(val);
disp('MaxACL=');
disp(SS5(id).ACL);
disp('kopt=');
disp(SS5(id).kopt);
disp('time=');
disp(SS5(id).time);

return;