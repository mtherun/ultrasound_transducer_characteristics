function [freq,G,B] = load_admitance(pathname,filename)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

opts = delimitedTextImportOptions("NumVariables", 4);

% Specify range and delimiter
opts.DataLines = [18, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["HIOKIEECORPORATION", "IM3570", "Ver311", "VarName4"];
opts.VariableTypes = ["double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

fname = [pathname '\' filename];
% Import the data
Untitled = readtable(fname, opts);

%% Convert to output type
Untitled = table2array(Untitled);

freq = Untitled(:,2);
G    = Untitled(:,3);
B    = Untitled(:,4);

end
