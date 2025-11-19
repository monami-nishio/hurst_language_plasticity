addpath(genpath('../../202402_paper_hurst/Rmodules'))
lb = [-0.5,0];
ub = [1.5,10];

H_all = [];
nfcor_all = zeros(400,400);
fcor_all = zeros(400,400);
int_all = [];
sub_all = strings(0,1);
ses_all = strings(0,1);
run_all = strings(0,1);
subjlist = dir('../dataset/BCP_alex_20251114/*run*.tsv'); 
for n=1:height(subjlist)
    filename = subjlist(n).name; 
    parts = split(filename, '_');
    sub=parts{1}; 
    ID = strcat(sub);
    ses=parts{2}; 
    Session = strcat(ses);
    run=parts{5};
    Run = strcat(run);
    subpath = strcat(subjlist(n).folder, '/', subjlist(n).name);
    %table = readtable(subpath, "FileType","text",'Delimiter', ',');
    table = readtable(subpath, 'FileType', 'text', 'Delimiter', '\t');
    for j = 1:width(table)
        if isa(table.(j)(1),'double') == 0
            print(j)
            if j == 1
                table.(j) = table.(j+1);
            else
                table.(j) = table.(j-1);
            end
        end
    end 
    if height(table) > 10
        ArrayTable = table2array(table(2:end, :));
        [H, nfcor, fcor] = bfn_mfin_ml(ArrayTable, 'filter', 'Haar', 'lb', lb, 'ub', ub);
        H_all = [H_all; H];
        sub_all = [sub_all; ID];
        ses_all = [ses_all; Session];
        run_all = [run_all; Run];
    end
    
end
H_all = [num2cell(H_all) cellstr(sub_all) cellstr(ses_all) cellstr(run_all)];
H_all = cell2table(H_all);
writetable(H_all, '../derivatives/Hurst_BCP_Alex_29.csv');