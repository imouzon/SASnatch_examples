 *ODS TRACE follows the SAS output;
 ods trace on; ods noproctitle; title;

 *ODS HTML template;
 ods html body = "turtleSAS.html" NEWFILE = OUTPUT;

 *ODS LaTeX template;
ods tagsets.simplelatex file="SASCACHE/SASnatch-chunk-name.tex" (notop nobot) stylesheet = "sas.sty"(url = "sas") NEWFILE = table;

      OPTIONS LS=80;
      DATA TURTLES;
         INFILE "turtles.txt";
         INPUT LENGTH WIDTH HEIGHT SEX;
	  RUN;
      PROC PRINCOMP COV OUT=PCA1;
      VAR LENGTH WIDTH HEIGHT;
	  RUN;
      PROC PLOT DATA=PCA1;
      PLOT PRIN2*PRIN1;
      PLOT PRIN3*PRIN1;
      PLOT PRIN3*PRIN2;
      RUN;

	  ods _all_ close;
