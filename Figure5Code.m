%% Figure 5 Panels

%% Panel A
load('Figure5Data')
H = figure;
set(H,'position',[100 100 400 600])

Twin = 200;
CSD = goodCSD;
CSD= CSD.*1e-6; %V
CSD = (CSD./(100*1e-6))./(100*1e-6); %V/(m^2)
CSD = CSD.*0.4; %A/m3
CSD = CSD.*1e6; %uA/m3
CSD = CSD./1e9; %uA/mm3

hold on
x = -Twin:Twin;
cmap = colormap_redblackblue();
CSD_max = max(abs(goodM.ZI(:)));
imagesc(x,1:size(goodM.ZI,1),goodM.ZI);
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

%% Panel B
load('Figure5Data')
SPI = expData(36).SPI;
figure
imagesc(SPI)
colormap hot
c = colorbar;
c.Label.String = 'SPI';
ylabel('MUA Electrode Depth (\mum)')
xlabel('LFP Electrode Depth (\mum)')
set(gca,'fontsize',14,'linewidth',1.5,'xticklabel',0:400:2000,'xtick',4:4:24,'yticklabel',0:400:2000,'ytick',4:4:24)
xlim([4 22]); ylim([4 22]);
hold on
plot([expData(36).ChanZero expData(36).ChanZero],[1 32],'r','linewidth',1.5,'linestyle','--')

%% Panel C
load('Figure5Data')
meanPhase = expData(36).MeanPhase;
figure
imagesc(meanPhase)
map = colorcet( 'C2' );
map = circshift(map,1);
colormap(map)
c = colorbar;
hold on
c.Label.String = 'Best Phase (rad)';
ylabel('MUA Electrode Depth (\mum)')
xlabel('LFP Electrode Depth (\mum)')
set(gca,'fontsize',14,'linewidth',1.5,'xticklabel',0:400:2000,'xtick',4:4:24,'yticklabel',0:400:2000,'ytick',4:4:24)
plot([expData(36).ChanZero expData(36).ChanZero],[1 32],'r','linewidth',1.5,'linestyle','--')
xlim([4 22]); ylim([4 22]);


%% Panel D
load('Figure5Data')
H = figure;
set(H,'position',[100 100 400 600])

Twin = 200;
CSD =badCSD;
CSD= CSD.*1e-6; %V
CSD = (CSD./(100*1e-6))./(100*1e-6); %V/(m^2)
CSD = CSD.*0.4; %A/m3
CSD = CSD.*1e6; %uA/m3
CSD = CSD./1e9; %uA/mm3

hold on
x = -Twin:Twin;
cmap = colormap_redblackblue();
CSD_max = max(abs(badM.ZI(:)));
imagesc(x,1:size(badM.ZI,1),badM.ZI);
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
ylim([1 200])
set(gca,'xtick',-50:100:150,'xticklabel',0:100:200)
c = colorbar;
c.Label.String = '\muA / mm^3';

%% Panel E
load('Figure5Data')
SPI = expData(5).SPI;
figure
imagesc(SPI)
colormap hot
c = colorbar;
c.Label.String = 'SPI';
ylabel('MUA Electrode Depth (\mum)')
xlabel('LFP Electrode Depth (\mum)')
set(gca,'fontsize',14,'linewidth',1.5,'xticklabel',0:400:2000,'xtick',4:4:24,'yticklabel',0:400:2000,'ytick',4:4:24)
xlim([4 22]); ylim([4 22]);
hold on
plot([expData(5).ChanZero expData(5).ChanZero],[1 32],'r','linewidth',1.5,'linestyle','--')

%% Panel F
load('Figure5Data')
meanPhase = expData(5).MeanPhase;
figure
imagesc(meanPhase)
map = colorcet( 'C2' );
map = circshift(map,1);
colormap(map)
c = colorbar;
hold on
c.Label.String = 'Best Phase (rad)';
ylabel('MUA Electrode Depth (\mum)')
xlabel('LFP Electrode Depth (\mum)')
set(gca,'fontsize',14,'linewidth',1.5,'xticklabel',0:400:2000,'xtick',4:4:24,'yticklabel',0:400:2000,'ytick',4:4:24)
plot([expData(5).ChanZero expData(5).ChanZero],[1 32],'r','linewidth',1.5,'linestyle','--')
xlim([4 22]); ylim([4 22]);
