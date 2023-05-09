# Code for the manuscript Spike-phase coupling patterns reveal laminar identity in primate cortex by Davis et al. eLife 2023

Code and data to generate each of the main figures are included as well as code for running the Spike-Phase Index analysis (GetLaminarPhase.m) and measure the laminar power reversal (LaminarPower.m). Example data available at: https://doi.org/10.5061/dryad.3r2280gmm 
Matlab circular statistics toolbox available at: https://www.mathworks.com/matlabcentral/fileexchange/10676-circular-statistics-toolbox-directional-statistics
Generalized Phase code available at: https://github.com/mullerlab/generalized-phase
Example usage:

load('exData1')
GetLaminarPhase(spikeTimes,LFP,chanMap,1000,[5 40],0);
LaminarPower(LFP,chanMap,1000)
