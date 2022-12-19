## Szymek Drobniak
## 200819
## bird brain data loading

library(magrittr)
library(dplyr)
library(ape)
library(caper)
library(ggplot2)
library(plotly)
library(MuMIn)
library(phylolm)
library(geiger)
require(BSDA)
require(psych)
require(nFactors)
require (GPArotation)
require (gdata)

# main data set
birds <- read.table("220501_all_species_corrected.csv", stringsAsFactors = T, header = T, sep = ";")
#birds <- read.table("set_5.csv", stringsAsFactors = T, header = T, sep = ";")
#birds2 <- read.table("set_2.txt", stringsAsFactors = T, header = T, sep = "\t")


# relevel devo mode, chick modus, fam sys
birds$devo_mode <- relevel(birds$devo_mode, ref="precocial")
#birds$fam_sys <- relevel(birds$fam_sys_inferred50, ref="family")

# add residuals:
birds$res_brain_dm <- resid(lm(log(brain) ~ log(weight) + devo_mode, 
                            data = birds, 
                            na.action=na.exclude))
birds$res_brain <- resid(lm(log(brain) ~ log(weight), 
                            data = birds, 
                            na.action=na.exclude))
birds$res_egg_mass <- resid(lm(log(egg_mass) ~ log(weight) , 
                               data = birds, 
                               na.action=na.exclude))

birds$res_weight <- resid(lm(log(weight) ~ log(egg_mass) , 
                             data = birds, 
                             na.action=na.exclude))

# compute clade-specific allometries
birds$res_brain_clade <- NA
for (order in levels(birds$PrumOrder)) {
  indices <- which(birds$PrumOrder == order)
  
  clade_residuals <- resid(lm(log(brain) ~ log(weight), 
                              data = birds[indices,]))
  birds[indices, 'res_brain_clade'] <- clade_residuals
}

#centre and scale cont parameters
birds$weight_log <- scale(log(birds$weight))
birds$weight <- scale(log(birds$weight))
birds$egg_mass <- scale(log(birds$egg_mass))
birds$time_fed <- scale(log(birds$time_fed + 1))
birds$food_energy <- scale((birds$food_energy))
birds$food_h_level <- scale((birds$food_h_level))
birds$fibres <- scale(log(birds$fibres))
birds$caretakers <- scale(log(birds$caretakers + 1))
birds$clutch_size <- scale(log(birds$clutch_size))
birds$brain_log <- scale(log(birds$brain))
birds$brain <- scale(birds$brain)

#select relevant columns
birds %<>%  
  dplyr::select(., tip_label,
                in_final_set,
                in_bioclim,
                Feng,
                IOCOrder,
                PrumOrder,
                time_fed,
                egg_mass,
                res_egg_mass,
                devo_mode,
                devo_mode_full,
                weight,
                weight_log,
                res_weight,
                brain,
                brain_log,
                res_brain,
                res_brain_clade,
                clutch_size,
                food_energy,
                fibres,
                food_h_level,
                social_bonds,
                colonial,
                foraging_3,
                move_max,
                insularity,
                caretakers, 
                # clutch_size_c,
                # time_fed_c,
                # weight_c,
                # order,
                # family,
                grouping
                
  )

# data set with complete data for selected columns 
birds <- birds[complete.cases(birds),]
FJ_corr <- read.csv("220424_jetz_feng.csv", sep = ";")
birds2 <- merge(birds, FJ_corr, by = "tip_label")
birds2$tip_label_feng <- as.factor(birds2$tip_label_feng)

#phylo tree####

Jetz.tree <- read.nexus("Jetztree1.nex")
Feng.tree <- read.tree("Feng_tree.txt")
Feng.tree$node.label <- NULL


matches<-match(Jetz.tree$tip.label, birds$tip_label, nomatch=0)
not<-subset(Jetz.tree$tip.label, matches==0)
birdtree.Jetz<-drop.tip(Jetz.tree, not)

matches <- match(Feng.tree$tip.label, birds2$tip_label_feng, nomatch=0)
not <- subset(Feng.tree$tip.label, matches==0)
birdtree.Feng <- drop.tip(Feng.tree, not)
birdtree.Feng <- compute.brlen(birdtree.Feng)

name.check(birdtree.Jetz, data, data.names = birds$tip_label)
name.check(birdtree.Feng, data, data.names = birds2$tip_label_feng)

#names(birds)

rownames(birds)<-birds[,"tip_label"]
rownames(birds2)<-birds2[,"tip_label_feng"]


# calculate food variables PCA ----

ev <- eigen(cor(birds[, c("food_energy", "fibres", "food_h_level")])) # get eigenEstimates
ap <- parallel(subject=nrow(birds[, c("food_energy", "fibres", "food_h_level")]),
               var=ncol(birds[, c("food_energy", "fibres", "food_h_level")]),
               rep=100,cent=.05)
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS) # this suggests we extract 5 factors...

# this time it seems like 8 factor capture most of what is going on...
foodPCA <- principal(birds[, c("food_energy", "fibres", "food_h_level")], nfactors = 2, rotate = 'varimax', scores = T)
foodPCA
biplot(foodPCA)

# label PCs
colnames(foodPCA$scores)[1] <- 'food_h_level_nofibres_RC'
colnames(foodPCA$scores)[2] <- 'food_energy_RC'

birds <- cbind(birds, foodPCA$scores)


ev <- eigen(cor(birds2[, c("food_energy", "fibres", "food_h_level")])) # get eigenEstimates
ap <- parallel(subject=nrow(birds2[, c("food_energy", "fibres", "food_h_level")]),
               var=ncol(birds2[, c("food_energy", "fibres", "food_h_level")]),
               rep=100,cent=.05)
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS) # this suggests we extract 5 factors...

# this time it seems like 8 factor capture most of what is going on...
foodPCA <- principal(birds2[, c("food_energy", "fibres", "food_h_level")], nfactors = 2, rotate = 'varimax', scores = T)
foodPCA
biplot(foodPCA)

# label PCs
colnames(foodPCA$scores)[1] <- 'food_h_level_nofibres_RC'
colnames(foodPCA$scores)[2] <- 'food_energy_RC'

birds2 <- cbind(birds2, foodPCA$scores)

