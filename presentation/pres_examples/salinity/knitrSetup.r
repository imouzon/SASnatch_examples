#--------------------------------------**--------------------------------------#
#  File Name:
#  Purpose:
#
#  Creation Date: 06-02-2014
#  Last Modified: Mon Apr 28 12:19:52 2014
#  Created By:
#
#--------------------------------------**--------------------------------------#
#
#  FORTRAN and C: 
#  source('~/R/shlib/C_FORTRAN.shlib.r')
#  .Fortran("subroutine name",as.integer(input1),as.double(input2), etc)
#
knitrSetup = function(rootDir = FALSE){
  require('knitr')
  if(rootDir == FALSE) rootDir <- getwd()
  
  #store figures in the fig folder, prefix with 'graphics-'
  fig.folder = paste(rootDir,'/fig/',sep='')
  fig.prefix = paste('fig_',format(Sys.time(),'%m-%d'),sep='')
  fig.path = paste(fig.folder,fig.prefix,'_',sep='')
  
  #cahced output stored in cache.path
  cache.path = paste(rootDir,'/out/cache/',sep='')
  
  options(replace.assign=TRUE,width=50)
  opts_chunk$set(
    fig.path=fig.path,
    cache.path=cache.path,
    fig.align='center', 
    fig.width=5, 
    fig.height=5, 
    fig.pos = 'h',
    fig.show='hold', 
    tidy=TRUE,
    par=TRUE
  )
  
}
knitrSetup()
