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


%% Main analysis: all structural modalities, all pain conditions;
% Input
ale_inputCoords('aberrant_all.xls'); % Aberrant
ale_inputCoords('painCoords_all.xls'); % Patients (signed)
% Compute
ale_estimateALE('pain_all.xlsx');

%% Feature-specific analysis: gray matter, all pain conditions;
% Input
ale_inputCoords('aberrant_GM.xls'); % Patients vs HC
ale_inputCoords('painCoords_GM.xls'); % Aberrant
% Compute
ale_estimateALE('pain_GM.xlsx');

%% Feature-specific analysis: cortical thickness, all pain conditions;
% Input
ale_inputCoords('aberrant_CT.xls'); % Aberrant
ale_inputCoords('painCoords_CT.xls'); % Patients vs HC
% Compute
ale_estimateALE('pain_CT.xlsx');


%% SENSITIVITY ANALYSES
%% Sensitivity analysis: Main analysis
% Input
ale_inputCoords('aberrant_all_sensitivity_analysis.xls'); % Aberrant
ale_inputCoords('painCoords_all_sensitivity_analysis.xls'); % Patients (signed)
% Compute
ale_estimateALE('pain_all_sensitivity_analysis.xlsx');

%% Sensitivity analysis: gray matter, all pain conditions;
% Input
ale_inputCoords('painCoords_GM_sensitivity_analysis.xls'); % Patients vs HC
ale_inputCoords('aberrant_GM_sensitivity_analysis.xls'); % Aberrant
% Compute
ale_estimateALE('pain_GM_sensitivity_analysis.xlsx');

%% Sensitivity analysis: cortical thickness, all pain conditions;
% Input
ale_inputCoords('aberrant_CT_sensitivity_analysis.xls'); % Aberrant
ale_inputCoords('painCoords_CT_sensitivity_analysis.xls'); % Patients vs HC
% Compute
ale_estimateALE('pain_CT_sensitivity_analysis.xlsx');













