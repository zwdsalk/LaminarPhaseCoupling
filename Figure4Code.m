%% Code for panels A-H for Figure 4

%% Panel A
load('Figure4Data')
figure
imagesc(expData(4).MeanPhase)
axis square
map = colorcet( 'C2' );
map = circshift(map,1);
colormap(map)
c = colorbar;
hold on
c.Label.String = 'Best Phase (rad)';
ylabel('MUA Channel')
xlabel('LFP Channel')
set(gca,'fontsize',14,'linewidth',1.5)

%% Panel B
load('Figure4Data')
figure
imagesc(expData(4).PhaseCorr)
axis square
colormap hot
set(gca,'fontsize',14,'linewidth',1.5)
xlabel('Channel Number')
ylabel('Channel Number')

%% Panel C
load('Figure4Data')
figure
imagesc(expData(26).MeanPhase)
axis square
map = colorcet( 'C2' );
map = circshift(map,1);
colormap(map)
c = colorbar;
hold on
c.Label.String = 'Best Phase (rad)';
ylabel('MUA Channel')
xlabel('LFP Channel')
set(gca,'fontsize',14,'linewidth',1.5)

%% Panel D
load('Figure4Data')
figure
imagesc(expData(26).PhaseCorr)
axis square
colormap hot
set(gca,'fontsize',14,'linewidth',1.5)
xlabel('Channel Number')
ylabel('Channel Number')

%% Panel E
load('Figure4Data')
figure
imagesc(expData(21).MeanPhase)
axis square
map = colorcet( 'C2' );
map = circshift(map,1);
colormap(map)
c = colorbar;
hold on
c.Label.String = 'Best Phase (rad)';
ylabel('MUA Channel')
xlabel('LFP Channel')
set(gca,'fontsize',14,'linewidth',1.5)

%% Panel F
load('Figure4Data')
figure
imagesc(expData(21).PhaseCorr)
axis square
colormap hot
set(gca,'fontsize',14,'linewidth',1.5)
xlabel('Channel Number')
ylabel('Channel Number')

%% Panel G
load('Figure4Data')
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
%% Panel H
figure
load('Figure4Data')
axis square
imagesc(nanmean(allCorr,3))
ylim([24 40])
xlim([24 40])
caxis([0 1])
set(gca,'fontsize',16','linewidth',1.5)
xlabel('LFP Channel Depth')
ylabel('LFP Channel Depth')
set(gca,'xtick',24:4:40,'xticklabel',-800:400:800)
set(gca,'ytick',24:4:40,'yticklabel',-800:400:800)
set(gca,'xtick',24:4:40,'xticklabel',-800:400:800,'fontsize',16,'linewidth',1.5)
c = colorbar;
c.Label.String = 'Correlation (r)';
colormap hot