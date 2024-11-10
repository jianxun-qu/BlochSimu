function SPINSTATE = auxil_SpinState_Init_BoxPara(BOXPARA)

SPINSTATE = auxil_SpinState_Init();

SPINSTATE.SpinX = zeros(1, BOXPARA.SpinNum);
SPINSTATE.SpinY = zeros(1, BOXPARA.SpinNum);
SPINSTATE.SpinZ = ones(1, BOXPARA.SpinNum);

[PosX, PosY, PosZ] = ndgrid(...
    BOXPARA.PosXArr,...
    BOXPARA.PosYArr,...
    BOXPARA.PosZArr);

SPINSTATE.PosX = reshape(PosX, 1, []);
SPINSTATE.PosY = reshape(PosY, 1, []);
SPINSTATE.PosZ = reshape(PosZ, 1, []);

end