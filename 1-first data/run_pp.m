% run an algorithm to estimate the number of clusters in a data set
% for 100 times and save the results

%Ahmed Rafat
%Mohamed Gresha
%Oct. 18


base_path = 'D:\1-Paper\paper 1\00-MATLAB\new\big\1-first data\1';
for q=1:10                %run the Algorithm 100 time to 
    
    tic
    
        [bestk,bestw,ACL,clusterid,NMI,NN]=demo_p;     %Parallel Processing
        % [bestk,bestw,ACL,clusterid,NMI,NN]=demo_s;     %sequention processing
        
    
    time=toc;
    PP1(q).NN=NN;
    PP1(q).kopt=bestk;
    PP1(q).NMI=NMI;
    PP1(q).bestk=bestk;
    PP1(q).ACL=ACL;
    PP1(q).time=time;
    
%     NMI_vec=[NMI_vec;NMI];
%     bestk_vec=[bestk_vec;bestk];
%     ACLopt=[ACLopt;ACL];
    %subfolder = ('New folder2');
    file_name=sprintf('0_acl_PP1_P%d.mat',q);
     save(fullfile(base_path,file_name), 'bestk', 'bestw', 'ACL', 'clusterid', 'NMI','time','NN','PP1');
end

 %save(fullfile(base_path,'acl_bank'), 'NN', 'PP1');

%save acl_irs NMI_vec bestk_vec kopt ACLopt;

disp('===========================================');
% disp('kopt=');
% disp(length(find(kopt==3)));
[val,id] = min([PP1.ACL]);
%[val,id]=min(ACLopt);
disp('======> Min ACL <======');
disp('ACL=');
disp(val);
disp('kopt=');
disp(PP1(id).kopt);
disp('NMIopt=');
disp(PP1(id).NMI);
disp('time=');
disp(PP1(id).time);
[val,id]=max([PP1.NMI]);
disp('======> Max NMI<======');
disp('MAXNMI=');
disp(val);
disp('MaxACL=');
disp(PP1(id).ACL);
disp('kopt=');
disp(PP1(id).kopt);
disp('time=');
disp(PP1(id).time);

return;
