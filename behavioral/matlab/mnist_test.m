[XTrain YTrain XTest YTest] = load_mnist('.');

XTrain = reshape(XTrain, [784 60000]);
weights_hidden = -0.05 + 0.1 * rand(64, 784);
bias_hidden = zeros(64, 1);
weights_output = -0.05 + 0.1 * rand(10, 64);
bias_output = zeros(10, 1);
[~, ~, YTrain] = unique(YTrain);
YTrain = double(accumarray([(1:numel(YTrain)).' YTrain], 1))';

XTest = reshape(XTest, [784 10000]);
[~, ~, YTest] = unique(YTest);
YTest = double(YTest');
% YTest = double(accumarray([(1:numel(YTest)).' YTest], 1))';

iterations = 5000;
batch = 128;
learn = 1;

test3 = [];

for i = 1:iterations
   indices = randi(60000, [1 batch]);
   data = XTrain(:, indices);
   truth = YTrain(:, indices);
   hidden_val = weights_hidden * data + repmat(bias_hidden, 1, batch);
   hidden_act = sigmoid(hidden_val);
   output_val = weights_output * hidden_act + repmat(bias_output, 1, batch);
   output_act = sigmoid(output_val);
   error = cross_entropy(truth, output_act);
   test3 = [test3 mean(error)];
   d_output_val = output_act - truth;
   d_weights_output = d_output_val * hidden_act' / batch;
   d_hidden_act = weights_output' * d_output_val;
   d_hidden_val = d_hidden_act .* hidden_act .* (1 - hidden_act);
   d_weights_hidden = d_hidden_val * data' / batch;
   weights_hidden = weights_hidden - learn * d_weights_hidden;
   bias_hidden = bias_hidden - learn * mean(d_hidden_val, 2);
   weights_output = weights_output - learn * d_weights_output;
   bias_output = bias_output - learn * mean(d_output_val, 2);
end

test_size = 10000;
hidden_val = weights_hidden * XTest + repmat(bias_hidden, 1, test_size);
hidden_act = sigmoid(hidden_val);
output_val = weights_output * hidden_act + repmat(bias_output, 1, test_size);
output_act = sigmoid(output_val);
[~, predict] = max(output_act);
correct = (YTest == predict);
accuracy = sum(correct) / 10000
% error = cross_entropy(YTest, output_act);
% mean(error)

function output = sigmoid(X)
    output = 1./(1 + exp(-X));
end

function output = cross_entropy(y, a)
    output = -sum(y.*log(a) + (1-y).*log(1-a));
end

function [XTrain, YTrain, XTest, YTest] = load_mnist( dir )
url = 'http://yann.lecun.com/exdb/mnist/';
datasetfile = 'mnist.mat';
 if( ~exist( 'dir', 'var' ) )
  dir = [fileparts(mfilename('fullpath')),'/'];
 end
 if( dir(end) ~= '/' )
  dir = [dir, '/'];
 end
 if( isfile( [dir, datasetfile] ) )
  load( [dir, datasetfile] );
 else
  fprintf( 'Downloading mnist dataset. It may takes several minutes.\n' );
     
  
  filename = 'train-images-idx3-ubyte';
  websave([dir,filename,'.gz'], [url,filename, '.gz']);
  gunzip([dir,filename, '.gz']);
  XTrain = readMnistX([dir,filename]);
  filename = [ dir, filename, '*' ];
  delete(filename);
  
  filename = 'train-labels-idx1-ubyte';
  websave([dir,filename,'.gz'], [url,filename, '.gz']);
  gunzip([dir,filename, '.gz']);
  YTrain = readMnistY([dir,filename]);
  filename = [ dir, filename, '*' ];
  delete(filename);
  
  filename = 't10k-images-idx3-ubyte';
  websave([dir,filename,'.gz'], [url,filename, '.gz']);
  gunzip([dir,filename, '.gz']);
  XTest = readMnistX([dir,filename]);
  filename = [ dir, filename, '*' ];
  delete(filename);
  filename = 't10k-labels-idx1-ubyte';
  websave([dir,filename,'.gz'], [url,filename, '.gz']);
  gunzip([dir,filename, '.gz']);
  YTest = readMnistY([dir,filename]);
  filename = [ dir, filename, '*' ];
  delete(filename);
  
  save([dir,datasetfile], 'XTrain', 'YTrain', 'XTest', 'YTest');
 end
 
 XTrain = double(XTrain) / 255.0;
 YTrain = categorical(YTrain);
 XTest = double(XTest) / 255.0;
 YTest = categorical(YTest);
end
function X = readMnistX( filename )
    fid = fopen(filename, 'r', 'b');
    header = fread(fid, 1, 'int32');
    if header ~= 2051
        error('Invalid image file header');
    end
    count = fread(fid, 1, 'int32');
    h = fread(fid, 1, 'int32');
    w = fread(fid, 1, 'int32');
    
    X = fread(fid, h*w*count, 'uint8');
    X = reshape( X, [h,w,1,count] );
    X = permute( X, [2,1,3,4] );
    
    X = uint8(X);
    fclose(fid);
end
function Y = readMnistY( filename )
    fid = fopen(filename, 'r', 'b');
    header = fread(fid, 1, 'int32');
    if header ~= 2049
        error('Invalid image file header');
    end
    count = fread(fid, 1, 'int32');
    
    Y = fread(fid, count, 'uint8');
    Y = reshape( Y, [count,1] );
    Y = uint8(Y);
    
    fclose(fid);
end
