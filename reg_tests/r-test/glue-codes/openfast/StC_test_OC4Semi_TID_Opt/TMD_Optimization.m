%% Initialization
clear all; close all; clc;
tic
%% Define Parameter Ranges
% k_range = 25000:500:35000;
% c_range = 12000:500:22000;
k_range = 2000:2000:20000;
c_range = 2000:2000:20000;

i=0; 
Pitch=zeros(length(k_range),length(c_range));

%% Loop Through Range
while i < length(k_range)
    i=i+1;
    j=0;
    while j < length(c_range)
        j=j+1;

%% Set StC Parameters
% Set values for StC-1
oldSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-1.dat';
newSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-1-opt.dat';
% Read SD file
SD = SD2Matlab(oldSDName, 2);
% Set initial values for data in the file
SD = SetFASTPar(SD    ,'StC_DOF_MODE'  , 1);
SD = SetFASTPar(SD    ,'StC_Z_M'  , 234500);
SD = SetFASTPar(SD    ,'StC_Z_K'  , k_range(i));
SD = SetFASTPar(SD    ,'StC_Z_C'  , c_range(j));
% Write Modified SD file
Matlab2SD(SD, oldSDName, newSDName, 2);

% Set values for StC-2
oldSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-2.dat';
newSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-2-opt.dat';
% Read SD file
SD = SD2Matlab(oldSDName, 2);
% Set initial values for data in the file
SD = SetFASTPar(SD    ,'StC_DOF_MODE'  , 1);
SD = SetFASTPar(SD    ,'StC_Z_M'  , 234500);
SD = SetFASTPar(SD    ,'StC_Z_K'  , k_range(i));
SD = SetFASTPar(SD    ,'StC_Z_C'  , c_range(j));
% Write Modified SD file
Matlab2SD(SD, oldSDName, newSDName, 2);

% Set values for StC-3
oldSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-3.dat';
newSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-3-opt.dat';
% Read SD file
SD = SD2Matlab(oldSDName, 2);
% Set initial values for data in the file
SD = SetFASTPar(SD    ,'StC_DOF_MODE'  , 1);
SD = SetFASTPar(SD    ,'StC_Z_M'  , 234500);
SD = SetFASTPar(SD    ,'StC_Z_K'  , k_range(i));
SD = SetFASTPar(SD    ,'StC_Z_C'  , c_range(j));
% Write Modified SD file
Matlab2SD(SD, oldSDName, newSDName, 2);

%% Run OpenFAST
status = system('.\openfast_TID_V2.1.exe ".\StC_test_OC4Semi.fst"');
Output = ReadFASTtext('StC_test_OC4Semi.out', '', 8, 7, 8);
Pitch(i,j) = rms(Output(:,16));
    end
end
beep
toc
%% Plot Results
figure(1)
surf(k_range,c_range,Pitch(:,:,2), 'FaceColor', 'interp')
colorbar
ylabel('k_2 Stiffness (N/m)'); xlabel('c_1 Damping (N*s/m)'); zlabel('RMS Pitch (Deg)')
