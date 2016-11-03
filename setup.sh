mkdir -p data
cd data
wget -c http://www.vlfeat.org/matconvnet/models/beta16/imagenet-vgg-verydeep-19.mat
mkdir -p bin
wget -t 0 --timeout=10 -c http://msvocds.blob.core.windows.net/coco2014/train2014.zip
unzip train2014.zip
