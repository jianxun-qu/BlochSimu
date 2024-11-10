function BOXPARA = auxil_BoxParaEnum_Process(BOXPARA)

% Position uses equal distribution

PosXArr = linspace(BOXPARA.PosXLim(1), BOXPARA.PosXLim(2), BOXPARA.PosXNum+1);
PosXArr = PosXArr(1 : (end - 1));
PosYArr = linspace(BOXPARA.PosYLim(1), BOXPARA.PosYLim(2), BOXPARA.PosYNum+1);
PosYArr = PosYArr(1 : (end - 1));
PosZArr = linspace(BOXPARA.PosZLim(1), BOXPARA.PosZLim(2), BOXPARA.PosZNum+1);
PosZArr = PosZArr(1 : (end - 1));

BOXPARA.PosXArr = PosXArr;
BOXPARA.PosYArr = PosYArr;
BOXPARA.PosZArr = PosZArr;

% B0/B1 uses customized distrubtion

BOXPARA.B0Num = length(BOXPARA.B0Arr);
BOXPARA.B1Num = length(BOXPARA.B1Arr);

% T1/T2 uses customized distrubtion

BOXPARA.T1Num = length(BOXPARA.T1Arr);
BOXPARA.T2Num = length(BOXPARA.T2Arr);

BOXPARA.SpinNum = ...
    BOXPARA.PosXNum * ...
    BOXPARA.PosYNum * ...
    BOXPARA.PosZNum * ...
    BOXPARA.B0Num * ...
    BOXPARA.B1Num * ...
    BOXPARA.T1Num * ...
    BOXPARA.T2Num;

end
