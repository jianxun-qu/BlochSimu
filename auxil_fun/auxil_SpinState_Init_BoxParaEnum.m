function SPINSTATE = auxil_SpinState_Init_BoxParaEnum(BOXPARA)

% Enumerate [ B0 B1 T1 T2 ]

SPINSTATE = auxil_SpinState_Init();

SPINSTATE.SpinX = zeros(1, BOXPARA.SpinNum);
SPINSTATE.SpinY = zeros(1, BOXPARA.SpinNum);
SPINSTATE.SpinZ = ones(1, BOXPARA.SpinNum);

[PosX, PosY, PosZ, B0, B1, T1, T2] = ndgrid(...
    BOXPARA.PosXArr,...
    BOXPARA.PosYArr,...
    BOXPARA.PosZArr,...
    BOXPARA.B0Arr,...
    BOXPARA.B1Arr,...
    BOXPARA.T1Arr,...
    BOXPARA.T2Arr);

SPINSTATE.PosX = reshape(PosX, 1, []);
SPINSTATE.PosY = reshape(PosY, 1, []);
SPINSTATE.PosZ = reshape(PosZ, 1, []);
SPINSTATE.B0 = reshape(B0, 1, []);
SPINSTATE.B1 = reshape(B1, 1, []);
SPINSTATE.T1 = reshape(T1, 1, []);
SPINSTATE.T2 = reshape(T2, 1, []);

end