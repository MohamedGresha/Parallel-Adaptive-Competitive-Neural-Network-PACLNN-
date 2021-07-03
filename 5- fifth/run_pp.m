% run an algorithm to estimate the number of clusters in a data set
% for 100 times and save the results

%Ahmed Rafat
%Mohamed Gresha
%Oct. 18


base_path = 'D:\1-Paper\paper 1\00-MATLAB\new\big\1-first data_big\NEW';
for q=1:3                %run the Algorithm 100 time to 
    
    tic
    
        [bestk,bestw,ACL,clusterid,NMI,NN]=demo_p_4;     %Parallel Processing
        % [bestk,bestw,ACL,clusterid,NMI,NN]=demo_s;     %sequention processing
        
    
    time=toc;
    PP5(q).NN=NN;
    PP5(q).kopt=bestk;
    PP5(q).NMI=NMI;
    PP5(q).bestk=bestk;
    PP5(q).ACL=ACL;
    PP5(q).time=time;
    
%     NMI_vec=[NMI_vec;NMI];
%     bestk_vec=[bestk_vec;bestk];
%     ACLopt=[ACLopt;ACL];
    %subfolder = ('New folder2');
    file_name=sprintf('acl_PP%d.mat',q);
    save(fullfile(base_path,file_name), 'bestk', 'bestw', 'ACL', 'clusterid', 'NMI','time','NN','PP5');
end

%
%save acl_irs NMI_vec bestk_vec kopt ACLopt;

disp('===========================================');
% disp('kopt=');
% disp(length(find(kopt==3)));
[val,id] = min([PP5.ACL]);
%[val,id]=min(ACLopt);
disp('======> Min ACL <======');
disp('ACL=');
disp(val);
disp('kopt=');
disp(PP5(id).kopt);
disp('NMIopt=');
disp(PP5(id).NMI);
disp('time=');
disp(PP5(id).time);
[val,id]=max([PP5.NMI]);
disp('======> Max NMI<======');
disp('MAXNMI=');
disp(val);
disp('MaxACL=');
disp(PP5(id).ACL);
disp('kopt=');
disp(PP5(id).kopt);
disp('time=');
disp(PP5(id).time);

return;
