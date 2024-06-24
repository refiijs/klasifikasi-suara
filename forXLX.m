
auDir = 'C:\Users\acera\OneDrive\Documents\MATLAB\klasifikasiSuara\dataset';
outputFile = 'dataset.xlsx';

% Get list of genres (subdirectories in the main directory)
gender = dir(auDir);
gender = gender([gender.isdir] & ~ismember({gender.name}, {'.', '..'})); % Filter out '.' and '..'

% Initialize cell array to store filenames and classes
data = {'Filename', 'Class'};

% Loop through each genre directory
for i = 1:length(gender)
    genderName = gender(i).name;
    genderDir = fullfile(auDir, genderName);
    
    % Get list of all WAV files in the genre directory
    wavFiles = dir(fullfile(genderDir, '*.wav'));
    
    % Loop through each file and store the filename and class
    for j = 1:length(wavFiles)
        filename = fullfile(genderDir, wavFiles(j).name);
        data = [data; {filename, genderName}]; %#ok<AGROW>
    end
end

% Write data to Excel file
writecell(data, outputFile);

% Display completion message
fprintf('Data has been written to %s\n', outputFile);

