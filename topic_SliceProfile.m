clear all
close all
clc

addpath ./auxil_fun/
addpath ./compiled/
addpath ./RF/

% Protocol Para
Prot_Thickness = 10; % [ mm ] 

% Phantom Para
T1 = -1; % [ ms ] % set -1 to turn off Relaxation
T2 = -1; % [ ms ]

% Simulation Box Parameter

BOXPARA = auxil_BoxParaEnum_Init();

BOXPARA.PosXNum = 1; % Number of Position along X direction
BOXPARA.PosYNum = 1; % Number of Position along y direction
BOXPARA.PosZNum = 2000; % Number of Position along z direction
BOXPARA.PosXLim = [-1, 1] * 0; % Simulation Box Boundary in x
BOXPARA.PosYLim = [-1, 1] * 0; % Simulation Box Boundary in y
BOXPARA.PosZLim = [-1, 1] * 100; % Simulation Box Boundary in z
BOXPARA.B0Arr = 0;
BOXPARA.B1Arr = 1; 
BOXPARA.T1Arr = -1;
BOXPARA.T2Arr = -1;

BOXPARA = auxil_BoxParaEnum_Process(BOXPARA);

% Sequence Pulse Parameter
PSD_RF_MT_Duration = 20480;

% Prep RF Pulse
RF_REF = [];
load('GAUSS5120_B375.mat');
RF_REF = rf;

SBB_MT_RF = auxil_PSD_RF_Load_Siemens(RF_REF, PSD_RF_MT_Duration, 90/180*pi, Prot_Thickness);
SBB_MT_RF.phs_arr = SBB_MT_RF.phs_arr;
% figure(1), auxil_PSD_Plot(SBB_MT_RF); % Uncomment to check the Pulse Sequence Time Series

% SpinState

SPINSTATE = auxil_SpinState_Init_BoxParaEnum(BOXPARA);

% Run Simulation

SPINSTATE = auxil_Simu_Static_B0_B1_Relax_3D(SPINSTATE, SBB_MT_RF);

% Plot

SpinX = squeeze(SPINSTATE.SpinX);
SpinY = squeeze(SPINSTATE.SpinY);
SpinZ = squeeze(SPINSTATE.SpinZ);
PosZ = squeeze(SPINSTATE.PosZ);
SpinXY = (SpinX.^2 + SpinY.^2).^0.5;

plot(PosZ, SpinXY, PosZ, SpinZ); grid on
