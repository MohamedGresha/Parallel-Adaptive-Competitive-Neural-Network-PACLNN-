% run an algorithm to estimate the number of clusters in a data set
% for 10 times and save the results

% Ahmed Tool Box
% MAR. 2013
%
% Updated by 
% Mohamed Gresha
% 2021
kopt=[];
NMI_vec=[];
bestk_vec=[];
ACLopt=[];

base_path = 'E:\111\New folder\ACL\ACL\new';
for q=1:10                %run the Algorithm 10 time to
    
    tic
    
    [bestk,bestw,ACL,clusterid,NMI,NN]=demo_s;     %sequention processing    
    
    time=toc;
    
%     kopt=[kopt bestk];
%     NMI_vec=[NMI_vec;NMI];
%     bestk_vec=[bestk_vec;bestk];
%     ACLopt=[ACLopt;ACL];
    
    PP(q).NN=NN;
    PP(q).kopt=bestk;
    PP(q).NMI=NMI;
    PP(q).bestk=bestk;
    PP(q).ACL=ACL;
    PP(q).time=time;
    
    %     NMI_vec=[NMI_vec;NMI];
    %     bestk_vec=[bestk_vec;bestk];
    %     ACLopt=[ACLopt;ACL];
    %subfolder = ('New folder2');
    file_name=sprintf('acl_MFCCs%d.mat',q);
    save(fullfile(base_path,file_name), 'bestk', 'bestw', 'ACL', 'clusterid', 'NMI','time','NN','PP');
end

save(fullfile(base_path,'acl_MFCCs'), 'NN', 'PP');
disp('===========================================');
% disp('kopt=');
% disp(length(find(kopt==3)));
[val,id] = min([PP.ACL]);
%[val,id]=min(ACLopt);
disp('======> Min ACL <======');
disp('ACL=');
disp(val);
disp('kopt=');
disp(PP(id).kopt);
disp('NMIopt=');
disp(PP(id).NMI);
disp('time=');
disp(PP(id).time);
[val,id]=max([PP.NMI]);
disp('======> Max NMI<======');
disp('MAXNMI=');
disp(val);
disp('MaxACL=');
disp(PP(id).ACL);
disp('kopt=');
disp(PP(id).kopt);
disp('time=');
disp(PP(id).time);

return;
