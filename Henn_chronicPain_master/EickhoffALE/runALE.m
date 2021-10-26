%% Compute ALE for Chronic Pain Meta-analysis Project
% by AX 11/15/2019 modified by ATH 09/08/2020 & 03/04/2021
% -------------------------------------
% This script is a higher-level script that runs all operations pertaining to
% computing ALE (using Eickhoff's scripts)
%   a) thresholds the main effects cspmlusters at z>3.09
%   b) generates the negative & positive contrast images for contrasts
%   c) thresholds the contrast clusters at a liberal threshold of z>1.6 and k>50
%       % N.B. : this will eventually get re-thresholded with FSL at z>3.09
%   d) thresholds the conjunction clusters at z>3.09 and k>15
% -------------------------------------

%% Setup
curPath=genpath(pwd); addpath(curPath); % add the current path
cd EickhoffALE % go to ALE folder


%% all pain conditions, all structural modalities; 09/08/2020
% Input
ale_inputCoords('aberrant_all_20210617.xls'); % Aberrant
ale_inputCoords('painCoords_all_20210617.xls'); % Patients (signed)
% Compute
ale_estimateALE('pain_all_20210617.xlsx');

%% all pain conditions, gray matter; 09/08/2020
% Input
ale_inputCoords('painCoords_GM_20210617.xls'); % Patients vs HC
ale_inputCoords('aberrant_GM_20210617.xls'); % Aberrant
% Compute
ale_estimateALE('pain_GM_20210617.xlsx');

%% all pain conditions, cortical thickness; 09/08/2020
% Input
ale_inputCoords('aberrant_CT_20210617.xls'); % Aberrant
ale_inputCoords('painCoords_CT_20210617.xls'); % Patients vs HC
% Compute
ale_estimateALE('pain_CT_20210617.xlsx');














