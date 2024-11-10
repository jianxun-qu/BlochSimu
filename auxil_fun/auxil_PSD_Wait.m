function WaitSBB = auxil_PSD_Wait(duration)

WaitSBB = auxil_PSD_Init();

WaitSBB.tp_arr = [0, duration];
WaitSBB.rho_arr = [0, 0];
WaitSBB.phs_arr = [0, 0];
WaitSBB.gx_arr = [0, 0];
WaitSBB.gy_arr = [0, 0];
WaitSBB.gz_arr = [0, 0];

end