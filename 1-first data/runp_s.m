% run an algorithm to estimate the number of clusters in a data set
% for 10 times and save the results

% Ahmed Rafat
% Mar. 13

% first data set
kopt=[];
NMI_vec=[];
bestk_vec=[];
ACLopt=[];

base_path = 'E:\1-Paper\paper 1\00-MATLAB\new\big\1-first data\0';
for q=1:10                %run the Algorithm 10 time to
    
    tic
    
    [bestk,bestw,ACL,clusterid,NMI,NN]=demo_s;     %sequention processing    
    
    time=toc;
    
%     kopt=[kopt bestk];
%     NMI_vec=[NMI_vec;NMI];
%     bestk_vec=[bestk_vec;bestk];
%     ACLopt=[ACLopt;ACL];
    
    SS1(q).NN=NN;
    SS1(q).kopt=bestk;
    SS1(q).NMI=NMI;
    SS1(q).bestk=bestk;
    SS1(q).ACL=ACL;
    SS1(q).time=time;
    
    %     NMI_vec=[NMI_vec;NMI];
    %     bestk_vec=[bestk_vec;bestk];
    %     ACLopt=[ACLopt;ACL];
    %subfolder = ('New folder2');
    file_name=sprintf('acl_SS1%d.mat',q);
    save(fullfile(base_path,file_name), 'bestk', 'bestw', 'ACL', 'clusterid', 'NMI','time','NN','SS1');
end

save(fullfile(base_path,'acl_SS'), 'NN', 'SS1');
disp('===========================================');
% disp('kopt=');
% disp(length(find(kopt==3)));
[val,id] = min([SS1.ACL]);
%[val,id]=min(ACLopt);
disp('======> Min ACL <======');
disp('ACL=');
disp(val);
disp('kopt=');
disp(SS1(id).kopt);
disp('NMIopt=');
disp(SS1(id).NMI);
disp('time=');
disp(SS1(id).time);
[val,id]=max([SS1.NMI]);
disp('======> Max NMI<======');
disp('MAXNMI=');
disp(val);
disp('MaxACL=');
disp(SS1(id).ACL);
disp('kopt=');
disp(SS1(id).kopt);
disp('time=');
disp(SS1(id).time);

return;