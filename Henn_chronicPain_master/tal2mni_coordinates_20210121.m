% Read in coordinates
%addpath C:\Users\Alina\Desktop\Henn_Pain-master_18.04-2021
coordinates=readtable('coordinates_20210418.csv');

%readtable('coordinates_20210121.csv', 'Delimiter',';')


% Setup new columns for MNI space XYZ
coordinates.mni_x=NaN([802 1]);
coordinates.mni_y=NaN([802 1]);
coordinates.mni_z=NaN([802 1]);

% Convert anything Tal to MNI
for i=1:756
    if strcmp(coordinates.space(i), 'MNI')
        coordinates.mni_x(i)=coordinates.x(i);
        coordinates.mni_y(i)=coordinates.y(i);
        coordinates.mni_z(i)=coordinates.z(i);
    else
        % Temporarily save Tal coordinates and transformed MNI coordinates
        tal_coords = ([coordinates.x(i) coordinates.y(i) coordinates.z(i)]);
        mni_coords = my_tal2icbm_spm(tal_coords);
        % Fill in coordinates with transformed ones
        coordinates.mni_x(i) = mni_coords(1);
        coordinates.mni_y(i) = mni_coords(2);
        coordinates.mni_z(i) = mni_coords(3);
    end
end 

% Export
writetable(coordinates, 'coordinatesMNI_20210418.csv', 'Delimiter', ',');