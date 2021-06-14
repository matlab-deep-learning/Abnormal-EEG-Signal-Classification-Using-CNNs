dataFolder = 'edf';
param = initializeParameters();

trainAndTestFiles = dir(fullfile(dataFolder,'**','*.edf'));
trainAndTestFiles = fullfile({trainAndTestFiles.folder},{trainAndTestFiles.name});

judgeFiles = cellfun(@(x)eegFileCleaner(x,param),trainAndTestFiles,"UniformOutput",false);

excludeFileList = trainAndTestFiles(matches(judgeFiles,"bad")');
excludeFileList = erase(excludeFileList,pwd);

function dataOut = eegFileCleaner(filename, params) %to read clean files
    try
        record = edfread(filename);
    catch
        dataOut = 'bad';
        return;
    end
    if (height(record) < params.max_recording_mins*60)
        dataOut = 'bad';
        return;
    end    
    dataOut = 'good';   
end