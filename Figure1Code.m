%% Code for generating data containing panels B-D in Figure 1

%% Panel B
load('Figure1Data')
H = figure;
set(H,'position',[100 100 400 600])
hold on
count = 0;
for i = 1:22
    plotDat(i,:) = zscore(LFP_SEG_MEAN(i,:))-(count*10);
    plot(plotDat(i,:),'k','linewidth',1.5)
    count = count+1;
end
xlabel('Time from stim (ms)')
ylabel('Electrode Depth (\muM)')
xlim([150 400])
ylim([-195 10])
set(gca,'xtick',200:100:400,'xticklabel',0:100:200,'ytick',-200:40:0,'yticklabel',2000:-400:0,'fontsize',14,'linewidth',1.5)

%% Panel C
load('Figure1Data')
H = figure;
set(H,'position',[100 100 400 600])

Twin = 200;
CSD = CSD_SEG_MEAN;
CSD= CSD.*1e-6; %V
CSD = (CSD./(100*1e-6))./(100*1e-6); %V/(m^2)
CSD = CSD.*0.4; %A/m3
CSD = CSD.*1e6; %uA/m3
CSD = CSD./1e9; %uA/mm3

hold on
x = -Twin:Twin;
cmap = colormap_redblackblue();
I_FACTOR = 10;
CSD_max = max(abs(M.ZI(:)));
imagesc(x,1:size(M.ZI,1),M.ZI);
set(gca,'Clim',[-CSD_max CSD_max]);
colormap(cmap);
axis tight
set(gca,'YDir','reverse');
set(gca,'Ytick',0:50:300);
set(gca,'Yticklabel',0:500:3000)
set(gca,'Xlim',[-30 Twin]);

set(gca,'fontsize',11)
xlabel('Time from flash (ms)')
ylabel('Distance (\mum)')
xlim([0 200])
ylim([1 200])
set(gca,'xtick',0:100:200,'xticklabel',0:100:200)
c = colorbar;
c.Label.String = '\muA / mm^3';


%% Panel D
H = figure;
set(H,'position',[100 100 400 600])

Twin = 200;
CSD = marmCSD;
CSD= CSD.*1e-6; %V
CSD = (CSD./(100*1e-6))./(100*1e-6); %V/(m^2)
CSD = CSD.*0.4; %A/m3
CSD = CSD.*1e6; %uA/m3
CSD = CSD./1e9; %uA/mm3

hold on
x = -Twin:Twin;
cmap = colormap_redblackblue();
I_FACTOR = 10;
CSD_max = max(abs(marmM.ZI(:)));
imagesc(x,1:size(marmM.ZI,1),marmM.ZI);
set(gca,'Clim',[-CSD_max CSD_max]);
colormap(cmap);
axis tight
set(gca,'YDir','reverse');
set(gca,'Ytick',0:50:300);
set(gca,'Yticklabel',0:500:3000)
set(gca,'Xlim',[-30 Twin]);

set(gca,'fontsize',11)
xlabel('Time from flash (ms)')
ylabel('Distance (\mum)')
xlim([-50 150])
ylim([1 175])
set(gca,'xtick',-50:100:150,'xticklabel',0:100:200)
c = colorbar;
c.Label.String = '\muA / mm^3';