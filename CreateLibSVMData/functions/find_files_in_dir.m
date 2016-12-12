function [file_names] =find_files_in_dir(strSearchDir)
%File Name:   FindFilesInDir.m
%Parameters:  strSearchDir ---- a string that contains path to search.
%             FileNames ---- a global cell matrix contains full file names.
%Description: Find all image files in the specified folder.
%Affiliation: National Engineering Research Center for Advanced Rolling,
%             University of Science and Technology Beijing, Beijing, China.
%Date Time:   2008-03-21
clear global FileNames;
global FileNames;
CurrFiles=dir(strSearchDir);
for i = 1:size(CurrFiles,1)
    if(CurrFiles(i,1).bytes > 0)
        strFile =  CurrFiles(i,1).name;
        if(strSearchDir(length(strSearchDir)) == '/')
            strFullName = [strSearchDir strFile];
        else
            strFullName = [strSearchDir '/' strFile];
        end
        if(isdir(strFullName))
            if(strcmpi(strFile,'.') || strcmpi(strFile,'..'))
                continue;
            end
        else
            strExtName= deblank(strFile);
            strExtName = strExtName((length(strExtName)-3):end);
            if( strcmpi(strExtName, '.bmp') || ...
                strcmpi(strExtName, '.jpg') || ...
                strcmpi(strExtName, '.png')  )
                  FileNames{size(FileNames,1)+1,1} = strFullName;
            end
        end
    end
end

file_names = FileNames;