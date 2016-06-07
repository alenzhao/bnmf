See the plots and the instruction at

/Users/rrosales/Dropbox/prj/p9/grp/isr/sign/runs/rd-rr/myeloma-165/12-3-16

Signature Plots
===============
The following ilustrates how to get my black­and-white signature bar plots;
one by one (not all in a single page), using my signPlots.R code.

At the directory

/Users/rrosales/Dropbox/prj/p9/grp/isr/sign/runs/rd-rr/s1


load("signeR_full.RData")
SE <- sigfull$SignExposures
Ps <- SE$.Sign
Phats <- sigfull$Phat
source("../../../Code/signPlots.R") # my old plotting functions
sign.Bar.plot(2, pal="bw", space=0)
# or
sign.Bar.plot(3, pal="gg", space=.3)
