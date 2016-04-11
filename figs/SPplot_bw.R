# Tue Nov  3 10:20:20 BRST 2015 
#
# SP plot: a "Sao Paulo" plot for the Matrix Factorization: M = PE
#

library(plot3D)

# P matrix: 5 mutational processes; note that the entries of each
# process do not sum 1 -- this is in fact an artificial restriction 
p1 <- c(1,1,1,0,1,8,6,1,1,1,1)
p2 <- c(1,3,6,1,1,1,1,1,1,1,1)
p3 <- c(1,0,0,1,1,1,1,1,8,7,3)
p4 <- c(1,1,1,1,5,6,7,0,1,1,1)
p5 <- c(1,1,1,1,2,1,8,0,0,1,1)
P <- matrix(c(p1,p2,p3,p4,p5), nrow=length(p1))
x <- (1:length(p1))
y <- (1:5)
# E matrix; we assume there are 15 data sets
e1 <- c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1) 
e2 <- c(1,1,2,3,4,5,1,1,1,1,1,1,1,1,1)
e3 <- c(1,1,1,1,1,1,1,1,1,7,2,2,2,2,1)
e4 <- c(1,1,1,1,1,2,4,5,6,1,1,1,1,1,1)
e5 <- c(2,3,3,1,1,1,1,1,1,1,1,1,1,1,1)
E <- matrix(c(e1,e2,e3,e4,e5), nrow=5)
# M matrix
M <- P%*%E

#
layout(matrix(c(1,2,3), 1,3,byrow=TRUE), widths=c(1.2,1.2,1.4))
# for SVG:
#layout(matrix(c(1,2,3), 1,3,byrow=TRUE), widths=c(1.2,1.2,1.5))

# forestgreen: #01665e, brown, #4575b4

hist3D(x=seq(1,nrow(P))*1, y=seq(1,ncol(P))*1, z=P, lwd=0.4, lighting=F, space=0, expand = 0.15, col = ramp.col(c("white","gray30")), border="black", xlab="K", ylab="G", zlab="counts", colkey=F, ticks=F, ltheta=30, shade=0.01, scale=F,
theta=40, phi=35, axes=T)
# 
hist3D(x=seq(1,nrow(E))*1, y=seq(1,ncol(E))*1, z=E, lwd=0.4, lighting=F, space=0, expand = 0.4, col = ramp.col(c("white","gray30")), border="black", xlab="K", ylab="G", zlab="counts", colkey=F, ticks=F, ltheta=30, shade=0.01, scale=F, theta=40, axes=T)
#
hist3D(x=seq(1,nrow(M))*20, y=seq(1,ncol(M))*16, z=M, lwd=0.4,  lighting=F, space=0, expand = 1, col =  ramp.col(c("white","gray30")), border="black", xlab="K", ylab="G", zlab="counts", colkey=F, ticks=F, ltheta=205, shade=0.01, scale=F,theta=40, axes=T)


plt <- recordPlot()
#postscript(file="./SPplot.eps", width=12, height=3, horizontal=FALSE)
svg("f_bw.svg")
replayPlot(plt)
dev.off()
# NOTE: had to edit the bounding box of the EPS file (any editor) to 
#       enhance cropping! 
#       The bounding box was set to %%BoundingBox: 40 340 565 510
#       Then, at command prompt: epstopdf SPplot.eps

