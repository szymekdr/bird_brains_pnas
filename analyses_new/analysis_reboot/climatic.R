#Climatic PCAs for bird brains####

#load packages
#require(geiger)
require(BSDA)
require(psych)
require(nFactors)
require (GPArotation)
#require (gdata)


#load climatic data

bioclim <- read.table('201103_birds_gbd_bioclim_complete_vars.csv', sep = ';', header = T)

ev <- eigen(cor(bioclim)) # get eigenEstimates
ap <- parallel(subject=nrow(na.omit(bioclim)),var=ncol(na.omit(bioclim)),
               rep=100,cent=.05)
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS) # this suggests we extract 3 factors...

# this time it seems like 8 factor capture most of what is going on...
myPCA <- principal(bioclim, nfactors = 3, rotate = 'varimax', scores = T)
myPCA

# label PCs
myPCA$scores[,1] <- -myPCA$scores[,1]
colnames(myPCA$scores)[1] <- 'temp_rain'
colnames(myPCA$scores)[2] <- 'temp_stdv'
colnames(myPCA$scores)[3] <- 'temp_range'

climatic_brain <- read.table('201103_birds_gbd_bioclim_complete.csv', sep = ';', header = T)
climatic_brain <- cbind(climatic_brain,myPCA$scores)
climatic_brain <- climatic_brain[c(2,18:20)]
birds <- merge(birds, climatic_brain, by='tip_label')
birds2 <- merge(birds2, climatic_brain, by='tip_label')

# rm(bioclim, climatic_brain, ap, ev, nS, myPCA)

# write.table(birds, "../birds.txt", sep="\t") 
