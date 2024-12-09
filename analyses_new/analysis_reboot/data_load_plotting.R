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
birds <- read.table("data_set_final_210225.csv", stringsAsFactors = T, header = T, sep = ";")
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

#centre and scale cont parameters

birds$weight <- log(birds$weight)
birds$egg_mass <- log(birds$egg_mass)
birds$time_fed <- log(birds$time_fed + 1)
birds$food_energy <- (birds$food_energy)
birds$food_h_level <- (birds$food_h_level)
birds$fibres <- log(birds$fibres)
birds$caretakers <- log(birds$caretakers +1)
birds$clutch_size <- log(birds$clutch_size)
birds$brain_log <- log(birds$brain+1)
birds$brain <- birds$brain

#select relevant columns
birds %<>%  
  dplyr::select(., tip_label,
                #in_final_set,
                in_bioclim,
                time_fed,
                egg_mass,
                res_egg_mass,
                devo_mode,
                devo_mode_full,
                weight,
                res_weight,
                brain,
                brain_log,
                res_brain,
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
                Prum_order,
                #family,
                grouping
                
  )

# data set with complete data for selected columns 
birds <- birds[complete.cases(birds),]


#phylo tree####

Jetz.tree <- read.nexus("Jetztree1.nex")
matches<-match(Jetz.tree$tip.label, birds$tip_label, nomatch=0)
not<-subset(Jetz.tree$tip.label, matches==0)
birdtree.Jetz<-drop.tip(Jetz.tree, not)

name.check(birdtree.Jetz, data, data.names = birds$tip_label)

names(birds)

rownames(birds)<-birds[,"tip_label"]


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

