## Szymek Drobniak
## Bird brains MCMCglmm analyses
## 01/05/2022


# preps and setting things up ----

rm(list = ls())
# setwd

require(phylolm)
require(ape)
require(caper)
require(geiger)  
require(phylopath)
require(gmm)
require(lme4)
require(magrittr)
require(dplyr)
require(ggplot2)
require(MuMIn)
require (VIF)

require(MCMCglmm)

# library(asreml)



# data load and transforms ----

source(file = 'data_load.R')
phylo_vcv <- vcv.phylo(birdtree.Jetz, corr = T)
source('climatic.R')

names(birds)[which(names(birds) == "family")] <- 'tax_family'

# # split data into subsets ----
# 
# alt <- birds %>% filter(devo_mode == 'altrical')
# prec <- birds %>% filter(devo_mode == 'precocial')


# generalized inverses for phylogenetic matrices ----

tree_jetz_data <- birdtree.Jetz
sort(tree_jetz_data$edge.length) # check branch lengths
tree_jetz_data$edge.length[tree_jetz_data$edge.length == 0] <- 1e-10
tree_jetz_data_AINV <- inverseA(tree_jetz_data, nodes = "ALL")


# explore clade-specific data

plot <- ggplot(birds, mapping = aes(x = res_brain, y = res_brain_clade, col = PrumOrder)) +
  geom_point() +
  theme_bw() +
  geom_abline(slope = 1, intercept = 0, col = 'red', lty = 2)
plot


# PRIORS for MCMCglmm models and other control variables ----

prior1 <- list(R = list(V = 1, nu = 0.002),
               G = list(G1 = list(V = 1, nu = 0.002, alpha.mu = 0, alpha.V = 1e5)))

VERB = T

## model 1 - our original (final) allocation model
model_alloc_f_res <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                devo_mode:weight + devo_mode:time_fed +
                                res_egg_mass:devo_mode + 
                                res_egg_mass:weight +
                                clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass,
                              random = ~ tip_label,
                              ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                              prior = prior1,
                              data = birds,
                              nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
autocorr.plot(model_alloc_f_res$Sol)
autocorr.plot(model_alloc_f_res$VCV)
summary(model_alloc_f_res)

model_alloc_f_res_s <- MCMCglmm(res_brain_clade ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                devo_mode:weight + devo_mode:time_fed +
                                res_egg_mass:devo_mode + 
                                res_egg_mass:weight +
                                clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass,
                              random = ~ tip_label,
                              ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                              prior = prior1,
                              data = birds,
                              nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
autocorr.plot(model_alloc_f_res_s$Sol)
autocorr.plot(model_alloc_f_res_s$VCV)
summary(model_alloc_f_res_s)

## model 2 - overall and specific allometry, Passeriformes
model_alloc_f_res2 <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                devo_mode:weight + devo_mode:time_fed +
                                res_egg_mass:devo_mode + 
                                res_egg_mass:weight +
                                clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass,
                              random = ~ tip_label,
                              ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                              prior = prior1,
                              data = subset(birds, PrumOrder == 'Passeriformes'),
                              nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
autocorr.plot(model_alloc_f_res2$Sol)
autocorr.plot(model_alloc_f_res2$VCV)
summary(model_alloc_f_res2)

model_alloc_f_res2s <- MCMCglmm(res_brain_clade ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                 devo_mode:weight + devo_mode:time_fed +
                                 res_egg_mass:devo_mode + 
                                 res_egg_mass:weight +
                                 clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass,
                               random = ~ tip_label,
                               ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                               prior = prior1,
                               data = subset(birds, PrumOrder == 'Passeriformes'),
                               nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
autocorr.plot(model_alloc_f_res2s$Sol)
autocorr.plot(model_alloc_f_res2s$VCV)
summary(model_alloc_f_res2s)

## model 2 - overall and specific allometry, Aequorlitornites
model_alloc_f_res3 <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                 devo_mode:weight + devo_mode:time_fed +
                                 res_egg_mass:devo_mode + 
                                 res_egg_mass:weight +
                                 clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass,
                               random = ~ tip_label,
                               ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                               prior = prior1,
                               data = subset(birds, PrumOrder == 'Aequorlitornithes'),
                               nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
autocorr.plot(model_alloc_f_res3$Sol)
autocorr.plot(model_alloc_f_res3$VCV)
summary(model_alloc_f_res3)

model_alloc_f_res3s <- MCMCglmm(res_brain_clade ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                 devo_mode:weight + devo_mode:time_fed +
                                 res_egg_mass:devo_mode + 
                                 res_egg_mass:weight +
                                 clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass,
                               random = ~ tip_label,
                               ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                               prior = prior1,
                               data = subset(birds, PrumOrder == 'Aequorlitornithes'),
                               nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
autocorr.plot(model_alloc_f_res3s$Sol)
autocorr.plot(model_alloc_f_res3s$VCV)
summary(model_alloc_f_res3s)

## model 3 - overall allometry, Accipitiformes
model_alloc_f_res4 <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                 devo_mode:weight + devo_mode:time_fed +
                                 res_egg_mass:devo_mode + 
                                 res_egg_mass:weight +
                                 clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass,
                               random = ~ tip_label,
                               ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                               prior = prior1,
                               data = subset(birds, PrumOrder == 'Accipitriformes'),
                               nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
autocorr.plot(model_alloc_f_res4$Sol)
autocorr.plot(model_alloc_f_res4$VCV)
summary(model_alloc_f_res4)

model_alloc_f_res4s <- MCMCglmm(res_brain_clade ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                 devo_mode:weight + devo_mode:time_fed +
                                 res_egg_mass:devo_mode + 
                                 res_egg_mass:weight +
                                 clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass,
                               random = ~ tip_label,
                               ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                               prior = prior1,
                               data = subset(birds, PrumOrder == 'Accipitriformes'),
                               nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
autocorr.plot(model_alloc_f_res4s$Sol)
autocorr.plot(model_alloc_f_res4s$VCV)
summary(model_alloc_f_res4s)


## model 4 - combined model all data
model_combined_f_res <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                   devo_mode:weight + devo_mode:time_fed +
                                   res_egg_mass:weight + 
                                   clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                                   res_egg_mass:devo_mode +
                                   
                                   foraging_3 + move_max + 
                                   food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                   temp_range + temp_rain + temp_stdv +
                                   foraging_3:weight + move_max:weight + food_energy_RC:weight +
                                   
                                   
                                   food_energy_RC:clutch_size +
                                   food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size
                                 ,
                                 random = ~ tip_label,
                                 ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                                 prior = prior1,
                                 data = birds,
                                 nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
summary(model_combined_f_res)


model_combined_f_res_s <- MCMCglmm(res_brain_clade ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                   devo_mode:weight + devo_mode:time_fed +
                                   res_egg_mass:weight + 
                                   clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                                   res_egg_mass:devo_mode +
                                   
                                   foraging_3 + move_max + 
                                   food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                   temp_range + temp_rain + temp_stdv +
                                   foraging_3:weight + move_max:weight + food_energy_RC:weight +
                                   
                                   
                                   food_energy_RC:clutch_size +
                                   food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size
                                 ,
                                 random = ~ tip_label,
                                 ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                                 prior = prior1,
                                 data = birds,
                                 nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
summary(model_combined_f_res_s)


## model 5 - combined for Passeriformes

model_combined_f_res1 <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                   devo_mode:weight + devo_mode:time_fed +
                                   res_egg_mass:weight + 
                                   clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                                   res_egg_mass:devo_mode +
                                   
                                   foraging_3 + move_max + 
                                   food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                   temp_range + temp_rain + temp_stdv +
                                   foraging_3:weight + move_max:weight + food_energy_RC:weight +
                                   
                                   
                                   food_energy_RC:clutch_size +
                                   food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size
                                 ,
                                 random = ~ tip_label,
                                 ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                                 prior = prior1,
                                 data = subset(birds, PrumOrder == "Passeriformes"),
                                 nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
summary(model_combined_f_res1)


model_combined_f_res1s <- MCMCglmm(res_brain_clade ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                     devo_mode:weight + devo_mode:time_fed +
                                     res_egg_mass:weight + 
                                     clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                                     res_egg_mass:devo_mode +
                                     
                                     foraging_3 + move_max + 
                                     food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                     temp_range + temp_rain + temp_stdv +
                                     foraging_3:weight + move_max:weight + food_energy_RC:weight +
                                     
                                     
                                     food_energy_RC:clutch_size +
                                     food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size
                                   ,
                                   random = ~ tip_label,
                                   ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                                   prior = prior1,
                                   data = subset(birds, PrumOrder == "Passeriformes"),
                                   nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
summary(model_combined_f_res1s)


## model 6 - combined for Aequolitornites

model_combined_f_res2 <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                    devo_mode:weight + devo_mode:time_fed +
                                    res_egg_mass:weight + 
                                    clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                                    res_egg_mass:devo_mode +
                                    
                                    foraging_3 + move_max + 
                                    food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                    temp_range + temp_rain + temp_stdv +
                                    foraging_3:weight + move_max:weight + food_energy_RC:weight +
                                    
                                    
                                    food_energy_RC:clutch_size +
                                    food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size
                                  ,
                                  random = ~ tip_label,
                                  ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                                  prior = prior1,
                                  data = subset(birds, PrumOrder == 'Aequorlitornithes'),
                                  nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
summary(model_combined_f_res2)


model_combined_f_res2s <- MCMCglmm(res_brain_clade ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                     devo_mode:weight + devo_mode:time_fed +
                                     res_egg_mass:weight + 
                                     clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                                     res_egg_mass:devo_mode +
                                     
                                     foraging_3 + move_max + 
                                     food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                     temp_range + temp_rain + temp_stdv +
                                     foraging_3:weight + move_max:weight + food_energy_RC:weight +
                                     
                                     
                                     food_energy_RC:clutch_size +
                                     food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size
                                   ,
                                   random = ~ tip_label,
                                   ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                                   prior = prior1,
                                   data = subset(birds, PrumOrder == 'Aequorlitornithes'),
                                   nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
summary(model_combined_f_res2s)


## model 7 - combined for Accipitiformes

model_combined_f_res3 <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                    devo_mode:weight + devo_mode:time_fed +
                                    res_egg_mass:weight + 
                                    clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                                    res_egg_mass:devo_mode +
                                    
                                    foraging_3 + move_max + 
                                    food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                    temp_range + temp_rain + temp_stdv +
                                    foraging_3:weight + move_max:weight + food_energy_RC:weight +
                                    
                                    
                                    food_energy_RC:clutch_size +
                                    food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size
                                  ,
                                  random = ~ tip_label,
                                  ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                                  prior = prior1,
                                  data = subset(birds, PrumOrder == 'Accipitriformes'),
                                  nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
summary(model_combined_f_res3)


model_combined_f_res3s <- MCMCglmm(res_brain_clade ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                     devo_mode:weight + devo_mode:time_fed +
                                     res_egg_mass:weight + 
                                     clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                                     res_egg_mass:devo_mode +
                                     
                                     foraging_3 + move_max + 
                                     food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                     temp_range + temp_rain + temp_stdv +
                                     foraging_3:weight + move_max:weight + food_energy_RC:weight +
                                     
                                     
                                     food_energy_RC:clutch_size +
                                     food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size
                                   ,
                                   random = ~ tip_label,
                                   ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                                   prior = prior1,
                                   data = subset(birds, PrumOrder == 'Accipitriformes'),
                                   nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
summary(model_combined_f_res3s)
