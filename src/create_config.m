function [ settingsSaveDir ] = create_config(SettingsFolder,mode)
    waitfor(msgbox('Select a folder that all results will be saved to.','Setup'));
    firstCheck = 1;
    folderCancel = 0;
    while(firstCheck == 1 || folderCancel == 1)
        settingsSaveDir = uigetdir(getenv('userprofile'), 'Select the folder in which all results will be saved');
        if(settingsSaveDir == 0)
            waitfor(msgbox('A directory must be selected'));
            folderCancel = 1;
        else
            folderCancel = 0;
        end
        firstCheck = 0;
    end 
    fID = fopen([SettingsFolder '\settings.txt'],'w+t');
    fprintf(fID,['####################################################################################################\n'...
        'DO NOT EDIT THIS FILE MANUALLY\n'...
        'IF CHANGES ARE ACCIDENTALLY MADE TO THIS FILE THEN DELETE IT AND THE PROGRAM WILL GENERATE A NEW ONE\n'...
        '####################################################################################################\n'...
        '\n'...
        'save_dir = %s'],settingsSaveDir);
    switch mode
        case 0
            waitfor(msgbox('The configuration was successfully created. The configuration can be changed at any time by clicking the "Settings" button in the main program window','Setup'));
        case 1
            waitfor(msgbox('The configuration was successfully changed. ','Setup'));
    end
end

