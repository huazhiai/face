clear;clc;

[paths,classes]=textread('d:/dl/lfw_all.txt','%s%n',-1);
[names,l,k] = textread('d:/dl/lfw_positive_pair.txt','%s%n%n',-1);
p = 1;
for i = 1:3000
    first_path=sprintf('%s_%04d', cell2mat(names(i)), l(i));
    second_path=sprintf('%s_%04d', cell2mat(names(i)), k(i));
    Kf = strfind(paths,first_path);
    Ks = strfind(paths,second_path);
    try
        cropImg1 = imread(char(sprintf('D:/BaiduNetdiskDownload/lfw_Align/%s/%s.jpg',cell2mat(names(i)),first_path)));
        cropImg2 = imread(char(sprintf('D:/BaiduNetdiskDownload/lfw_Align/%s/%s.jpg',cell2mat(names(i)),second_path)));
    catch err
        fprintf('%s %d %d image crack\r',cell2mat(names(i)),l(i),k(i))
        continue
    end
    for j=1:length(paths)
       a=isempty(Kf{j});
       if a==0
           ThatfirstOne=j;
           break
       end
    end
    for j=1:length(paths)
       a=isempty(Ks{j});
       if a==0
           ThatsecondOne=j;
           break
       end
    end
    positive_pair(p,:) = [ThatfirstOne,ThatsecondOne];
    p = p + 1;
end
%save('D:\zhuch\windows_centerloss_caffe\face_example\positive_pair.mat','positive_pair');
dlmwrite('D:\zhuch\windows_centerloss_caffe\face_example\positive_pair.txt', positive_pair)

[names1,l,names2,k] = textread('d:/dl/lfw_negative_pair.txt','%s%n%s%n',-1);
p = 1;
for i = 1:3000
    first_path=sprintf('%s_%04d', cell2mat(names1(i)), l(i));
    second_path=sprintf('%s_%04d', cell2mat(names2(i)), k(i));
    Kf = strfind(paths,first_path);
    Ks = strfind(paths,second_path);
    try
        cropImg1 = imread(char(sprintf('D:/BaiduNetdiskDownload/lfw_Align/%s/%s.jpg',cell2mat(names1(i)),first_path)));
        cropImg2 = imread(char(sprintf('D:/BaiduNetdiskDownload/lfw_Align/%s/%s.jpg',cell2mat(names2(i)),second_path)));
    catch err
        fprintf('%s %d ,%s %d image crack\r',cell2mat(names1(i)),l(i),cell2mat(names2(i)),k(i))
        continue
    end    
    for j=1:length(paths)
       a=isempty(Kf{j});
       if a==0
           ThatfirstOne=j;
           break
       end
    end
    for j=1:length(paths)
       a=isempty(Ks{j});
       if a==0
           ThatsecondOne=j;
           break
       end
    end
    negative_pair(p,:) = [ThatfirstOne,ThatsecondOne];
    p = p + 1;
end
%save('D:\zhuch\windows_centerloss_caffe\face_example\negative_pair.mat','negative_pair');
dlmwrite('D:\zhuch\windows_centerloss_caffe\face_example\negative_pair.txt', negative_pair)