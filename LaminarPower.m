function [loPower, hiPower] = LaminarPower(LFP,chanMap,Fs)
% Calculate power in low and high frequency bands across electrodes.
% Inputs:
% LFP is a NxM array of channels by recording time containing the raw LFP
% chanMap is the decending order of channel positions from the surface
% Fs is the sampling rate
% Outputs:
% loPower is the normalized low power relative to low and high power across
% channels
% hiPower is the normalized high power relative to low and high power
% across channels
% frequencies
% -ZD 10/19/2022


% Get the PSD for each channel and the frequency bins of interest
p = [];
for i = 1:32
    [p(i,:) f] = pwelch(LFP{chanMap(i)},[],[],[],1000);
    lowF = find(f > 8 & f < 30);
    highF = find(f > 65 & f < 100);
    total = vertcat(lowF,highF);
end
loPower = [];
hiPower = [];
loPowerRatio = [];
hiPowerRatio = [];
for i = 1:32
    loPowerRatio(i) = nanmean(10*log10(p(i,lowF)))./nanmean(nanmean(10*log10(p(:,total))));
    hiPowerRatio(i) = nanmean(10*log10(p(i,highF)))./nanmean(nanmean(10*log10(p(:,total))));
end

figure
hold on; axis square
plot(zscore(loPowerRatio),'b','linewidth',1.5);
plot(zscore(hiPowerRatio),'r','linewidth',1.5);
ylim([-1.5 1.5])
set(gca,'ydir','reverse')
view([90 90])
xlabel('Electrode Depth (\mum)')
ylabel('Relative Power (z)')
legend('Low Freq','High Freq','location','southwest')

