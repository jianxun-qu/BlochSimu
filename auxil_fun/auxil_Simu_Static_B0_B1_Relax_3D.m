function SPINSTATE = auxil_Simu_Static_B0_B1_Relax_3D(SPINSTATE, PSD)

    SpinX = SPINSTATE.SpinX;
    SpinY = SPINSTATE.SpinY;
    SpinZ = SPINSTATE.SpinZ;
    PosX = SPINSTATE.PosX;
    PosY = SPINSTATE.PosY;
    PosZ = SPINSTATE.PosZ;    
    B0 = SPINSTATE.B0;
    B1 = SPINSTATE.B1;
    T1 = SPINSTATE.T1;
    T2 = SPINSTATE.T2;
    
    rho_run = PSD.rho_arr;
    phs_run = PSD.phs_arr;
    gx_run = PSD.gx_arr;
    gy_run = PSD.gy_arr;
    gz_run = PSD.gz_arr;
    tp_run = PSD.tp_arr / 1000;
    
    [SpinX, SpinY, SpinZ] = Simu_Static_B0_B1_Relax_3D(...
        SpinX, SpinY, SpinZ,...
        T1, T2,...
        PosX, PosY, PosZ,...
        B0, B1,...
        rho_run, phs_run,...
        gx_run, gy_run, gz_run,...
        tp_run);
    
    SPINSTATE.SpinX = SpinX;
    SPINSTATE.SpinY = SpinY;
    SPINSTATE.SpinZ = SpinZ;

end