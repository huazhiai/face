%19000 0.6853 0.5530
clear;clc;

load('D:\zhuch\windows_centerloss_caffe\face_example\LFW_Feature_280000.mat');

features_s = features';
maps = features * features_s;

%[COFFE,Score, latent] = princomp(features);
%Score_s = Score';
%maps =  Score * Score_s;

filter = zeros(13233,13233);
[k,l] = textread('d:/dl/positive_pair.txt','%n%n',3000);
for i = 1:3000
    filter(k(i),l(i))=1;
    filter(l(i),k(i))=1;
end
maps_scores = maps.*filter;
level = sum(maps_scores(:)>455);
level/6000

filtern = zeros(13233,13233);
[kn,ln] = textread('d:/dl/negative_pair.txt','%n%n',3000);
for i = 1:3000
    filtern(kn(i),ln(i))=1;
    filtern(ln(i),kn(i))=1;
end
mapsn_scores = maps.*filtern;
leveln = sum(mapsn_scores(:)<450);
levelnz = sum(mapsn_scores(:)==0);
(leveln-levelnz)/6000