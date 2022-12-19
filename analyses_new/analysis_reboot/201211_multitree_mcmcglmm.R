## Szymek Drobniak
## 201210
## multi-tree inference for bird brain analysis


# preps and setting things up ----

rm(list = ls())
# setwd

require(phylolm)
require(ape)
require(caper)
require(geiger)  
require(phylopath)
#require(gmm)
require(lme4)
require(magrittr)
require(dplyr)
require(ggplot2)
require(MuMIn)
require (VIF)

require(MCMCglmm)

#library(asreml)



# data load and transforms ----

source(file = 'data_load.R')
phylo_vcv <- vcv.phylo(birdtree.Jetz, corr = T)
source('climatic.R')

names(birds)[which(names(birds) == "family")] <- 'tax_family'


# load multiple trees ----

trees200 <- read.nexus("ericson_200trees_pruned.nex")

# prepare the model run using first tree ----

tree_AINV <- inverseA(trees200[[1]], nodes = "ALL")

# PRIORS for MCMCglmm models and other control variables ----

prior1 <- list(R = list(V = 1, nu = 0.002),
               G = list(G1 = list(V = 1, nu = 0.002, alpha.mu = 0, alpha.V = 1e5)))

VERB = F

model_0 <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                                   devo_mode:weight + devo_mode:time_fed +
                                   res_egg_mass:weight + res_egg_mass:devo_mode +
                                   clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                                   
                                   foraging_3 + move_max + 
                                   food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                                   temp_range + temp_rain + 
                                   foraging_3:weight + move_max:weight + food_energy_RC:weight +
                                   
                                   
                                   food_energy_RC:clutch_size +
                                   food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size
                                 ,
                                 random = ~ tip_label,
                                 ginverse = list(tip_label = tree_AINV$Ainv),
                                 prior = prior1,
                                 data = birds,
                                 nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)

summary(model_0)


# create a tree running loop and store results - combined model ----

output <- list()
VERB = F # silence to MCMCglmm

for (i in 1:length(trees200)) {
  
  # 1 run the model for a given tree
  tree_AINV <- inverseA(trees200[[i]], nodes = "ALL")
  model_ith <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                          devo_mode:weight + devo_mode:time_fed +
                          res_egg_mass:weight + 
                          clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                          res_egg_mass:devo_mode +
                          
                          foraging_3 + move_max + 
                          food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                          temp_range + temp_rain + temp_stdv +
                          foraging_3:weight + move_max:weight + 
                          
                          
                          food_energy_RC:clutch_size +
                          food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size
                      ,
                      random = ~ tip_label,
                      ginverse = list(tip_label = tree_AINV$Ainv),
                      prior = prior1,
                      data = birds,
                      nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
  
  # 2 store model output for fixed effects, Gcovariances and Rcovariances
  
  sol_its <- summary(model_ith)$solutions
  Gcov_ith <- summary(model_ith)$Gcovariances
  Rcov_ith <- summary(model_ith)$Rcovariances
  
  # 3 write results to output object
  
  output[[i]] <- list(fixed = sol_its, g = Gcov_ith, r = Rcov_ith)
  
  # 4 print control message
  cat("Model "); cat(i); cat(" out of "); cat(length(trees200)); cat(" done! \n")
}

save(output, file = '210920_multitree_combined_model.Rdata')


# create object and store results - allocation model ----

output <- list()
VERB = F # silence to MCMCglmm

for (i in 1:length(trees200)) {

  # 1 run the model for a given tree
  tree_AINV <- inverseA(trees200[[i]], nodes = "ALL")
  model_ith <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                          devo_mode:weight + devo_mode:time_fed +
                          res_egg_mass:devo_mode +
                          res_egg_mass:weight +
                          clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass
                        ,
                        random = ~ tip_label,
                        ginverse = list(tip_label = tree_AINV$Ainv),
                        prior = prior1,
                        data = birds,
                        nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)

  # 2 store model output for fixed effects, Gcovariances and Rcovariances

  sol_its <- summary(model_ith)$solutions
  Gcov_ith <- summary(model_ith)$Gcovariances
  Rcov_ith <- summary(model_ith)$Rcovariances

  # 3 write results to output object

  output[[i]] <- list(fixed = sol_its, g = Gcov_ith, r = Rcov_ith)

  # 4 print control message
  cat("Model (allocation)"); cat(i); cat(" out of "); cat(length(trees200)); cat(" done! \n")
}

save(output, file = '210210_multitree_allocation_model.Rdata')



# create object and store results - ecosocial model ----

output <- list()
VERB = F # silence to MCMCglmm

for (i in 1:length(trees200)) {
  
  # 1 run the model for a given tree
  tree_AINV <- inverseA(trees200[[i]], nodes = "ALL")
  model_ith <- MCMCglmm(res_brain ~ weight + foraging_3 + move_max + 
                          food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                          temp_range + temp_rain + temp_stdv +
                          foraging_3:weight + move_max:weight + food_energy_RC:weight
                        ,
                        random = ~ tip_label,
                        ginverse = list(tip_label = tree_AINV$Ainv),
                        prior = prior1,
                        data = birds,
                        nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
  
  # 2 store model output for fixed effects, Gcovariances and Rcovariances
  
  sol_its <- summary(model_ith)$solutions
  Gcov_ith <- summary(model_ith)$Gcovariances
  Rcov_ith <- summary(model_ith)$Rcovariances
  
  # 3 write results to output object
  
  output[[i]] <- list(fixed = sol_its, g = Gcov_ith, r = Rcov_ith)
  
  # 4 print control message
  cat("Model (ecosocial)"); cat(i); cat(" out of "); cat(length(trees200)); cat(" done! \n")
}

save(output, file = '210920_multitree_ecosocial_model.Rdata')




source(file = 'data_load_longevity.R')
phylo_vcv <- vcv.phylo(birdtree.Jetz, corr = T)
source('climatic.R')

names(birds)[which(names(birds) == "family")] <- 'tax_family'

tree_jetz_data <- birdtree.Jetz
sort(tree_jetz_data$edge.length) # check branch lengths
tree_jetz_data$edge.length[tree_jetz_data$edge.length == 0] <- 1e-10
tree_jetz_data_AINV <- inverseA(tree_jetz_data, nodes = "ALL")

birds$longevity_t <- scale(log(birds$longevity))
output <- list()
VERB = F # silence to MCMCglmm

for (i in 1:length(trees200)) {
  
  # 1 run the model for a given tree
  tree_AINV <- inverseA(trees200[[i]], nodes = "ALL")
  model_ith <- MCMCglmm(res_brain ~ devo_mode + weight + time_fed + res_egg_mass + clutch_size + caretakers +
                          devo_mode:weight + devo_mode:time_fed +
                          res_egg_mass:weight + 
                          clutch_size:devo_mode + clutch_size:weight + clutch_size:res_egg_mass +
                          devo_mode:res_egg_mass +
                          foraging_3 + move_max + 
                          food_energy_RC + food_h_level_nofibres_RC + social_bonds + insularity + colonial + grouping + 
                          temp_range + temp_rain + temp_stdv +
                          foraging_3:weight + move_max:weight + food_energy_RC:weight +
                          
                          
                          food_energy_RC:clutch_size +
                          food_h_level_nofibres_RC:devo_mode + food_h_level_nofibres_RC:clutch_size +
                          longevity_t + longevity_t:weight
                        ,
                        random = ~ tip_label,
                        ginverse = list(tip_label = tree_AINV$Ainv),
                        prior = prior1,
                        data = birds,
                        nitt = 30000, thin = 22, burnin = 8000, verbose = VERB)
  
  # 2 store model output for fixed effects, Gcovariances and Rcovariances
  
  sol_its <- summary(model_ith)$solutions
  Gcov_ith <- summary(model_ith)$Gcovariances
  Rcov_ith <- summary(model_ith)$Rcovariances
  
  # 3 write results to output object
  
  output[[i]] <- list(fixed = sol_its, g = Gcov_ith, r = Rcov_ith)
  
  # 4 print control message
  cat("Model (longevity)"); cat(i); cat(" out of "); cat(length(trees200)); cat(" done! \n")
}

save(output, file = '210921_multitree_longevity_model.Rdata')


#### process the multitree file ----
library(purrr)
output[[2]]$fixed[,1:3]
scaled_out <- lapply(output, function(X) X$fixed[,1:3]/200)
p_out <- lapply(output, function(X) (X$fixed[,5] <= 0.05)/200)


out_summary <- reduce(scaled_out, function(x,y) x + y)
out_summary

p_summary <- reduce(p_out, function(x, y) x + y)
p_summary

cbind(out_summary, p_summary)
