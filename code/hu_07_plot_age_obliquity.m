%% ******************************* STEP 07 ********************************
% Plot the past and present obliquity of Mars, numerically integrated and
% statistically constrained, from multiple sources.
%                                                            James Hu, 2022
% *************************************************************************

% 1. Load data
obl_data = [66 8];
obl_errhigh = [8.60978819 6.441972424];
obl_errlow = [9.830129137 8];

obl_pert_data = [63 14];
obl_pert_errhigh = [9.037343765 6.502919546];
obl_pert_errlow = [8.282013483 7.70412747];

load('iaerr_perts/chi2_sims_rdc_p_mins_lAv.mat','chi2_sims_rdc_p_mins')
chi2_sims_rdc_p_mins_p = chi2_sims_rdc_p_mins;
load('iaerr_perts/chi2_sims_rdc_p_mins_AHv.mat','chi2_sims_rdc_p_mins')
chi2_sims_rdc_p_mins_r = chi2_sims_rdc_p_mins;
clear chi2_sims_rdc_p_mins

age_data = [0.9472566667 2.0108057143].*1e3;
age_err = [0.0218016667 0.0152742857].*1e3;


% 2. Plot late Amazonian volcanic unit
fig1 = figure(1);
hold on

set(gca, 'XScale', 'log')
x1 = [21 age_data(1) age_data(1) 21];
y1 = [obl_data(1)-obl_errlow(1) obl_data(1)-obl_errlow(1)...
      obl_data(1)+obl_errhigh(1) obl_data(1)+obl_errhigh(1)];
y1_pert = [obl_pert_data(1)-obl_pert_errlow(1)...
           obl_pert_data(1)-obl_pert_errlow(1)...
           obl_pert_data(1)+obl_pert_errhigh(1)...
           obl_pert_data(1)+obl_pert_errhigh(1)];
x1e = [age_data(1)-age_err(1) age_data(1)+age_err(1)...
       age_data(1)+age_err(1) age_data(1)-age_err(1)];

patch(x1e,y1,'white','EdgeColor','#8D6135','LineStyle','--')
patch(x1e,y1_pert,'white','EdgeColor','#74C1E4','LineStyle','--')
for i = 1:1000
    patchline([21 age_data(1)],[chi2_sims_rdc_p_mins_p(i)...
                                chi2_sims_rdc_p_mins_p(i)],...
              'edgecolor','#74C1E4','linewidth',5,'edgealpha',0.01)
end

plot([21 age_data(1)],[obl_data(1) obl_data(1)],'Color','#8D6135',...
     'LineWidth',2)
plot([21 age_data(1)],[obl_pert_data(1) obl_pert_data(1)],'Color',...
     '#74C1E4','LineWidth',2)

plot([21 age_data(1)],[obl_data(1)+obl_errhigh(1)...
                       obl_data(1)+obl_errhigh(1)],'Color','#8D6135',...
     'LineStyle','--','LineWidth',0.75)
plot([21 age_data(1)],[obl_data(1)-obl_errlow(1)...
                       obl_data(1)-obl_errlow(1)],'Color','#8D6135',...
     'LineStyle','--','LineWidth',0.75)

plot([21 age_data(1)],[obl_pert_data(1)+obl_pert_errhigh(1)...
                       obl_pert_data(1)+obl_pert_errhigh(1)],'Color',...
     '#74C1E4','LineStyle','--','LineWidth',0.75)
plot([21 age_data(1)],[obl_pert_data(1)-obl_pert_errlow(1)...
                       obl_pert_data(1)-obl_pert_errlow(1)],'Color',...
     '#74C1E4','LineStyle','--','LineWidth',0.75)

plot([age_data(1) age_data(1)],[obl_data(1)+obl_errhigh(1)...
                                obl_data(1)-obl_errlow(1)],'Color',...
     '#8D6135')

% 3. Plot Amazonian–Hesperian volcanic unit
x2 = [21 age_data(2) age_data(2) 21];
y2 = [obl_data(2)-obl_errlow(2) obl_data(2)-obl_errlow(2)...
      obl_data(2)+obl_errhigh(2) obl_data(2)+obl_errhigh(2)];
y2_pert = [obl_pert_data(2)-obl_pert_errlow(2)...
           obl_pert_data(2)-obl_pert_errlow(2)...
           obl_pert_data(2)+obl_pert_errhigh(2)...
           obl_pert_data(2)+obl_pert_errhigh(2)];

x2e = [age_data(2)-age_err(2) age_data(2)+age_err(2)...
       age_data(2)+age_err(2) age_data(2)-age_err(2)];
patch(x2e,y2,'white','EdgeColor','#8D6135','LineStyle','--')

patch(x2e,y2_pert,'white','EdgeColor','#74C1E4','LineStyle','--')

for i = 1:1000
    patchline([21 age_data(2)],[chi2_sims_rdc_p_mins_r(i)...
                                chi2_sims_rdc_p_mins_r(i)],...
              'edgecolor','#74C1E4','linewidth',5,'edgealpha',0.01)
end


plot([21 age_data(2)],[obl_data(2) obl_data(2)],'Color','#8D6135',...
     'LineWidth',2)
plot([21 age_data(2)],[obl_pert_data(2) obl_pert_data(2)],'Color',...
     '#74C1E4','LineWidth',2)

plot([21 age_data(2)],[obl_data(2)+obl_errhigh(2)...
                       obl_data(2)+obl_errhigh(2)],'Color','#8D6135',...
     'LineStyle','--','LineWidth',0.75)
plot([21 age_data(2)],[obl_data(2)-obl_errlow(2)...
                       obl_data(2)-obl_errlow(2)],'Color','#8D6135',...
     'LineStyle','--','LineWidth',0.75)

plot([21 age_data(2)],[obl_pert_data(2)+obl_pert_errhigh(2)...
                       obl_pert_data(2)+obl_pert_errhigh(2)],'Color',...
     '#74C1E4','LineStyle','--','LineWidth',0.75)
plot([21 age_data(2)],[obl_pert_data(2)-obl_pert_errlow(2)...
                       obl_pert_data(2)-obl_pert_errlow(2)],'Color',...
     '#74C1E4','LineStyle','--','LineWidth',0.75)

plot([age_data(2) age_data(2)],[obl_data(2)+obl_errhigh(2)...
                                obl_data(2)-obl_errlow(2)],'Color',...
     '#8D6135')

% 4. Laskar numerical reverse integration
load('laskar/laskar_chaotic1.mat')
patchline(laskar1(:,1).*-1e-3,rad2deg(laskar1(:,2)),'linestyle','--',...
          'edgecolor',[0.9290 0.6940 0.1250],'linewidth',0.5,...
          'edgealpha',0.01);
load('laskar/laskar_chaotic2.mat')
patchline(laskar2(:,1).*-1e-3,rad2deg(laskar2(:,2)),'linestyle','--',...
          'edgecolor',[0.4940 0.1840 0.5560],'linewidth',0.5,...
          'edgealpha',0.01);
load('laskar/laskar_chaotic3.mat')
patchline(laskar3(:,1).*-1e-3,rad2deg(laskar3(:,2)),'linestyle','--',...
          'edgecolor',[0.4660 0.6740 0.1880],'linewidth',0.5,...
          'edgealpha',0.01);
load('laskar/laskar_chaotic4.mat')
patchline(laskar4(:,1).*-1e-3,rad2deg(laskar4(:,2)),'linestyle','--',...
          'edgecolor',[0.8500 0.3250 0.0980],'linewidth',0.5,...
          'edgealpha',0.01);
load('laskar/laskar_chaotic5.mat')
patchline(laskar5(:,1).*-1e-3,rad2deg(laskar5(:,2)),'linestyle','--',...
          'edgecolor',[0.6350 0.0780 0.1840],'linewidth',0.5,...
          'edgealpha',0.01);

load('laskar/laskar_nonchaotic.mat')
plot(laskar(:,1).*-1e-3,rad2deg(laskar(:,2)),'Color',...
     [0.6350 0.0780 0.1840],'LineWidth',1)
scatter(1e-1,25.1,120,'x','LineWidth',1,'MarkerEdgeColor','k')

% 5. Processing
xt = [13 12 3e-1];
yt = [obl_data(1) obl_data(2) 40];
str = {'lAv','AHv','Laskar et al. (2010)'};
text(xt,yt,str)

xlim([1e-1 4.603e3])
ylim([0 90])
ylabel('Obliquity (°)')
xlabel('Age (Ma)')

l2 = legend('','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','','','','','','','','','','','','','','','','','','',...
            '','','Observed','Perturbed');
l2.Orientation = 'vertical';

fig1.PaperUnits = 'centimeters';
fig1.PaperPosition = [0 0 24 16];
print(fig1,'output/fig3_3','-dpng','-r500')