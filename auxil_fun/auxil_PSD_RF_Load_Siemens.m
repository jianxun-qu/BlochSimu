function rf_sbb = auxil_PSD_RF_Load_Siemens(rf_siemens, duration, flipangle, thickness)

    rf_refthickness = 10; % [ mm ]
    rf_refdwelltime = 10; % [ us ]

    rf_rho = rf_siemens.waveform(:,1);
    
    rf_rho = rf_rho / sum(rf_rho) * flipangle;
    
    rf_phs = rf_siemens.waveform(:,2);    
    rf_res = length(rf_rho);
    
    rf_refduration = rf_res * rf_refdwelltime;    
    rf_refgrad = rf_siemens.REFGRAD;
    
    gz_amp = rf_refgrad * rf_refduration / duration * rf_refthickness / thickness;
    
    tp_arr = linspace(0, duration, rf_res+1);
    rho_arr = [reshape(rf_rho, 1, []), 0];
    phs_arr = [reshape(rf_phs, 1, []), 0];
    gx_arr = ones(size(tp_arr)) * 0;
    gy_arr = ones(size(tp_arr)) * 0;
    gz_arr = ones(size(tp_arr)) * gz_amp;
    
    rf_sbb = auxil_PSD_Init();
    
    rf_sbb.tp_arr = tp_arr;
    rf_sbb.rho_arr = rho_arr;
    rf_sbb.phs_arr = phs_arr;
    rf_sbb.gx_arr = gx_arr;
    rf_sbb.gy_arr = gy_arr;
    rf_sbb.gz_arr = gz_arr;
    
end