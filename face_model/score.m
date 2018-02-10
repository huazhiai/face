%19000 0.6853 0.5530
clear;clc;

load('D:\zhuch\windows_centerloss_caffe\face_example\LFW_Feature_556000.mat');

% features_s = features';
% maps = features * features_s;

distance_cosine=1-pdist(features,'cosine');
maps = squareform(distance_cosine);

%[COFFE,Score, latent] = princomp(features);
%Score_s = Score';
%maps =  Score * Score_s;

filter = zeros(13233,13233);
%[k,l] = textread('d:/zhuch/windows_centerloss_caffe/face_example/positive_pair.txt','%n%n',-1);
[k,l] = textread('d:/dl/positive_pair.txt','%n%n',-1);
length(k)
for i = 1:length(k)
    filter(k(i),l(i))=1;
    filter(l(i),k(i))=1;
end
maps_scores = maps.*filter;
%level = sum(maps_scores(:)>420)
level = sum(maps_scores(:)>0.35)
level/(length(k)*2)

filtern = zeros(13233,13233);
%[kn,ln] = textread('d:/zhuch/windows_centerloss_caffe/face_example/negative_pair.txt','%n%n',-1);
[kn,ln] = textread('d:/dl/negative_pair.txt','%n%n',-1);
length(kn)
for i = 1:length(k)
    filtern(kn(i),ln(i))=1;
    filtern(ln(i),kn(i))=1;
end
mapsn_scores = maps.*filtern;
%leveln = sum(mapsn_scores(:)<420)
leveln = sum(mapsn_scores(:)<0.35)
levelnz = sum(mapsn_scores(:)==0)
(leveln-levelnz)/(length(kn)*2)