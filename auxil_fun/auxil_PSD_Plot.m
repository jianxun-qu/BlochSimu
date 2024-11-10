function auxil_PSD_Plot(stb_src)

tp_arr = stb_src.tp_arr;
gx_arr = stb_src.gx_arr;
gy_arr = stb_src.gy_arr;
gz_arr = stb_src.gz_arr;
rho_arr= stb_src.rho_arr;
phs_arr = stb_src.phs_arr;

stb_time = tp_arr(end);

f1 = figure;
set(f1, 'Color', [1,1,1])

subplot(10,1,[1,2]), stairs(tp_arr, rho_arr, 'LineWidth', 2); xlim([0 stb_time]); ylabel('Rel RF Rho <uT>')
subplot(10,1,[3,4]), stairs(tp_arr, phs_arr, 'LineWidth', 2); xlim([0 stb_time]); ylabel('RF Phase <Rad>')
subplot(10,1,[5,6]), plot(tp_arr, gx_arr, 'LineWidth', 2); xlim([0 stb_time]); grid on; ylabel('Gx <mT/m>')
subplot(10,1,[7,8]), plot(tp_arr, gy_arr, 'LineWidth', 2); xlim([0 stb_time]); grid on; ylabel('Gy <mT/m>')
subplot(10,1,[9,10]), plot(tp_arr, gz_arr, 'LineWidth', 2); xlim([0 stb_time]); grid on; ylabel('Gz <mT/m>'); xlabel(' Time <us>')

end