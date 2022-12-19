## Szymek Drobniak
## Bird brains MCMCglmm analyses
## 30/06/2020


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

library(asreml)



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

# PRIORS for MCMCglmm models and other control variables ----

prior1 <- list(R = list(V = 1, nu = 0.002),
               G = list(G1 = list(V = 1, nu = 0.002, alpha.mu = 0, alpha.V = 1e5)))

VERB = T

# # prep MCMCglmm for model selection
# 
# MCMCglmm_w <- updateable(MCMCglmm)

# MODEL 1 - simple maternal allocation ----

# model_1 <- MCMCglmm_w(log(brain) ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size,
#                       random = ~ tip_label,
#                       ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
#                       prior = prior1,
#                       data = birds,
#                       nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
# 
# model_1alt <- MCMCglmm_w(log(brain) ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size,
#                          random = ~ tip_label,
#                          ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
#                          prior = prior1,
#                          data = alt,
#                          nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
# 
# model_1prec <- MCMCglmm_w(log(brain) ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size,
#                           random = ~ tip_label,
#                           ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
#                           prior = prior1,
#                           data = prec,
#                           nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
# 
# # diagnostic checks
# autocorr.plot(model_1$Sol)
# autocorr.plot(model_1$VCV)
# plot(model_1)
# 
# autocorr.plot(model_1alt$Sol)
# autocorr.plot(model_1alt$VCV)
# plot(model_1alt)
# 
# autocorr.plot(model_1prec$Sol)
# autocorr.plot(model_1prec$VCV)
# plot(model_1prec)
model_alloc_full <- MCMCglmm(brain_log ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                            devo_mode:weight + devo_mode:time_fed +
                            res_egg_mass:weight + 
                            clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                              time_fed:caretakers + weight:time_fed + devo_mode:caretakers + devo_mode:res_egg_mass +
                              time_fed:res_egg_mass + res_egg_mass:caretakers + time_fed:clutch_size,
                          random = ~ tip_label,
                          ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                          prior = prior1,
                          data = birds,
                          nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
autocorr.plot(model_alloc_full$VCV)
autocorr.plot(model_alloc_full$Sol)
summary(model_alloc_full)

model_alloc_f <- MCMCglmm(brain_log ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                            devo_mode:weight + devo_mode:time_fed +
                            res_egg_mass:weight + 
                            clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                            devo_mode:res_egg_mass,
                          random = ~ tip_label,
                          ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                          prior = prior1,
                          data = birds,
                          nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
summary(model_alloc_f)
p2 <- model_alloc_f$VCV[,"tip_label"]/(model_alloc_f$VCV[,"tip_label"]+model_alloc_f$VCV[,"units"])
posterior.mode(p2)
HPDinterval(p2)

model_alloc_f_fix <- MCMCglmm(brain_log ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                devo_mode:weight + devo_mode:time_fed +
                                res_egg_mass:weight + 
                                clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                                devo_mode:res_egg_mass,
                          
                          #ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                          #prior = prior1,
                          data = birds,
                          nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
fs <- predict(model_alloc_f_fix)
var(fs)/(var(fs) + mean(model_alloc_f$VCV[,"tip_label"]) + mean(model_alloc_f$VCV[,"units"]))


model_alloc_f_2 <- MCMCglmm(brain_log ~ devo_mode + time_fed + res_egg_mass + clutch_size + caretakers +
                              devo_mode:time_fed +
                              clutch_size:devo_mode + clutch_size:res_egg_mass +
                              devo_mode:res_egg_mass,
                          random = ~ tip_label,
                          ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                          prior = prior1,
                          data = birds,
                          nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
model_alloc_f_2_fix <- MCMCglmm(brain_log ~ devo_mode + time_fed + res_egg_mass + clutch_size + caretakers +
                                  devo_mode:time_fed +
                                  clutch_size:devo_mode + clutch_size:res_egg_mass +
                                  devo_mode:res_egg_mass,
                              
                              #ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                              #prior = prior1,
                              data = birds,
                              nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
fs <- predict(model_alloc_f_2_fix)
var(fs)/(var(fs) + mean(model_alloc_f_2$VCV[,"tip_label"]) + mean(model_alloc_f_2$VCV[,"units"]))



model_alloc_f_res_full <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                     devo_mode:weight + caretakers:time_fed + devo_mode:time_fed +
                                     time_fed:weight + devo_mode:caretakers + res_egg_mass:devo_mode + 
                                     res_egg_mass:time_fed + res_egg_mass:weight + res_egg_mass:caretakers + 
                                     clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass + clutch_size:time_fed,
                                   random = ~ tip_label,
                                   ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                                   prior = prior1,
                                   data = birds,
                                   nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
summary(model_alloc_f_res_full)

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
summary(model_alloc_f_res)
p2 <- model_alloc_f_res$VCV[,"tip_label"]/(model_alloc_f_res$VCV[,"tip_label"]+model_alloc_f_res$VCV[,"units"])
posterior.mode(p2)
HPDinterval(p2)

model_alloc_f_res_fix <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                    devo_mode:weight + devo_mode:time_fed +
                                    res_egg_mass:devo_mode + 
                                    res_egg_mass:weight +
                                    clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass,
                              
                              
                              #prior = prior1,
                              data = birds,
                              nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
fs <- predict(model_alloc_f_res_fix)
var(fs)/(var(fs) + mean(model_alloc_f_res$VCV[,"tip_label"]) + mean(model_alloc_f_res$VCV[,"units"]))





# MODEL 2 - eco-social model w/ climate ----


model_ecosocial_full <- MCMCglmm(brain_log ~ weight + foraging_3 + move_max + 
                                     food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                     temp_range + temp_rain + 
                                     foraging_3:weight + move_max:weight + food_energy_RC:weight + food_h_level_nofibres_RC:weight + 
                                     insularity:weight+social_bonds:weight + colonial:weight + grouping:weight +
                                     food_energy_RC:temp_range + food_energy_RC:temp_rain +
                                     weight:temp_range + weight:temp_rain +
                                     move_max:temp_range + move_max:temp_rain +
                                     social_bonds:temp_range + social_bonds:temp_rain
                                     ,
                                   random = ~ tip_label,
                                   ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                                   prior = prior1,
                                   data = birds,
                                   nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)


autocorr.plot(model_ecosocial_full$Sol)
autocorr.plot(model_ecosocial_full$VCV)
plot(model_ecosocial_full$VCV)
summary(model_ecosocial_full)


model_ecosocial_f <- MCMCglmm(brain_log ~ weight + foraging_3 + move_max + 
                                food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                temp_range + temp_rain + 
                                foraging_3:weight + move_max:weight + food_energy_RC:weight
                              ,
                              random = ~ tip_label,
                              ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                              prior = prior1,
                              data = birds,
                              nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
summary(model_ecosocial_f)
p2 <- model_ecosocial_f$VCV[,"tip_label"]/(model_ecosocial_f$VCV[,"tip_label"]+model_ecosocial_f$VCV[,"units"])
posterior.mode(p2)
HPDinterval(p2)

model_ecosocial_f_fix <- MCMCglmm(brain_log ~ weight + foraging_3 + move_max + 
                                    food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                    temp_range + temp_rain + 
                                    foraging_3:weight + move_max:weight + food_energy_RC:weight
                              ,
                              data = birds,
                              nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
fs <- predict(model_ecosocial_f_fix)
var(fs)/(var(fs) + mean(model_ecosocial_f$VCV[,"tip_label"]) + mean(model_ecosocial_f$VCV[,"units"]))


model_ecosocial_f_2 <- MCMCglmm(brain_log ~ foraging_3 + move_max + 
                                food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                temp_range + temp_rain
                                
                              ,
                              random = ~ tip_label,
                              ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                              prior = prior1,
                              data = birds,
                              nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
model_ecosocial_f_fix_2 <- MCMCglmm(brain_log ~ foraging_3 + move_max + 
                                    food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                    temp_range + temp_rain
                                    
                                  ,
                                  data = birds,
                                  nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
fs <- predict(model_ecosocial_f_fix_2)
var(fs)/(var(fs) + mean(model_ecosocial_f_2$VCV[,"tip_label"]) + mean(model_ecosocial_f_2$VCV[,"units"]))


model_ecosocial_full_res <- MCMCglmm(res_brain ~ weight + foraging_3 + move_max + 
                                   food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                   temp_range + temp_rain + 
                                   foraging_3:weight + move_max:weight + food_energy_RC:weight + food_h_level_nofibres_RC:weight + 
                                   insularity:weight+social_bonds:weight + colonial:weight + grouping:weight +
                                   food_energy_RC:temp_range + food_energy_RC:temp_rain +
                                   weight:temp_range + weight:temp_rain +
                                   move_max:temp_range + move_max:temp_rain +
                                   social_bonds:temp_range + social_bonds:temp_rain
                                 ,
                                 random = ~ tip_label,
                                 ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                                 prior = prior1,
                                 data = birds,
                                 nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
summary(model_ecosocial_full_res)

model_ecosocial_f_res <- MCMCglmm(res_brain ~ weight + foraging_3 + move_max + 
                                food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                temp_range + temp_rain + 
                                foraging_3:weight + move_max:weight + food_energy_RC:weight
                              ,
                              random = ~ tip_label,
                              ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                              prior = prior1,
                              data = birds,
                              nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
summary(model_ecosocial_f_res)
p2 <- model_ecosocial_f_res$VCV[,"tip_label"]/(model_ecosocial_f_res$VCV[,"tip_label"]+model_ecosocial_f_res$VCV[,"units"])
posterior.mode(p2)
HPDinterval(p2)

model_ecosocial_f_res_fix <- MCMCglmm(res_brain ~ weight + foraging_3 + move_max + 
                                    food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                    temp_range + temp_rain + 
                                    foraging_3:weight + move_max:weight + food_energy_RC:weight
                                  ,
                                  #random = ~ tip_label,
                                  #ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                                  #prior = prior1,
                                  data = birds,
                                  nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
fs <- predict(model_ecosocial_f_res_fix)
var(fs)/(var(fs) + mean(model_ecosocial_f_res$VCV[,"tip_label"]) + mean(model_ecosocial_f_res$VCV[,"units"]))


# MODEL 3 - combined ----


model_combined_full <- MCMCglmm(brain_log ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                  devo_mode:weight + devo_mode:time_fed +
                                  res_egg_mass:weight + 
                                  clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                                
                                  foraging_3 + move_max + 
                                  food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                  temp_range + temp_rain + 
                                  foraging_3:weight + move_max:weight + food_energy_RC:weight +
                                
                                time_fed:temp_range + time_fed:temp_rain +
                                food_energy_RC:time_fed + food_energy_RC:devo_mode + food_energy_RC:clutch_size +
                                food_h_level_nofibres_RC:time_fed + food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size +
                                social_bonds:clutch_size + social_bonds:time_fed + social_bonds:devo_mode + social_bonds:res_egg_mass +
                                move_max:devo_mode + move_max:time_fed + move_max:clutch_size + move_max:res_egg_mass
                              ,
                              random = ~ tip_label,
                              ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                              prior = prior1,
                              data = birds,
                              nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
autocorr.plot(model_combined_full$Sol)
autocorr.plot(model_combined_full$VCV)
plot(model_combined_full$VCV)
summary(model_combined_full)


model_combined_f <- MCMCglmm(brain_log ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                               devo_mode:weight + devo_mode:time_fed +
                               res_egg_mass:weight + 
                               clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                               
                               foraging_3 + move_max + 
                               food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                               temp_range + temp_rain + 
                               foraging_3:weight + move_max:weight + food_energy_RC:weight +
                               
                               
                               food_energy_RC:clutch_size +
                               food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size
                                ,
                                random = ~ tip_label,
                                ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                                prior = prior1,
                                data = birds,
                                nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
summary(model_combined_f)
p2 <- model_combined_f$VCV[,"tip_label"]/(model_combined_f$VCV[,"tip_label"]+model_combined_f$VCV[,"units"])
posterior.mode(p2)
HPDinterval(p2)



model_combined_f_fix <- MCMCglmm(brain_log ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                   devo_mode:weight + devo_mode:time_fed +
                                   res_egg_mass:weight + 
                                   clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                                   
                                   foraging_3 + move_max + 
                                   food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                   temp_range + temp_rain + 
                                   foraging_3:weight + move_max:weight + food_energy_RC:weight +
                                   
                                   
                                   food_energy_RC:clutch_size +
                                   food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size
                              ,
                              data = birds,
                              nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)

fs <- predict(model_combined_f_fix)
var(fs)/(var(fs) + mean(model_combined_f$VCV[,"tip_label"]) + mean(model_combined_f$VCV[,"units"]))


model_combined_f_2 <- MCMCglmm(brain_log ~ devo_mode  + time_fed + res_egg_mass + clutch_size + caretakers +
                                 devo_mode:time_fed +
                                 
                                 clutch_size:devo_mode + clutch_size:res_egg_mass +
                                 
                                 foraging_3 + move_max + 
                                 food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                 temp_range + temp_rain + 
                                 
                                 
                                 
                                 food_energy_RC:clutch_size +
                                 food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size
                             ,
                             random = ~ tip_label,
                             ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                             prior = prior1,
                             data = birds,
                             nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
model_combined_f_fix_2 <- MCMCglmm(brain_log ~ devo_mode  + time_fed + res_egg_mass + clutch_size + caretakers +
                                     devo_mode:time_fed +
                                     
                                     clutch_size:devo_mode + clutch_size:res_egg_mass +
                                     
                                     foraging_3 + move_max + 
                                     food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                     temp_range + temp_rain + 
                                     
                                     
                                     
                                     food_energy_RC:clutch_size +
                                     food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size
                                 ,
                                 data = birds,
                                 nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)

summary(model_combined_f)
fs <- predict(model_combined_f_fix_2)
var(fs)/(var(fs) + mean(model_combined_f_2$VCV[,"tip_label"]) + mean(model_combined_f_2$VCV[,"units"]))


model_combined_full_res <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                      devo_mode:weight + devo_mode:time_fed +
                                      res_egg_mass:devo_mode + 
                                      res_egg_mass:weight +
                                      clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                                      
                                  foraging_3 + move_max + 
                                  food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                  temp_range + temp_rain + 
                                  foraging_3:weight + move_max:weight + food_energy_RC:weight +
                                  
                                  time_fed:temp_range + time_fed:temp_rain +
                                  food_energy_RC:time_fed + food_energy_RC:devo_mode + food_energy_RC:clutch_size +
                                  food_h_level_nofibres_RC:time_fed + food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size +
                                  social_bonds:clutch_size + social_bonds:time_fed + social_bonds:devo_mode + social_bonds:res_egg_mass +
                                  move_max:devo_mode + move_max:time_fed + move_max:clutch_size + move_max:res_egg_mass
                                ,
                                random = ~ tip_label,
                                ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                                prior = prior1,
                                data = birds,
                                nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
summary(model_combined_full_res)


model_combined_f_res <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                   devo_mode:weight + devo_mode:time_fed +
                                   res_egg_mass:devo_mode + 
                                   res_egg_mass:weight +
                                   clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                                   
                                   foraging_3 + move_max + 
                                   food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                   temp_range + temp_rain + 
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
p2 <- model_combined_f_res$VCV[,"tip_label"]/(model_combined_f_res$VCV[,"tip_label"]+model_combined_f_res$VCV[,"units"])
posterior.mode(p2)
HPDinterval(p2)

model_combined_f_res_fix <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                       devo_mode:weight + devo_mode:time_fed +
                                       res_egg_mass:weight + 
                                       clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                                       
                                       foraging_3 + move_max + 
                                       food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                       temp_range + temp_rain + 
                                       foraging_3:weight + move_max:weight + food_energy_RC:weight +
                                       
                                       
                                       food_energy_RC:clutch_size +
                                       food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size
                                 ,
                                 #random = ~ tip_label,
                                 #ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                                 #prior = prior1,
                                 data = birds,
                                 nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
fs <- predict(model_combined_f_res_fix)
var(fs)/(var(fs) + mean(model_combined_f_res$VCV[,"tip_label"]) + mean(model_combined_f_res$VCV[,"units"]))



#### prelimnary viz ----
library(ggplot2)
library(orca)
library(plotly)

qplot(time_fed, brain_log, col = devo_mode, data = birds) + geom_smooth(method = 'lm') + theme_classic()
qplot(time_fed, brain_log, col = devo_mode_full, data = birds) + geom_smooth(method = 'lm') + theme_classic()
qplot(weight, res_brain, col = devo_mode, data = birds) + geom_smooth(method = 'lm') + theme_classic()

qplot(clutch_size, res_brain, col = devo_mode, data = birds) + geom_smooth(method = 'lm') + theme_classic()

qplot(res_egg_mass, log(brain), data = birds, col = weight) + geom_smooth(method = 'lm') + theme_classic()

t <- list(size = 15)
z <- outer(seq(min(birds$weight), max(birds$weight), length.out = 800),
           seq(min(birds$res_egg_mass), max(birds$res_egg_mass), length.out = 800),
           FUN = function(a, b) return(.54965 + 1.070039*b + .301848*a + .071006*a*b))
myfig <- plot_ly(x = seq(min(birds$weight), max(birds$weight), length.out = 800),
                 y = seq(min(birds$res_egg_mass), max(birds$res_egg_mass), length.out = 800),
                 z = z,
                 type = "contour",
                 contours = list(start = min(z), end = max(z), size = .25)
                 #colorscale = list(c(-2, "darkorchid"), c(0.5, "mistyrose"), c(5, "gold"))
)
myfig <- layout(myfig,
                xaxis = list(title = "weight",
                             range = c(min(birds$weight), max(birds$weight))),
                yaxis = list(title = "res egg mass",
                             range = c(min(birds$res_egg_mass), max(birds$res_egg_mass))),
                font = t)
#myfig <- colorbar(myfig, title = "Estimate")
myfig


t <- list(size = 15)
z <- outer(seq(min(birds$clutch_size), max(birds$clutch_size), length.out = 800),
           seq(min(birds$res_egg_mass), max(birds$res_egg_mass), length.out = 800),
           FUN = function(a, b) return(.54965 - .044631*b + .301848*a + .072212*a*b))
myfig <- plot_ly(x = seq(min(birds$clutch_size), max(birds$clutch_size), length.out = 800),
                 y = seq(min(birds$res_egg_mass), max(birds$res_egg_mass), length.out = 800),
                 z = z,
                 type = "contour",
                 contours = list(start = min(z), end = max(z), size = .1)
                 #colorscale = list(c(-2, "darkorchid"), c(0.5, "mistyrose"), c(5, "gold"))
)
myfig <- layout(myfig,
                xaxis = list(title = "clutch_size",
                             range = c(min(birds$clutch_size), max(birds$clutch_size))),
                yaxis = list(title = "res egg mass",
                             range = c(min(birds$res_egg_mass), max(birds$res_egg_mass))),
                font = t)
#myfig <- colorbar(myfig, title = "Estimate")
myfig

qplot(social_bonds, log(brain), data = birds, geom = 'boxplot') + theme_classic()

qplot(weight, res_brain, data = birds, col = move_max) + geom_smooth(method = 'lm') + theme_classic()
qplot(weight, res_brain, data = birds, col = foraging_3) + geom_smooth(method = 'lm') + theme_classic()

qplot(fibres, res_brain, data = birds, col = weight) + geom_smooth(method = 'loess') + theme_classic()
qplot(weight, fibres, data = birds, col = weight) + geom_smooth(method = 'lm') + theme_classic()

qplot(fibres, food_h_level, data = birds, col = weight) + geom_smooth(method = 'lm') + theme_classic()
pairs(~fibres+food_energy+food_h_level+time_fed+temp_range, data = birds, pch = ".")

model <- lm(brain_log ~ food_energy + fibres + food_h_level + time_fed + clutch_size, data = birds)

t <- list(size = 15)
z <- outer(seq(min(birds$weight), max(birds$weight), length.out = 800),
           seq(min(birds$food_energy), max(birds$food_energy), length.out = 800),
           FUN = function(a, b) return(.429836 + 1.173288*b - .003516*a + .025585*a*b))
myfig <- plot_ly(x = seq(min(birds$weight), max(birds$weight), length.out = 800),
                 y = seq(min(birds$food_energy), max(birds$food_energy), length.out = 800),
                 z = z,
                 type = "contour",
                 contours = list(start = min(z), end = max(z), size = .5)
                 #colorscale = list(c(-2, "darkorchid"), c(0.5, "mistyrose"), c(5, "gold"))
)
myfig <- layout(myfig,
                xaxis = list(title = "weight",
                             range = c(min(birds$weight), max(birds$weight))),
                yaxis = list(title = "food_energy",
                             range = c(min(birds$food_energy), max(birds$food_energy))),
                font = t)
#myfig <- colorbar(myfig, title = "Estimate")
myfig




#### main model with longevity ----

source(file = 'data_load_longevity.R')
phylo_vcv <- vcv.phylo(birdtree.Jetz, corr = T)
source('climatic.R')

names(birds)[which(names(birds) == "family")] <- 'tax_family'

tree_jetz_data <- birdtree.Jetz
sort(tree_jetz_data$edge.length) # check branch lengths
tree_jetz_data$edge.length[tree_jetz_data$edge.length == 0] <- 1e-10
tree_jetz_data_AINV <- inverseA(tree_jetz_data, nodes = "ALL")

# PRIORS for MCMCglmm models and other control variables

prior1 <- list(R = list(V = 1, nu = 0.002),
               G = list(G1 = list(V = 1, nu = 0.002, alpha.mu = 0, alpha.V = 1e5)))

VERB = T

model_combined_lon_f <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                   devo_mode:weight + devo_mode:time_fed +
                                   res_egg_mass:weight + 
                                   clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                                   
                                   foraging_3 + move_max + 
                                   food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                   temp_range + temp_rain + 
                                   foraging_3:weight + move_max:weight + food_energy_RC:weight +
                                   
                                   
                                   food_energy_RC:clutch_size +
                                   food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size +
                                   longevity + longevity:weight
                             ,
                             random = ~ tip_label,
                             ginverse = list(tip_label = tree_jetz_data_AINV$Ainv),
                             prior = prior1,
                             data = birds,
                             nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
autocorr.plot(model_combined_lon_f$Sol)
autocorr.plot(model_combined_lon_f$VCV)
summary(model_combined_lon_f)
