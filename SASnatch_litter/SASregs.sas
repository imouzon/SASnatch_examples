

ods trace on; ods noproctitle; title;

ods html body = "~/courses/stat585/SASnatch_examples//SASregs.html" NEWFILE = OUTPUT;

ods tagsets.tablesonlylatex file="~/courses/stat585/SASnatch_examples//SASregs.tex" (notop nobot) NEWFILE = table;

PROC IMPORT DATAFILE = "~/courses/stat585/SASnatch_examples//d1, d2.csv" out = d1, d2 dbms = CSV replace; getnames = yes; run;

proc reg data = d; model y = x; out = dsnout p = yhat; run;

PROC IMPORT DATAFILE = "~/courses/stat585/SASnatch_examples//d1, d2.csv" out = d1, d2 dbms = CSV replace; getnames = yes; run;

ods _all_ close; ods trace off; run;

proc printto; run;
