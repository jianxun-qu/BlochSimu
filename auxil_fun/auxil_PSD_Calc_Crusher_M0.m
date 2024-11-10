function M0 = auxil_PSD_Calc_Crusher_M0(PixelSize, phase)

    M0_2PI_1mm = 1000/42.5; % [ mT/m * ms ]
    M0 = M0_2PI_1mm / PixelSize * (phase / (pi*2));
    M0 = M0 * 1000; % [ mT/m * us ]

end