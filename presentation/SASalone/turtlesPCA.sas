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