% Main script for calibration and 3D reconstruction 
% Before running this function create your own config file
% using template_config_file.m as reference
%
% Copyright (c) 2019 Swathi Sheshadri
% German Primate Center
% swathishesh AT gmail DOT com
%
% If used in published work please see repository README.md for citation
% and license information: https://github.com/SwathiSheshadri/pose3d

clear 
close all

clc

cd('E:\Thesis\01_Projects\03_ExR\15_MS_related\Pose3D')

%% Initializes experiment parameters as provided in your config file 
% config_file;
config_file_ExR_calibration_for_trajectories;

%% Call for calibration 
%  calibration_helper


%% Load and undistort 2D data if requested in config file
 load_preprocess_2d_data

%% Perform 3D reconstruction - modifications by Zurna to calculate mean reprojection errors
mean_reprojErr=[];
mn_reprojErr =[];
reconstruct_3D;

%% reprojection error 
% calculate reprojection error
% for i=1:size(mn_reprojErr,1)
%     means(i) = mean(mn_reprojErr(i,:));
% end
% avg_reprojErr_mean = mean(means);
% avg_reprojErr_std = std(means);
% feature_maxErr = find (means == max(means));
% feature_minErr = find (means == min(means));
% 
% disp(['Average error (pixel) for reconstruction  ' num2str(avg_reprojErr_mean) '.'])
% disp(['Feature number ' num2str(feature_minErr) ' has the lowest reprojection error with ' num2str(min(means)) ' pixel.'])
% disp(['Feature number ' num2str(feature_maxErr) ' has the highest reprojection error with ' num2str(max(means)) ' pixel.'])
% 
% mm_avg_reprojErr_mean = mean(means*1.87);
% mm_avg_reprojErr_std = std(means*1.87);


















% figure;
% subplot (1,2,1)
% plot ([1:length(means)],means,'k*')
% hold on
% plot ([1,length(means)],[avg_reprojErr_mean,avg_reprojErr_mean],'r-')
% xticks ([0:1:nfeatures])
% ylim ([0,100])
% yticks ([0:2:100])
% xlabel('feature #')
% ylabel ('avg reproj Error in pixel')
% 
% subplot (1,2,2)
% plot ([1:length(means)],means*1.87,'k*')
% hold on
% plot ([1,length(means)],[mm_avg_reprojErr_mean,mm_avg_reprojErr_mean],'r-')
% plot ([1,length(means)],[6,6],'k:')
% xticks ([0:1:nfeatures])
% ylim ([0,100])
% yticks ([0:2:100])
% xlabel('feature #')
% ylabel ('avg reproj Error in mm')


%%
% Plot 3D reconstructed data
% calc_error = 0;
% simple_3Ddata_plotter %To quickly vizualizate 3D reconstruction results
