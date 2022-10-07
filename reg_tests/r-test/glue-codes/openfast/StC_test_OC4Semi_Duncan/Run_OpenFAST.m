clear;clc
%% Given File For Structural Control
%OpenFAST does not have a GUI, so you have to call run the program through
%a series of commands

%Call the location of the fast.exe file
Fast = 'C:\Users\kdoku\Documents\GitHub\OpenFAST\OpenFAST_Basic\openfast_run\openfast\reg_tests\r-test\glue-codes\openfast\StC_test_OC4Semi_Duncan\openfast_x64.exe';

%Call the location of the fast_input.fst file
FastFile = 'C:\Users\kdoku\Documents\GitHub\OpenFAST\OpenFAST_Basic\openfast_run\openfast\reg_tests\r-test\glue-codes\openfast\StC_test_OC4Semi_Duncan\StC_test_OC4Semi.fst';

%To run FAST, you have to input a specific argument in the system command
%window with the format "file location of FAST.exe file (space) file
%location of the fast_input.fst"
system([Fast ' ' FastFile]);

% If FAST ran sucessfully the content similar to below should appear 
% in your Matlab command window:

    % ************************************************************************************************** 
    % FAST (v8.10.00a-bjj, 31-Mar-2015) 
    %  
    % Copyright (C) 2015 National Renewable Energy Laboratory 
    %  
    % This program comes with ABSOLUTELY NO WARRANTY. See the "license.txt" file distributed with this 
    % software for details. 
    % ************************************************************************************************** 
    %  
    %  Running FAST (v8.10.00a-bjj, 31-Mar-2015), compiled as a 64-bit application using single 
    %  precision 
    %  linked with NWTC Subroutine Library (v2.05.02a-bjj, 25-Feb-2015) 
    %  
    %  Heading of the FAST input file: 
    %    FAST Certification Test #01: AWT-27CR2 with many DOFs with fixed yaw error and steady wind 
    %  
    %  Running ElastoDyn (v1.02.00a-bjj, 31-Mar-2015). 
    %  
    %  Running ServoDyn (v1.02.00a-bjj, 31-Mar-2015). 
    %  
    %  Running AeroDyn (v14.03.01a-bjj, 13-Mar-2015). 
    %  
    %  Running InflowWind (v2.01.00a-bjj, 13-Mar-2015). 
    %  
    %    Assuming C:\FAST\CertTest\AWT27/Wind/Shr12_30.wnd is a formatted HH wind file. 
    %    Processed 3 records of HH data 
    %  
    % FAST_InitializeAll:AD_Init:Dynamic inflow will not check for low mean wind speed. 
    %  
    %  Timestep: 0 of 20 seconds.
    %  Timestep: 2 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 4 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 6 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 8 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 10 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 12 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 14 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 16 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 18 of 20 seconds.  Estimated final completion at 11:26:39.
    %  Timestep: 20 of 20 seconds.  Estimated final completion at 11:26:39.
    %                                                                                                    
    %  
    %  Total Real Time:       2.471 seconds 
    %  Total CPU Time:        2.4375 seconds 
    %  Simulation CPU Time:   2.3906 seconds 
    %  Simulated Time:        20 seconds 
    %  Time Ratio (Sim/CPU):  8.366 
    
% If your FAST did NOT run an aborted message should appear. In this
% case I misspelled the name of the input file. So an error appeared as
% seen below:

    % ************************************************************************************************** 
    % FAST (v8.10.00a-bjj, 31-Mar-2015) 
    %  
    % Copyright (C) 2015 National Renewable Energy Laboratory 
    %  
    % This program comes with ABSOLUTELY NO WARRANTY. See the "license.txt" file distributed with this 
    % software for details. 
    % ************************************************************************************************** 
    %  
    %  Running FAST (v8.10.00a-bjj, 31-Mar-2015), compiled as a 64-bit application using single 
    %  precision 
    %  linked with NWTC Subroutine Library (v2.05.02a-bjj, 25-Feb-2015) 
    %  
    %  
    % FAST_InitializeAll:FAST_Init:FAST_ReadPrimaryFile:The input file, "C:\FAST\CertTest\Test011.fst", 
    % was not found. 
    %  
    %  FAST encountered an error during module initialization. 
    %  Simulation error level: FATAL ERROR 
    %  
    %  Aborting FAST. 
    
% If your program ran sucessfully, you now have an output file
% in the same folder as your input file. In this case the file is located
% in "C:\FAST\CertTest\Test01.out". You can open this file and take a look
% at the results. Each column corresponds to one channel. The chanel could be
% position, acceleration, loads etc. More (or less) channels can be selected to
% be displayed based on the based on the type of analysis.

%% Add Matlab Toolbox to the Toolpath
%Here we will add the matlab toolbox to the toolpath so we can use some of
%the built-in functions that have already been created for creating,
%modifying, and interpreting the output of FAST files
FASTSimulationToolbox = 'C:\Users\kdoku\Documents\GitHub\OpenFAST\matlab-toolbox';
addpath( genpath( FASTSimulationToolbox ) );


%% Plotting Data
%Here we will plot some of the data (heave, pitch, roll) from the output file (.out) 
%Need to use one of the two following formats for the plotFASToutput file:
%[timeSeriesData] = PlotFASToutput(FASTfiles,FASTfilesDesc,ReferenceFile,Channels)
%[timeSeriesData] = PlotFASToutput(FASTfiles,FASTfilesDesc,ReferenceFile,Channels,ShowLegend,CustomHdr,PlotPSDs,OnePlot)
cd 'C:\Users\kdoku\Documents\GitHub\OpenFAST\OpenFAST_Basic\openfast\reg_tests\r-test\glue-codes\openfast\StC_test_OC4Semi_Duncan'
OutFile='StC_test_OC4Semi.out';
[outData] = PlotFASToutput({OutFile},{'Semisub Platform w/ 5MW Turbine'},[],{'PtfmHeave'} );
[outData] = PlotFASToutput({OutFile},{'Semisub Platform w/ 5MW Turbine'},[],{'PtfmPitch','PtfmRoll'}, 1, [], 0, 1  );
[outData] = PlotFASToutput({OutFile},{'Semisub Platform w/ 5MW Turbine'},[],{'Wave1Elev'} );