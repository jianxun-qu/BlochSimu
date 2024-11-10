function GradSBB = auxil_PSD_Grad_Rect(moment, duration)

    GradSBB = auxil_PSD_Init();
            
    gx_amp = moment(1) / duration;
    gy_amp = moment(2) / duration;
    gz_amp = moment(3) / duration;
    
    GradSBB.tp_arr = [0, duration];
    GradSBB.rho_arr = [0, 0];
    GradSBB.phs_arr = [0, 0];
    GradSBB.gx_arr = [gx_amp, gx_amp];
    GradSBB.gy_arr = [gy_amp, gy_amp];
    GradSBB.gz_arr = [gz_amp, gz_amp];

end