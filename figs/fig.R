
# load and prepare the data
dt <- read.table("~/Dropbox/prj/p9/grp/isr/sign/data/67_myeloma.txt", header=T, row.names=NULL)
dt$change <- NULL
colnames(dt) <- NULL
M <- as.matrix(dt)

# load eBayesNMF_3 results
load("~/prj/p9/grp/isr/sign/run/67_myeloma/eBayesNMF3/run4/10signatures.RData")
Mhats <- Phats %*% Ehats

# a hist3D plot with nice shading/colors
library(plot3D)

col1 <- ramp.col(c("#ffffff","orange","#d6604d","#b2182b"))
col2 <- ramp.col(c('#ffffff', '#67001f'))
col3 <- ramp.col(c('#ffffff', 'brown'))
col4 <- ramp.col(c('#ffffff', 'forestgreen'))
col5 <- ramp.col(c('#ffffff', 'orange'))
col6 <- ramp.col(c('#ffffff', '#4575b4'))
col7 <- ramp.col(c('#ffffff', '#40004b'))

layout(matrix(c(1,2,3), 1,3,byrow=TRUE), widths=c(1,1,1.7))


hist3D(x=seq(1,nrow(Phats))*1, y=seq(1,ncol(Phats))*1.7, z=Phats,
       col = col5,
       expand = 1.75,
       ticks=F,
       ltheta=220,
       shade=0.1,
       scale=F,
       theta=60,
       phi=25,
       axes=T,
       colkey=F)


hist3D(x=seq(1,nrow(Ehats))*1.15, y=seq(1,ncol(Ehats))*1, z=Ehats,
       col = col4,
       expand = 1,
       ticks=F,
       ltheta=220,
       shade=0.1,
       scale=F,
       theta=25,
       phi=25,
       axes=T,
       colkey=F)

hist3D(x=seq(1,nrow(Mhats))*20, y=seq(1,ncol(Mhats))*20, z=Mhats,
       col=col7,
       expand=5,
       ticks=F,
       ltheta=220,
       shade=0.1,
       scale=F,
       theta=40,
       axes=T,
       colkey=F)
