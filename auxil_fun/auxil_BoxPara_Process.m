function BOXPARA = auxil_BoxPara_Process(BOXPARA)

PosXArr = linspace(BOXPARA.PosXLim(1), BOXPARA.PosXLim(2), BOXPARA.PosXNum+1);
PosXArr = PosXArr(1 : (end - 1));
PosYArr = linspace(BOXPARA.PosYLim(1), BOXPARA.PosYLim(2), BOXPARA.PosYNum+1);
PosYArr = PosYArr(1 : (end - 1));
PosZArr = linspace(BOXPARA.PosZLim(1), BOXPARA.PosZLim(2), BOXPARA.PosZNum+1);
PosZArr = PosZArr(1 : (end - 1));

B0Arr = linspace(BOXPARA.B0Lim(1), BOXPARA.B0Lim(2), BOXPARA.B0Num);
B1Arr = linspace(BOXPARA.B1Lim(1), BOXPARA.B1Lim(2), BOXPARA.B1Num);

BOXPARA.PosXArr = PosXArr;
BOXPARA.PosYArr = PosYArr;
BOXPARA.PosZArr = PosZArr;
BOXPARA.B0Arr = B0Arr;
BOXPARA.B1Arr = B1Arr;

BOXPARA.SpinNum = ...
    BOXPARA.PosXNum * ...
    BOXPARA.PosYNum * ...
    BOXPARA.PosZNum * ...
    BOXPARA.B0Num * ....
    BOXPARA.B1Num;

end
