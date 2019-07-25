%% Produce tables of output for Asian Option Fixed Width Example
function AsianArithMeanOptionAutoOutput
gail.InitializeWorkspaceDisplay %clean up 
format long

load PierreAsianCallExampleAllDataA-2R-Inf
outputMat(1:6,1) = absTol; %relative Tolerance
outputMat(1:6,2) = ... %median error
   [errmedAsianCallIIDDiffAuto 
   errmedAsianCallSobDiffAuto 
   errmedAsianCallSobPCAAuto 
   errmedAsianCallSobPCACVAuto
   errmedAsianCallLatPCAAuto 
   errmedAsianCallBayesPCAAuto];
outputMat(1:6,3) = ... %success rate
   100*[successAsianCallIIDDiffAuto
   successAsianCallSobDiffAuto
   successAsianCallSobPCAAuto
   successAsianCallSobPCACVAuto
   successAsianCallLatPCAAuto
   successAsianCallBayesPCAAuto];
outputMat(1:6,4) = ... %worst n
   [ntopAsianCallIIDDiffAuto
   ntopAsianCallSobDiffAuto
   ntopAsianCallSobPCAAuto
   ntopAsianCallSobPCACVAuto
   ntopAsianCallLatPCAAuto
   ntopAsianCallBayesPCAAuto];
outputMat(1:6,5) = ... %worst time
   [timetopAsianCallIIDDiffAuto
   timetopAsianCallSobDiffAuto
   timetopAsianCallSobPCAAuto
   timetopAsianCallSobPCACVAuto
   timetopAsianCallLatPCAAuto
   timetopAsianCallBayesPCAAuto];

outputMat = round(outputMat,2,'significant');

if exist('AsianOutput.txt','file')
   delete AsianOutput.txt
end
diary AsianOutput.txt
disp(gail.cleanString(sprintf('%2.0E & \\text{IID} & \\text{diff} & %3.0E & %3.0f\\%% & %3.1E & %3.3f \\\\',outputMat(1,:))))
%disp(gail.cleanString(sprintf('%2.0E & \\text{Scr.\\ Sobol''} & \\text{diff} & %3.0E & %3.0f\\%% & %3.1E & %3.3f \\\\',outputMat(2,:))))
disp(gail.cleanString(sprintf('%2.0E & \\text{Sh.\\ Latt.} & \\text{PCA} & %3.0E & %3.0f\\%% & %3.1E & %3.3f \\\\',outputMat(5,:))))
disp(gail.cleanString(sprintf('%2.0E & \\text{Scr.\\ Sobol''} & \\text{PCA} & %3.0E & %3.0f\\%% & %3.1E & %3.3f \\\\',outputMat(3,:))))
disp(gail.cleanString(sprintf('%2.0E & \\text{Scr.\\ Sob.\\ cont.\\ var.} & \\text{PCA} & %3.0E &  %3.0f \\%% & %3.1E & %3.3f \\\\',outputMat(4,:))))
%disp(gail.cleanString(sprintf('%2.0E & \\text{Bayes.\\ Latt.} & \\text{PCA} & %3.0E & %3.0f\\%% & %3.1E & %3.3f \\\\',outputMat(6,:))))
diary off
return




