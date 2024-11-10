function [SpinX, SpinY, SpinZ] = auxil_SpinState_ProfileZ(SPINSTATE, BOXPARA)

Spin_curr = SPINSTATE.SpinX;
Spin_curr = reshape(Spin_curr,...
    BOXPARA.PosXNum,...
    BOXPARA.PosYNum,...
    BOXPARA.PosZNum,...
    BOXPARA.B0Num,...
    BOXPARA.B1Num,...
    BOXPARA.T1Num,...
    BOXPARA.T2Num);
Spin_mean = mean(mean(Spin_curr, 1), 2);
SpinX = Spin_mean;

Spin_curr = SPINSTATE.SpinY;
Spin_curr = reshape(Spin_curr,...
    BOXPARA.PosXNum,... 
    BOXPARA.PosYNum,...
    BOXPARA.PosZNum,...
    BOXPARA.B0Num,...
    BOXPARA.B1Num,...
    BOXPARA.T1Num,...
    BOXPARA.T2Num);
Spin_mean = mean(mean(Spin_curr, 1), 2);
SpinY = Spin_mean;

Spin_curr = SPINSTATE.SpinZ;
Spin_curr = reshape(Spin_curr,...
    BOXPARA.PosXNum,...
    BOXPARA.PosYNum,...
    BOXPARA.PosZNum,...
    BOXPARA.B0Num,...
    BOXPARA.B1Num,...
    BOXPARA.T1Num,...
    BOXPARA.T2Num);
Spin_mean = mean(mean(Spin_curr, 1), 2);
SpinZ = Spin_mean;

end