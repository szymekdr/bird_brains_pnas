## Szymek Drobniak
## 200819
## d-separation analysis not using phylolm

rm(list = ls())
library(phylopath)
library(asreml)
source('auxiliary.R')

#### load data ----
####

source(file = 'data_load.R')
vcv_phy <- vcv.phylo(birdtree.Jetz, corr = T)
vcv_phy_feng <- vcv.phylo(birdtree.Feng, corr = T)
source('climatic.R')



#### revised allocation analysis ----

# load all hypothesis models
source("dsep_models_allocation_brelogres.R")

## generate the list of independency statements to check
order <- find_consensus_order(m_pa)
stat_list <- lapply(m_pa, find_statements, order)

## generate formulas and unlist
formulae <- lapply(m_pa, find_formulas, order)
form_list <- unique(unlist(formulae))
form_list <- purrr::map(form_list, ~{attr(.x, ".Environment") <- NULL; .x})



## run asreml d-sep generation function
dsep_list_allocation_probit_REVISED <- dseps_asreml(form_list, data = birds2, link = "probit",
                                           phylogeny = birdtree.Feng, phy_var = "tip_label_feng", maxiter = 1000)

save(dsep_list_allocation_probit_REVISED, file = "out_pathasreml_alloc_red_probit_220620.Rdata")

dsep_str_models_allocation_probit_REVISED <- purrr::map(formulae, ~ dsep_list_allocation_probit_REVISED[match(.x, form_list)])
w_list <- purrr::map(dsep_str_models_allocation_probit_REVISED, ~ purrr::map(.x, 'warnings'))

w_list <- purrr::map(w_list, ~ {names(.x) <- seq_along(.x); return(.x)})
cbind(unlist(w_list)) -> w_list
w_list[which(w_list == "Log-likelihood not converged"),] # check if any models failed to converge

dsep_models_allocation_probit_REVISED <- purrr::map(dsep_str_models_allocation_probit_REVISED, ~ purrr::map(.x, ~ asreml::summary.asreml(.x$result, coef = T)))

## summarize in one batch all d-sep models
d_sep_summary_allocation_probit_REVISED <- purrr::map2(formulae, dsep_models_allocation_probit_REVISED,
                                         ~ tibble::tibble(d_sep_call = as.character(.x),
                                                          p = purrr::map(.y, get_p),
                                                          sigma_phy = purrr::map_dbl(.y, get_sigma_phy),
                                                          model_obj = .y))

## form final object with all components
dsep_object_allocation_probit_REVISED <- list(d_sep = d_sep_summary_allocation_probit_REVISED, data = birds, model_sets = m_pa)

## generate overall summary
summarize_dsep(dsep_object_allocation_probit_REVISED)

best(dsep_object_allocation_probit_REVISED) -> mybest

plot.DAG(mybest)
mybest <- m_pa$pa_all_massfoc

bestfit <- est_DAG(mybest, data = birds, phylogeny = birdtree.Jetz,
                   phy_var = "tip_label", maxiter = 1000, link = 'probit')
positions <- data.frame(name = rownames(mybest), x = c(10, -10, 0, 0, 0, 10),
                        y = c(20, 20, 15, 10, 5, 5))
plot.fitted_DAG(bestfit, type = "width", colors = c("blue", "red"), manual_layout = positions)
coef_plot(bestfit)






#### revised ecosocial analysis ----

# load all hypothesis models
source("dsep_models_ecosocial_resbrlog.R")


# reformat non-binary categorical variables
birds$social_bonds_3 <- birds$social_bonds
levels(birds$social_bonds) <- c('short', 'short', 'long')
birds$grouping_4 <- birds$grouping
levels(birds$grouping) <- c('none_pair', 'small_large', 'none_pair', 'small_large')
birds <- gdata::drop.levels(birds)

## generate the list of independency statements to check
order <- find_consensus_order(m_es)
stat_list <- lapply(m_es, find_statements, order)

## generate formulas and unlist
formulae <- lapply(m_es, find_formulas, order)
form_list <- unique(unlist(formulae))
form_list <- purrr::map(form_list, ~{attr(.x, ".Environment") <- NULL; .x})



## run asreml d-sep generation function
dsep_list_ecosocial_probit_REVISED <- dseps_asreml(form_list, data = birds, link = "probit",
                                                    phylogeny = birdtree.Jetz, phy_var = "tip_label", maxiter = 1000)

save(dsep_list_ecosocial_probit_REVISED, file = "out_pathasreml_ecosocial_probit_REVISED_log_220711.Rdata")

dsep_str_models_ecosocial_probit_REVISED <- purrr::map(formulae, ~ dsep_list_ecosocial_probit_REVISED[match(.x, form_list)])
w_list <- purrr::map(dsep_str_models_ecosocial_probit_REVISED, ~ purrr::map(.x, 'warnings'))

w_list <- purrr::map(w_list, ~ {names(.x) <- seq_along(.x); return(.x)})
cbind(unlist(w_list)) -> w_list
w_list[which(w_list == "Log-likelihood not converged"),] # check if any models failed to converge

dsep_models_ecosocial_probit_REVISED <- purrr::map(dsep_str_models_ecosocial_probit_REVISED,
                                                   ~ purrr::map(.x, ~ asreml::summary.asreml(.x$result, coef = T)))

## summarize in one batch all d-sep models
d_sep_summary_ecosocial_probit_REVISED <- purrr::map2(formulae, dsep_models_ecosocial_probit_REVISED,
                                                       ~ tibble::tibble(d_sep_call = as.character(.x),
                                                                        p = purrr::map(.y, get_p),
                                                                        sigma_phy = purrr::map_dbl(.y, get_sigma_phy),
                                                                        model_obj = .y))

## form final object with all components
dsep_object_ecosocial_probit_REVISED <- list(d_sep = d_sep_summary_ecosocial_probit_REVISED,
                                             data = birds, model_sets = m_es)

## generate overall summary
summarize_dsep(dsep_object_ecosocial_probit_REVISED)

best(dsep_object_ecosocial_probit_REVISED) -> mybest

plot.DAG(mybest)
mybest <- m_es$es_full_enw
mybest2 <- m_es$es_full_enw
mybest3 <- m_es$es_full_nosocial_enw

bestfit1 <- est_DAG(mybest, data = birds, phylogeny = birdtree.Jetz,
                   phy_var = "tip_label", maxiter = 1000, link = 'probit')
bestfit2 <- est_DAG(mybest2, data = birds, phylogeny = birdtree.Jetz,
                    phy_var = "tip_label", maxiter = 1000, link = 'probit')
bestfit3 <- est_DAG(mybest3, data = birds, phylogeny = birdtree.Jetz,
                    phy_var = "tip_label", maxiter = 1000, link = 'probit')
positions <- data.frame(name = rownames(mybest), x = c(5, -5, -5, 0, 0, 10, 10, 5, 15, 5),
                         y = c(20, 18, 13, 20, 10, 18, 13, 10, 13, 5))
plot.fitted_DAG(bestfit1, type = "width", colors = c("blue", "red"), manual_layout = positions)
plot.fitted_DAG(bestfit2, type = "width", colors = c("blue", "red"), manual_layout = positions)
plot.fitted_DAG(bestfit3, type = "width", colors = c("blue", "red"), manual_layout = positions)

varnames <- rownames(mybest)
bestfit1$coef <- bestfit1$coef[varnames, varnames]
bestfit2$coef <- bestfit2$coef[varnames, varnames]
bestfit3$coef <- bestfit3$coef[varnames, varnames]
newmatrix <- (bestfit1$coef != 0 & bestfit2$coef != 0 & bestfit3$coef != 0) *
  (bestfit1$coef+bestfit2$coef+bestfit3$coef)/3

bestfit$coef <- newmatrix
plot.fitted_DAG(bestfit, type = "width", colors = c("blue", "red"), manual_layout = positions)





#### revised joint analysis ----

# load all hypothesis models
source("dsep_models_joint_resbrlog.R")

## generate the list of independency statements to check
order <- find_consensus_order(m_all)
stat_list <- lapply(m_all, find_statements, order)

## generate formulas and unlist
formulae <- lapply(m_all, find_formulas, order)
form_list <- unique(unlist(formulae))
form_list <- purrr::map(form_list, ~{attr(.x, ".Environment") <- NULL; .x})



## run asreml d-sep generation function
dsep_list_joint_probit_REVISED <- dseps_asreml(form_list, data = birds, link = "probit",
                                                    phylogeny = birdtree.Jetz, phy_var = "tip_label", maxiter = 1000)

save(dsep_list_joint_probit_REVISED, file = "out_pathasreml_joint_red_probit_log_220712.Rdata")

dsep_str_models_joint_probit_REVISED <- purrr::map(formulae, ~ dsep_list_joint_probit_REVISED[match(.x, form_list)])
w_list <- purrr::map(dsep_str_models_joint_probit_REVISED, ~ purrr::map(.x, 'warnings'))

w_list <- purrr::map(w_list, ~ {names(.x) <- seq_along(.x); return(.x)})
cbind(unlist(w_list)) -> w_list
w_list[which(w_list == "Log-likelihood not converged"),] # check if any models failed to converge

dsep_models_joint_probit_REVISED <- purrr::map(dsep_str_models_joint_probit_REVISED, ~ purrr::map(.x, ~ asreml::summary.asreml(.x$result, coef = T)))

## summarize in one batch all d-sep models
d_sep_summary_joint_probit_REVISED <- purrr::map2(formulae, dsep_models_joint_probit_REVISED,
                                                       ~ tibble::tibble(d_sep_call = as.character(.x),
                                                                        p = purrr::map(.y, get_p),
                                                                        sigma_phy = purrr::map_dbl(.y, get_sigma_phy),
                                                                        model_obj = .y))

## form final object with all components
dsep_object_joint_probit_REVISED <- list(d_sep = d_sep_summary_joint_probit_REVISED, data = birds, model_sets = m_all)

## generate overall summary
summarize_dsep(dsep_object_joint_probit_REVISED)

best(dsep_object_joint_probit_REVISED) -> mybest

plot.DAG(mybest)
mybest <- m_all$all_full_2

bestfit <- est_DAG(mybest, data = birds, phylogeny = birdtree.Jetz,
                   phy_var = "tip_label", maxiter = 1000, link = 'probit')
positions <- data.frame(name = rownames(mybest), x = c(-20, -20, -20, -10, 0, 10, 15, 15,
                                                       -15, -15, 15, 10, -5, -5),
                        y = c(5, 10, 20, 20, 15, 20, 15, 10,
                              0, 15, -5, -10, -10, 5))
plot.fitted_DAG(bestfit, type = "width", colors = c("blue", "red"), manual_layout = positions)
bestfit2 <- bestfit
bestfit2$coef <- bestfit$coef*!(abs(bestfit$coef)<0.05)
plot.fitted_DAG(bestfit2, type = "width", colors = c("blue", "red"), manual_layout = positions)

coef_plot(bestfit)
