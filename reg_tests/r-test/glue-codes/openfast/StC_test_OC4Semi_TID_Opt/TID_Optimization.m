%% Initialization
clear all; close all; clc;
tic
%% Define Parameter Ranges
% k_range = 25000:500:35000;
% c_range = 12000:500:22000;
k_1 = 10000;
k_range = 50:100:750;
c_range = 50:100:750;
b_range = 4000:1000:9000;

i=0; 
Pitch=zeros(length(k_range),length(c_range));

%% Loop Through Range
while i < length(k_range)
    i=i+1;
    j=0;
    while j < length(c_range)
        j=j+1;
        k=0;
        while k < length(b_range)
            k=k+1;
%% Set StC Parameters
% Set values for StC-1
oldSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-1.dat';
newSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-1-opt.dat';
% Read SD file
SD = SD2Matlab(oldSDName, 2);
% Set initial values for data in the file
SD = SetFASTPar(SD    ,'StC_DOF_MODE'  , 5);
SD = SetFASTPar(SD    ,'StC_Z_M'  , 234500);
SD = SetFASTPar(SD    ,'StC_Z_K'  , k_1);
SD = SetFASTPar(SD    ,'StC_Z_C'  , c_range(j));
SD = SetFASTPar(SD    ,'StC_b_M'  , b_range(k));
SD = SetFASTPar(SD    ,'StC_b_K'  , k_range(i));
% Write Modified SD file
Matlab2SD(SD, oldSDName, newSDName, 2);

% Set values for StC-2
oldSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-2.dat';
newSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-2-opt.dat';
% Read SD file
SD = SD2Matlab(oldSDName, 2);
% Set initial values for data in the file
SD = SetFASTPar(SD    ,'StC_DOF_MODE'  , 5);
SD = SetFASTPar(SD    ,'StC_Z_M'  , 234500);
SD = SetFASTPar(SD    ,'StC_Z_K'  , k_1);
SD = SetFASTPar(SD    ,'StC_Z_C'  , c_range(j));
SD = SetFASTPar(SD    ,'StC_b_M'  , b_range(k));
SD = SetFASTPar(SD    ,'StC_b_K'  , k_range(i));
% Write Modified SD file
Matlab2SD(SD, oldSDName, newSDName, 2);

% Set values for StC-3
oldSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-3.dat';
newSDName = 'C:/Users/kdoku/Documents/openFAST_TMD/OpenFAST_TID/reg_tests/r-test/glue-codes/openfast/StC_test_OC4Semi_TID_Opt/StC-Sub-Zdof-3-opt.dat';
% Read SD file
SD = SD2Matlab(oldSDName, 2);
% Set initial values for data in the file
SD = SetFASTPar(SD    ,'StC_DOF_MODE'  , 5);
SD = SetFASTPar(SD    ,'StC_Z_M'  , 234500);
SD = SetFASTPar(SD    ,'StC_Z_K'  , k_1);
SD = SetFASTPar(SD    ,'StC_Z_C'  , c_range(j));
SD = SetFASTPar(SD    ,'StC_b_M'  , b_range(k));
SD = SetFASTPar(SD    ,'StC_b_K'  , k_range(i));
% Write Modified SD file
Matlab2SD(SD, oldSDName, newSDName, 2);

%% Run OpenFAST
status = system('.\openfast_TID_V2.1.exe ".\StC_test_OC4Semi.fst"');
Output = ReadFASTtext('StC_test_OC4Semi.out', '', 8, 7, 8);
Pitch(i,j,k) = rms(Output(:,16));
        end
    end
end
beep
toc
%% Plot Results
% figure(1)
% surf(k_range,c_range,Pitch(:,:), 'FaceColor', 'interp')
% colorbar
% xlabel('k_1 Stiffness (N/m)'); ylabel('c_1 Damping (N*s/m)'); zlabel('RMS Pitch (Deg)')
