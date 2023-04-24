%% Initialization
clear all; close all; clc;

dk1 = 50; dc = 5; dk2 = 5; db = 50;
% Set values for StC-1
oldSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-1.dat';
newSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-1-opt.dat';
% Read SD file
SD = SD2Matlab(oldSDName, 2);
% Set initial values for data in the file
SD = SetFASTPar(SD    ,'StC_DOF_MODE'  , 5);
SD = SetFASTPar(SD    ,'StC_Z_M'  , 375200);
SD = SetFASTPar(SD    ,'StC_b_M'  , 19016);
SD = SetFASTPar(SD    ,'StC_Z_K'  , 29106);
SD = SetFASTPar(SD    ,'StC_b_K'  , 1618);
SD = SetFASTPar(SD    ,'StC_Z_C'  , 16606);
% Write Modified SD file
Matlab2SD(SD, oldSDName, newSDName, 2);

% Set values for StC-2
oldSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-2.dat';
newSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-2-opt.dat';
% Read SD file
SD = SD2Matlab(oldSDName, 2);
% Set initial values for data in the file
SD = SetFASTPar(SD    ,'StC_DOF_MODE'  , 5);
SD = SetFASTPar(SD    ,'StC_Z_M'  , 375200);
SD = SetFASTPar(SD    ,'StC_b_M'  , 19016);
SD = SetFASTPar(SD    ,'StC_Z_K'  , 29106);
SD = SetFASTPar(SD    ,'StC_b_K'  , 1618);
SD = SetFASTPar(SD    ,'StC_Z_C'  , 16606);
% Write Modified SD file
Matlab2SD(SD, oldSDName, newSDName, 2);

% Set values for StC-3
oldSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-3.dat';
newSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-3-opt.dat';
% Read SD file
SD = SD2Matlab(oldSDName, 2);
% Set initial values for data in the file
SD = SetFASTPar(SD    ,'StC_DOF_MODE'  , 5);
SD = SetFASTPar(SD    ,'StC_Z_M'  , 375200);
SD = SetFASTPar(SD    ,'StC_b_M'  , 19016);
SD = SetFASTPar(SD    ,'StC_Z_K'  , 29106);
SD = SetFASTPar(SD    ,'StC_b_K'  , 1618);
SD = SetFASTPar(SD    ,'StC_Z_C'  , 16606);
% Write Modified SD file
Matlab2SD(SD, oldSDName, newSDName, 2);

%% Define Parameter Ranges
b_range = 

%% Run OpenFAST
status = system('.\openfast_TID_V2.1.exe ".\StC_test_OC4Semi.fst"');