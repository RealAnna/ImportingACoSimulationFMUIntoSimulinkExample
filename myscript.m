%% Import Co-Simulation FMU into Simulink
% This example shows how to use the FMU Import block to load an FMU file.
% The FMU file supports execution in co-simulation mode. Simulink(R)
% software supports stepping back and forth, tuning parameters in between,
% and saving states for the FMU Import block as long as the FMU itself
% supports these features.

% Copyright 2017-2021 The MathWorks, Inc.

%%
% This FMU file models the Van der Pol equation, which is a nonlinear
% second order system. The FMU file supports FMI 2.0 Co-Simulation mode.
% You can change the communication step size in the FMU Import Block
% Parameters dialog box.
function ImportingACoSimulationFMUIntoSimulinkExample(temperature,flow,pressure)
    diary mylog.log
    open_system('fmudemo_vdp','loadonly')
    t = 0:0.1:400;

    out= sim('fmudemo_vdp',t,[],[0, double(temperature), double(flow), double(pressure)]);
    plot(out.tout, out.yout{5}.Values.Data)
    legend(["variant1" ]);
    bdclose all
    diary off;
