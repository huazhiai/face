clear;clc;
addpath(genpath('d:/zhuch/caffe'));
caffe.reset_all();

% load face model and creat network
caffe.set_device(0);
caffe.set_mode_gpu();
model = 'd:/zhuch/windows_centerloss_caffe/face_example/face_deploy.prototxt';
weights = 'd:/zhuch/windows_centerloss_caffe/face_example/face_model.caffemodel';
net = caffe.Net(model, weights, 'test');

%[paths,classes]=textread('d:/dl/lfw_all.txt','%s %n%*[^n]');
[paths,classes]=textread('d:/dl/lfw_all.txt','%s%n',13233);
for i = 1:size(paths)
    fprintf(char(paths(i)))
    fprintf('\n')
    try
        cropImg = imread(char(paths(i)));
    catch
        features(i,:) = zeros(1,1024);
        continue
    end
    
    % transform image, obtaining the original face and the horizontally flipped one
    if size(cropImg, 3) < 3
        cropImg(:,:,2) = cropImg(:,:,1);
        cropImg(:,:,3) = cropImg(:,:,1);
    end
    cropImg = single(cropImg);
    cropImg = (cropImg - 127.5)/128;
    cropImg = permute(cropImg, [2,1,3]);
    cropImg = cropImg(:,:,[3,2,1]);

    cropImg_(:,:,1) = flipud(cropImg(:,:,1));
    cropImg_(:,:,2) = flipud(cropImg(:,:,2));
    cropImg_(:,:,3) = flipud(cropImg(:,:,3));

    % extract deep feature
    res = net.forward({cropImg});
    res_ = net.forward({cropImg_});
    features(i,:) = [res{1}; res_{1}];
end

save('D:\zhuch\windows_centerloss_caffe\face_example\LFW_Feature_all.mat','features','paths','classes');

caffe.reset_all();