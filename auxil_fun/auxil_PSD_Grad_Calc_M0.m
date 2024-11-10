function moment = auxil_PSD_Grad_Calc_M0(sbb)

    gx_arr = sbb.gx_arr;
    gy_arr = sbb.gy_arr;
    gz_arr = sbb.gz_arr;
    tp_arr = sbb.tp_arr;
    
    MomentX = 0;
    MomentY = 0;
    MomentZ = 0;
    
    for idx = 1 : (length(tp_arr)-1)
        
        dt = tp_arr(idx+1) - tp_arr(idx);
        
        MomentX = MomentX + (gx_arr(idx) + gx_arr(idx+1)) * dt / 2;
        MomentY = MomentY + (gy_arr(idx) + gy_arr(idx+1)) * dt / 2;
        MomentZ = MomentZ + (gz_arr(idx) + gz_arr(idx+1)) * dt / 2;
    end
    
    moment = [MomentX, MomentY, MomentZ];

end