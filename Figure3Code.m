%% Code to generate panels B-F of Figure 3

%% Panel B
load('Figure3Data')
SPI = expData(2).SPI;
figure
imagesc(SPI)
colormap hot
c = colorbar;
c.Label.String = 'SPI';
ylabel('MUA Electrode Depth (\mum)')
xlabel('LFP Electrode Depth (\mum)')
set(gca,'fontsize',14,'linewidth',1.5,'xticklabel',-800:400:800,'xtick',4:4:24,'yticklabel',-800:400:800,'ytick',4:4:24)
xlim([4 22]); ylim([4 22]);
hold on
plot([expData(2).ChanZero expData(2).ChanZero],[1 32],'r','linewidth',1.5,'linestyle','--')

%% Panel C
load('Figure3Data')
meanPhase = expData(2).MeanPhase;
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
set(gca,'fontsize',14,'linewidth',1.5,'xticklabel',-800:400:800,'xtick',5:4:24,'yticklabel',-800:400:800,'ytick',5:4:24)
plot([expData(2).ChanZero expData(2).ChanZero],[1 32],'r','linewidth',1.5,'linestyle','--')
xlim([4 22]); ylim([4 22]);

%% Panel D
load('Figure3Data')
figure
axis square
imagesc(nanmean(allSPI,3))
ylim([24 40])
xlim([24 40])
caxis([0 0.15])
set(gca,'fontsize',16','linewidth',1.5)
xlabel('LFP Channel Depth')
ylabel('MUA Channel Depth')
set(gca,'xtick',24:4:40,'xticklabel',-800:400:800)
set(gca,'ytick',24:4:40,'yticklabel',-800:400:800)
set(gca,'xtick',24:4:40,'xticklabel',-800:400:800,'fontsize',16,'linewidth',1.5)
c = colorbar;
c.Label.String = 'SPI';
caxis([0 0.2])
colormap hot

%% Panel E
load('Figure3Data')
meanData = [];
for i = 1:64
    for j = 1:64
        thisDat = squeeze(allPhase(i,j,:));
        bad = find(isnan(thisDat));
        thisDat(bad) = [];
        if ~isempty(thisDat)
            meanData(i,j) = circ_mean(thisDat);
        else
            meanData(i,j) = NaN;
        end
    end
end
figure
imagesc(meanData)
map = colorcet( 'C2' );
map = circshift(map,1);
colormap(map)
c = colorbar;
hold on; axis square
c.Label.String = 'Best Phase (rad)';
ylim([24 40])
xlim([24 40])
set(gca,'fontsize',16','linewidth',1.5)
xlabel('LFP Channel Depth')
ylabel('MUA Channel Depth')
set(gca,'xtick',24:4:40,'xticklabel',-800:400:800)
set(gca,'ytick',24:4:40,'yticklabel',-800:400:800)
set(gca,'xtick',24:4:40,'xticklabel',-800:400:800,'fontsize',16,'linewidth',1.5)

%% Panel F
load('Figure3Data')
phaseZero = [expData.PhaseZero]*100;
chanZero = [expData.ChanZero]*100;
powerZero = [expData.NewPowerChan]*100;
bad = find(isnan(powerZero));
phaseZero(bad) = [];
chanZero(bad) = [];
figure
hold on
scatter(phaseZero,chanZero,50,'filled','k');
plot([0 3200],[0 3200],'r','linestyle','--','linewidth',1.5)
xlim([0 3000])
ylim([0 3000])
axis square
set(gca,'fontsize',16,'linewidth',1.5)
xlabel('CSD Input Layer Depth (\mum)')
ylabel('Phase Input Layer Depth (\mum)')
[h p] = corr(phaseZero',chanZero');
set(gca,'xtick',0:1000:3000,'ytick',0:1000:3000)
