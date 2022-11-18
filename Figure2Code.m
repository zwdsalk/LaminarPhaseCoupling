%% Code to generate panels B-F of Figure 2

%% Panel B
load('Figure2Data')
phaseBins = linspace(-pi,pi,12);
phaseBins(end)= [];
figure
set(gcf,'position',[100 100 500 400])
ba = bar(phaseBins,nanmean(allSupraHist(:,1:11)),'histc');
ba.LineWidth = 1.5;
ba.EdgeColor = [0 0 0];
ba.FaceColor = [.5 .5 .5];
hold on
er = errorbar(phaseBins+pi/(length(phaseBins)-1),nanmean(allSupraHist(:,1:11)),(nanstd(allSupraHist(:,1:11)))./sqrt(size(allSupraHist,1)));
er.Color = [0 0 0];
er.LineStyle = 'none';
er.LineWidth = 2;
set(gca,'linewidth',2)
set(gca,'fontsize',16)
xlabel('Generalied Phase (rad)')
ylabel('Fraction of spikes')
set(gca,'fontsize',16)
set(gca,'linewidth',1.5)
set(gca,'xtick',-pi:pi/2:pi)
set(gca,'xticklabel',{'-\pi','-\pi/2','0','\pi/2','\pi'})
set(gca,'ytick',0:.05:.2)
xlim([-pi-.2 pi+.2])
ylim([0 .16])
box off
title('Sup. Spike-Phase Coupling')

%% Panel C
load('Figure2Data')
phaseBins = linspace(-pi,pi,12);
phaseBins(end)= [];
figure
set(gcf,'position',[100 100 500 400])
ba = bar(phaseBins,nanmean(allInputHist(:,1:11)),'histc');
ba.LineWidth = 1.5;
ba.EdgeColor = [0 0 0];
ba.FaceColor = [.5 .5 .5];
hold on
er = errorbar(phaseBins+pi/(length(phaseBins)-1),nanmean(allInputHist(:,1:11)),(nanstd(allInputHist(:,1:11)))./sqrt(size(allInputHist,1)));
er.Color = [0 0 0];
er.LineStyle = 'none';
er.LineWidth = 2;
set(gca,'linewidth',2)
set(gca,'fontsize',16)
xlabel('Generalied Phase (rad)')
ylabel('Fraction of spikes')
set(gca,'fontsize',16)
set(gca,'linewidth',1.5)
set(gca,'xtick',-pi:pi/2:pi)
set(gca,'xticklabel',{'-\pi','-\pi/2','0','\pi/2','\pi'})
set(gca,'ytick',0:.05:.2)
ylim([0 .16])
xlim([-pi-.2 pi+.2])
box off
title('Input Spike-Phase Coupling')

%% Panel D
load('Figure2Data')
phaseBins = linspace(-pi,pi,12);
phaseBins(end)= [];
figure
set(gcf,'position',[100 100 500 400])
ba = bar(phaseBins,nanmean(allDeepHist(:,1:11)),'histc');
ba.LineWidth = 1.5;
ba.EdgeColor = [0 0 0];
ba.FaceColor = [.5 .5 .5];
hold on
er = errorbar(phaseBins+pi/(length(phaseBins)-1),nanmean(allDeepHist(:,1:11)),(nanstd(allDeepHist(:,1:11)))./sqrt(size(allDeepHist,1)));
er.Color = [0 0 0];
er.LineStyle = 'none';
er.LineWidth = 2;
set(gca,'linewidth',2)
set(gca,'fontsize',16)
xlabel('Generalied Phase (rad)')
ylabel('Fraction of spikes')
set(gca,'fontsize',16)
set(gca,'linewidth',1.5)
set(gca,'xtick',-pi:pi/2:pi)
set(gca,'xticklabel',{'-\pi','-\pi/2','0','\pi/2','\pi'})
set(gca,'ytick',0:.05:.2)
ylim([0 .16])
xlim([-pi-.2 pi+.2])
box off
title('Deep Spike-Phase Coupling')

%% Panel E

load('Figure2Data')
figure
set(gcf,'position',[100 100 500 400])
ba = bar(1:3,[nanmean(allSupraSPI) nanmean(allInputSPI) nanmean(allDeepSPI)]);
ba.LineWidth = 1.5;
ba.EdgeColor = [0 0 0];
ba.FaceColor = [.5 .5 .5];
hold on
er = errorbar(1:3,[nanmean(allSupraSPI) nanmean(allInputSPI) nanmean(allDeepSPI)],...
    [nanstd(allSupraSPI)./sqrt(length(allSupraSPI)-1) nanstd(allInputSPI)./sqrt(length(allInputSPI)-1) nanstd(allDeepSPI)./sqrt(length(allDeepSPI)-1)]) ;
er.Color = [0 0 0];
er.LineStyle = 'none';
er.LineWidth = 2;
set(gca,'linewidth',2)
set(gca,'fontsize',16)
xlabel('Laminar Compartment')
ylabel('SPI')
set(gca,'fontsize',16)
set(gca,'linewidth',1.5)
set(gca,'xtick',1:3)
set(gca,'xticklabel',{'S','I','D'})
set(gca,'ytick',0:.05:.2)
ylim([0 .20])
box off
title('SPI by Laminar Compartment')

%% Panel F
load('Figure2Data')
allSupraPhase(isnan(allSupraPhase)) = [];
allInputPhase(isnan(allInputPhase)) = [];
allDeepPhase(isnan(allDeepPhase)) = [];

figure
set(gcf,'position',[100 100 500 400])
ba = bar(1:3,[circ_mean(allSupraPhase') circ_mean(allInputPhase') circ_mean(allDeepPhase')]);
ba.LineWidth = 1.5;
ba.EdgeColor = [0 0 0];
ba.FaceColor = [.5 .5 .5];
hold on
er = errorbar(1:3,[circ_mean(allSupraPhase') circ_mean(allInputPhase') circ_mean(allDeepPhase')],...
    [circ_std(allSupraPhase')./sqrt(length(allSupraPhase)-1) circ_std(allInputPhase')./sqrt(length(allInputPhase)-1) circ_std(allDeepPhase')./sqrt(length(allDeepPhase)-1)]) ;
er.Color = [0 0 0];
er.LineStyle = 'none';
er.LineWidth = 2;
set(gca,'linewidth',2)
set(gca,'fontsize',16)
xlabel('Laminar Compartment')
set(gca, 'YDir','reverse')
ylabel('Mean Phase Angle (rad)')
set(gca,'fontsize',16)
set(gca,'linewidth',1.5)
set(gca,'xtick',1:3)
set(gca,'xticklabel',{'S','I','D'})
set(gca,'ytick',-pi:pi/2:0,'yticklabel',{'-\pi','-\pi/2','0'})
ylim([-pi 0])
box off
title('Preferred Phase by Laminar Compartment')
title('SPI by Laminar Compartment')
