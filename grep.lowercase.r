#--------------------------------------**--------------------------------------#
#  File Name:
#  Purpose:
#
#  Creation Date: 26-04-2014
#  Last Modified: Sat Apr 26 19:52:12 2014
#  Created By:
#
#--------------------------------------**--------------------------------------#
#
#  FORTRAN and C: 
#  source('~/R/shlib/C_FORTRAN.shlib.r')
#  .Fortran("subroutine name",as.integer(input1),as.double(input2), etc)
#


place <- "\\\\iastate.edu/cyfiles/hofmann/Documents/R/win-library/3.0"
if(grep('iastate.edu',place)){
   place <- 
      unlist(strsplit(place,'/'))
   place <- paste('U:',paste(place[4:length(place)],collapse='/'),sep='/')
}
place
