%% Code for Figure 6 Panels

%% Panel A
load('Figure6Data')
allPhase = [];
chanZero = [expData.ChanZero];
powerZero = [expData.NewPowerChan];
phaseZero = [expData.PhaseZero];
flipChan = [expData.Flip];
phaseZero(flipChan == 1) = 32 - phaseZero(flipChan == 1) + 1;
powerZero(flipChan == 1) = 32 - powerZero(flipChan == 1) + 1;
chanZero(flipChan == 1) = 32 - chanZero(flipChan == 1) + 1;
good = find(abs(phaseZero-chanZero)> 2);
count = 1;
allMean = [];
for ii = 1:length(expData)
    if ~isempty(expData(ii).MeanRate) && ismember(ii,good)
        meanRate = expData(ii).MeanRate;
        flipVal = chanZero(ii);
        thisMean = nan(1,64);
        thisMean(33-flipVal:32)= meanRate(1:flipVal);
        thisMean(33:32+(32-flipVal)) = meanRate(flipVal+1:end);
        allMean(:,count) = thisMean;
        count = count+1;
    end
end

figure
hold on
axis square
[l1 s] = boundedline(1:64,nanmean(allMean'),nanstd(allMean')./sqrt(size(allMean,2)-1),'k');
l1.LineWidth = 1.5;
set(gca,'xtick',20:4:44,'xticklabel',-1200:400:1200,'fontsize',16,'linewidth',1.5)
xlim([22 42])
xlabel('Electrode Depth')
ylabel('Normalized Firing Rate')
CSDMean = allMean;
count = 1;
allMean = [];
for ii = 1:length(expData) 
    if ~isempty(expData(ii).MeanRate) && ismember(ii,good)
        meanRate = expData(ii).MeanRate;
        flipVal = phaseZero(ii);
        thisMean = nan(1,64);
        thisMean(33-flipVal:32)= meanRate(1:flipVal);
        thisMean(33:32+(32-flipVal)) = meanRate(flipVal+1:end);
        allMean(:,count) = thisMean;
        count = count+1;
    end
end
[l2 s] = boundedline(1:64,nanmean(allMean'),nanstd(allMean')./sqrt(size(allMean,2)-1),'r');
l2.LineWidth = 1.5;
legend([l1 l2],'CSD','LPC')
ylim([0 2.25])
xlim([21 43])
alpha(0.5)

%% Panel B
figure
hold on; axis square
[a1 a2] = boundedline(1:64,nanmean(csdAPower,2),nanstd(csdAPower')./sqrt(size(csdAPower,2)-1),'b');
[g1 g2] = boundedline(1:64,nanmean(csdGPower,2),nanstd(csdGPower')./sqrt(size(csdGPower,2)-1),'r');
a1.LineWidth = 1.5;
g1.LineWidth = 1.5;
ylim([-1.5 1.5])
xlim([24 40])
view([90 90])
alpha 0.5
set(gca,'xtick',24:4:40,'xticklabel',-800:400:800,'fontsize',16,'linewidth',1.5)
xlabel('Electrode Depth (\mum)')
ylabel('Relative Power (z)')
legend([a1 g1],'Low Freq','High Freq','location','southwest')

%% Panel C
figure
hold on; axis square
[a1 a2] = boundedline(1:64,nanmean(lpcAPower,2),nanstd(lpcAPower')./sqrt(size(lpcAPower,2)-1),'b');
[g1 g2] = boundedline(1:64,nanmean(lpcGPower,2),nanstd(lpcGPower')./sqrt(size(lpcGPower,2)-1),'r');
a1.LineWidth = 1.5;
g1.LineWidth = 1.5;
ylim([-1.5 1.5])
xlim([24 40])
view([90 90])
alpha 0.5
set(gca,'xtick',24:4:40,'xticklabel',-800:400:800,'fontsize',16,'linewidth',1.5)
xlabel('Electrode Depth (\mum)')
ylabel('Relative Power (z)')
legend([a1 g1],'Low Freq','High Freq','location','southwest')

%% Panel D
load('Figure6Data')
chanZero = [expData.ChanZero];
phaseZero = [expData.PhaseZero];
powerZero = [expData.PowerZero];
powerZero = [expData.NewPowerChan];
flipChan = [expData.Flip];
phaseZero(flipChan == 1) = 32 - phaseZero(flipChan == 1) + 1;
powerZero(flipChan == 1) = 32 - powerZero(flipChan == 1) + 1;
chanZero(flipChan == 1) = 32 - chanZero(flipChan == 1) + 1;
bad = find(isnan(powerZero));
all = 1:length(chanZero);
all(bad) = [];
good = find(abs(phaseZero-chanZero)> 2);
good(isnan(powerZero(good))) = [];

figure
hold on; axis square
test = phaseZero(good);
test2 = chanZero(good);
plot([0 30],[0 30],'r','linestyle','--','linewidth',1.5)
scatter(phaseZero(good),chanZero(good),50,'k','filled');
xlim([0 30])
ylim([0 30])
set(gca,'xtick',0:10:30,'xticklabel',0:1000:3000,'ytick',0:10:30,'yticklabel',0:1000:3000);
set(gca,'fontsize',16,'linewidth',1.5);

xlabel('Input depth from CSD')
ylabel('Input depth from spike phase')
axis square

%% Panel E
load('Figure6Data')
chanZero = [expData.ChanZero];
phaseZero = [expData.PhaseZero];
powerZero = [expData.PowerZero];
powerZero = [expData.NewPowerChan];
flipChan = [expData.Flip];
phaseZero(flipChan == 1) = 32 - phaseZero(flipChan == 1) + 1;
powerZero(flipChan == 1) = 32 - powerZero(flipChan == 1) + 1;
chanZero(flipChan == 1) = 32 - chanZero(flipChan == 1) + 1;
bad = find(isnan(powerZero));
all = 1:length(chanZero);
all(bad) = [];
good = find(abs(phaseZero-chanZero)> 2);
good(isnan(powerZero(good))) = [];

figure
hold on; axis square
plot([0 30],[0 30],'r','linestyle','--','linewidth',1.5)
scatter(chanZero(good),powerZero(good),50,'k','filled');
xlim([0 30])
ylim([0 30])
set(gca,'xtick',0:10:30,'xticklabel',0:1000:3000,'ytick',0:10:30,'yticklabel',0:1000:3000);
set(gca,'fontsize',16,'linewidth',1.5);

xlabel('Input depth from CSD')
ylabel('Input depth from LFP power')
axis square

%% Panel F
load('Figure6Data')
chanZero = [expData.ChanZero];
phaseZero = [expData.PhaseZero];
powerZero = [expData.PowerZero];
powerZero = [expData.NewPowerChan];
flipChan = [expData.Flip];
phaseZero(flipChan == 1) = 32 - phaseZero(flipChan == 1) + 1;
powerZero(flipChan == 1) = 32 - powerZero(flipChan == 1) + 1;
chanZero(flipChan == 1) = 32 - chanZero(flipChan == 1) + 1;
bad = find(isnan(powerZero));
all = 1:length(chanZero);
all(bad) = [];
good = find(abs(phaseZero-chanZero)> 2);
good(isnan(powerZero(good))) = [];

figure
hold on; axis square
plot([0 30],[0 30],'r','linestyle','--','linewidth',1.5)
scatter(phaseZero(good),powerZero(good),50,'k','filled');
xlim([0 30])
ylim([0 30])
set(gca,'xtick',0:10:30,'xticklabel',0:1000:3000,'ytick',0:10:30,'yticklabel',0:1000:3000)
set(gca,'fontsize',16,'linewidth',1.5)
xlabel('Input depth from spike phase')
ylabel('Input depth from LFP power')
axis square