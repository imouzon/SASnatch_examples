/*----------------------------------------------------------------------------*/
/*  File Name: PCA_in_SAS_with_ODS.sas
/*  Purpose: This example illustrates the builds on the code in PCA_in_SAS.sas.
/*           Specifically, it makes use of SAS's Output Delivery System, which
/*           is one of the main building blocks of SASnatch.
/*           SAS's ODS determines the way, type, and amount of output
/*           SAS creates.
/*
/*  Points of Interest: By specifying the ODS statements you can exert
/*                      enormous control over your output. This is very
/*                      useful for us since we can automate these steps.
/*
/*  Creation Date: 02-05-2014
/*  Last Modified: Fri May  2 14:07:04 2014
/*  Created By: 
/*----------------------------------------------------------------------------*/

*-- STEP 0: Initialize ODS; 
   *Start ODS trace to print which tables have been created to the log;
   ods trace on; 

   *No procedure titles in the output;
   ods noproctitle; 

   *Start with a blank main title;
   title;

   *ODS HTML template creates HTML files pca_in_SAS in SAS's working directory;
   ods html body = "pca_in_SAS.html" NEWFILE = OUTPUT;

   *ODS LaTeX template creates LaTeX files pca_in_SAS.tex in SAS's working dir;
   ods tagsets.simplelatex 
      file="SASCACHE/SASnatch-chunk-name.tex" 
      (notop nobot) 
      stylesheet = "sas.sty"(url = "sas") 
      NEWFILE = table
   ;

*-- STEP 1: Reading the data into SAS (creates dataset TURTLES);
DATA TURTLES;
   INFILE "../data/turtles.txt";
   INPUT LENGTH WIDTH HEIGHT SEX;
RUN;

*-- STEP 2: Use PROC PRINCOMP to perform a PCA on the dataset TURTLES;
PROC PRINCOMP DATA = TURTLES COV OUT=PCA1;
  VAR LENGTH WIDTH HEIGHT;
RUN;

*-- STEP 3: Plot the results from PROC PRINCOMP;
PROC PLOT DATA=PCA1;
   PLOT PRIN2*PRIN1;
   PLOT PRIN3*PRIN1;
   PLOT PRIN3*PRIN2;
RUN;

*-- STEP 4: Turn off ODS so that files can print;
ods _all_ close;
