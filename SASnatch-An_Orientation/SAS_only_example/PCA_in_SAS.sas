/*----------------------------------------------------------------------------*/
/*  File Name: PCA_in_SAS.sas
/*  Purpose: This example illustrates the basic flow of SAS code.
/*           in STEP 1 we read code into SAS creating a dataset TURTLES
/*           in SAS's work library. In STEP 2 we use PROC PRINCOMP to perform
/*           a Principal Component Analysis on the set creating output dataset
/*           PCA1 in the work library which contains the output information.
/*           Additionally, the procedure prints results to the output window.
/*           Last in STEP 3, we plot the components against each other.
/*
/*  Points of Interest: SAS has 2 ways to communicate with you:
/*                      1. The SAS log
/*                      2. The SAS output window
/*                      You have two ways to communicate with SAS:
/*                      3. SAS libraries (telling SAS what data is around)
/*                      4. SAS code (telling SAS what to do with the data)
/*
/*  Creation Date: 02-05-2014
/*  Last Modified: Fri May  2 14:07:04 2014
/*  Created By: 
/*----------------------------------------------------------------------------*/

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
