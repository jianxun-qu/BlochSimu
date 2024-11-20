clear all
close all
clc

addpath ./auxil_fun/
addpath ./compiled/
addpath ./RF/

% Protocol Para
Prot_Thickness = 10; % [ mm ]
Prot_MT_Num = 50;

% Phantom Para
T1 = -1; % [ ms ]
T2 = -1; % [ ms ]

% Simulation Box Parameter

BOXPARA = auxil_BoxParaEnum_Init();

BOXPARA.PosXNum = 1;
BOXPARA.PosYNum = 1;
BOXPARA.PosZNum = 2 * Prot_MT_Num - 1; 
BOXPARA.PosXLim = [-1, 1] * 0;
BOXPARA.PosYLim = [-1, 1] * 0;
BOXPARA.PosZLim = [-1, 1] * 2;
BOXPARA.B0Arr = [-5:0.02:5] * 42.5 * 7; % [ ppm ]
BOXPARA.B1Arr = 1;
BOXPARA.T1Arr = 4000;
BOXPARA.T2Arr = 500;

BOXPARA = auxil_BoxParaEnum_Process(BOXPARA);

% Sequence Pulse Parameter
PSD_RF_MT_Duration = 512 * 10 * 4;
PSD_Crusher_Duration = 10;

% Prep RF Pulse
RF_REF = [];
load('GAUSS5120_B375.mat');
RF_REF = rf;

SBB_MT_RF = auxil_PSD_RF_Load_Siemens(RF_REF, PSD_RF_MT_Duration, 90/180*pi, Prot_Thickness);
SBB_MT_RF.gz_arr = SBB_MT_RF.gz_arr * 0;
% auxil_PSD_Plot(SBB_MT_RF);

% Prep Crusher
Crusher_M0 = auxil_PSD_Calc_Crusher_M0(2, pi*4);
SBB_Crsusher = auxil_PSD_Grad_Rect([Crusher_M0, Crusher_M0, Crusher_M0], PSD_Crusher_Duration);
% auxil_PSD_Plot(SBB_Crsusher);

% SpinState

SPINSTATE = auxil_SpinState_Init_BoxParaEnum(BOXPARA);

% Run Simulation

SBB_MT_RF = auxil_PSD_RF_Freq_Phase(SBB_MT_RF, 42.5 * 7 * (0.0), 0);

for idx = 1:Prot_MT_Num
    
    SBB_MT_RF = auxil_PSD_RF_Freq_Phase(SBB_MT_RF, 0, 3);

    SPINSTATE = auxil_Simu_Static_B0_B1_Relax_3D(SPINSTATE, SBB_MT_RF);
    
    SPINSTATE = auxil_Simu_Static_B0_B1_Relax_3D(SPINSTATE, SBB_Crsusher);
    
    [SpinX, SpinY, SpinZ] = auxil_SpinState_PixelMean(SPINSTATE, BOXPARA);
     
    if rem(idx,10)==0
        figure(3), plot(BOXPARA.B0Arr/(42.5 * 7), squeeze(SpinZ)); hold on; pause (0.05)
    end

end

% Plot

[SpinX, SpinY, SpinZ] = auxil_SpinState_PixelMean(SPINSTATE, BOXPARA);
figure(3), plot(BOXPARA.B0Arr/(42.5 * 7), squeeze(SpinZ))