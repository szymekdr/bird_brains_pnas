## Szymek Drobniak
## 210111
## Visulaisations for the bird brains paper


# preps ----

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
require(ggpubr)
library(ggrepel)

require(MCMCglmm)

library(asreml)

# if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# BiocManager::install(version = "3.12")
# BiocManager::install("ggtree")
# BiocManager::install("ggtreeExtra")

library(ggtree)
library(ggtreeExtra)
library(ggnewscale)
library(RColorBrewer)

# data load and transforms ----

source(file = 'data_load_plotting.R')
phylo_vcv <- vcv.phylo(birdtree.Jetz, corr = T)
source('climatic.R')

rownames(birds) <- birds$tip_label


# # split data into subsets ----
# 
# alt <- birds %>% filter(devo_mode == 'altrical')
# prec <- birds %>% filter(devo_mode == 'precocial')


# generalized inverses for phylogenetic matrices ----

birds <- birds[-794,]
tree_jetz_data <- birdtree.Jetz
sort(tree_jetz_data$edge.length) # check branch lengths
tree_jetz_data$edge.length[tree_jetz_data$edge.length == 0] <- 1e-10
tree_jetz_data_AINV <- inverseA(tree_jetz_data, nodes = "ALL")

Ntip(tree_jetz_data)

# generate final tree
tree_final <- drop.tip(tree_jetz_data, setdiff(tree_jetz_data$tip.label, birds$tip_label))

# plot the tree ----

#birds$res_brain_min <- birds$res_brain - min(birds$res_brain) + 1

# colour palette generation
set3 <- colorRampPalette((brewer.pal('Set3', n = 12)))

# generate tree with manual tree branches scale
colours <- c(setNames(set3(15), levels(birds$Prum_order)), Internal = "gray80")
orders <- colours[c(as.character(birds[tree_final$tip.label, "Prum_order"]),
            rep("Internal", 1174))]

p <- ggtree(tree_final, layout = "circular", color = orders) +
  scale_color_manual(values = setNames(set3(15), levels(birds$Prum_order)), na.value = "gray35")

# add tree data and tip points
p <- p %<+% birds + new_scale("color") + scale_color_manual(values = c("cornflowerblue", "darkorange")) +
  geom_tippoint(aes(color = devo_mode), size = 0.5)

# add bars representing residual brain size, log of absolute brain and body weight
p1 <- p + geom_fruit(geom = geom_bar, mapping = aes(x = res_brain, fill = time_fed),axis.params = list(axis = "x"),
                     stat = 'identity', orientation = 'y', offset = 0.15) +
  geom_fruit(geom = geom_bar, mapping = aes(x = weight), axis.params = list(axis = "x"),
             stat = 'identity', orientation = 'y', offset = -0.01, fill = "gray64") +
  scale_fill_gradientn(colors = c('limegreen', 'gold', 'maroon2'))

# p1 <- p + geom_strip(taxa1 = "Parus_major", taxa2 = "Parus_caeruleus", label = "sikorki",
#                      fontsize = 2, offset.text = 1)

plot(p1)
ggsave(filename = "vis_tree_210226.pdf", device = 'pdf')

# p <- ggtree(tree_final, layout = "circular") %<+% birds
# plot(p)
# birds <- birds[tree_final$tip.label,]
# order1 <- birds$order[1]
# p <- p + geom_cladelabel(node = 1, label = order1, angle = "auto", fontsize = 2)
# plot(p)
# j <- 1
# start <- 1
# for (i in 2:nrow(birds)) {
#   order1 <- birds$order[i]
#   order2 <- birds$order[i-1]
#   
#   if(order1 == order2) {
#     next
#   } else {
#     color <- setNames(set3(39), levels(birds$order))[order1]
#     p <- p + geom_cladelabel(node = i, label = order1, angle = "auto", fontsize = 2) + 
#       geom_strip(taxa1 = birds$tip_label[start], taxa2 = birds$tip_label[i], color = color, barsize = 2)
#     start <- i
#     j <- j + 1
#   }
#   
# }
# p + geom_strip(taxa1 = birds$tip_label[start], taxa2 = birds$tip_label[1176], color = "black", barsize = 2)
# plot(p)
# 
# p <- ggtree(tree_final, layout = "circular") %<+% birds + geom_tiplab(aes(label = order), size = 1)
# plot(p)

# trial with phylogram
trait <- birds$res_brain
names(trait) <- birds$tip_label
fit <- phytools::fastAnc(tree_final, trait, vars = T, CI = T)
td <- data.frame(node = nodeid(tree_final, names(trait)), trait = trait)
nd <- data.frame(node = names(fit$ace), trait = fit$ace)
d <- rbind(td, nd)
d$node <- as.numeric(d$node)
tree_final_j <- full_join(tree_final, d, by = 'node')

ggtree(tree_final_j, aes(color=trait), continuous = TRUE, yscale = "trait") + 
  scale_color_viridis_c() + theme_minimal()


#### multipanel figure ----
text_size <- 15
line_size <- 0.5
tick_length <- unit(7, 'pt')
text_colour <- 'black'
plot1 <- birds %>%
  ggplot(aes(x = time_fed, y = res_brain, color = devo_mode)) +
  geom_point(size = 2, alpha = 0.3) +
  geom_smooth(method = 'lm') +
  scale_color_manual(values = c('#d55e00', '#3db7e9')) +
  labs(x = "Ln(time fed + 1)", y = "Residual of ln(brain size)", color = 'Developmental mode') +
  theme_classic() +
  theme(text = element_text(size = text_size, family = "Helvetica", colour = text_colour),
        axis.line = element_line(size = line_size, lineend = 'square'),
        axis.ticks = element_line(size = line_size),
        axis.ticks.length = tick_length,
        axis.text = element_text(colour = text_colour),
        legend.position = 'bottom')
plot1

plot2 <- birds %>%
  ggplot(aes(x = clutch_size, y = res_brain, color = devo_mode)) +
  geom_point(size = 2, alpha = 0.3) +
  geom_smooth(method = 'lm') +
  scale_color_manual(values = c('#d55e00', '#3db7e9')) +
  labs(x = "Ln(clutch size)", y = "Residual of ln(brain size)", color = 'Developmental mode') +
  theme_classic() +
  theme(text = element_text(size = text_size, family = "Helvetica", colour = text_colour),
        axis.line = element_line(size = line_size, lineend = 'square'),
        axis.ticks = element_line(size = line_size),
        axis.ticks.length = tick_length,
        axis.text = element_text(colour = text_colour),
        legend.position = 'bottom')
plot2

plot3 <- birds %>%
  ggplot(aes(x = move_max, y = res_brain)) +
  geom_boxplot(fill = 'gray80') +
  scale_x_discrete(limits = levels(birds$move_max), labels = c('Migratory', 'Sedentary')) + 
  labs(x = "Migratory status", y = "Residual of ln(brain size)", color = 'Developmental mode') +
  theme_classic() +
  theme(text = element_text(size = text_size, family = "Helvetica", colour = text_colour),
        axis.line = element_line(size = line_size, lineend = 'square'),
        axis.ticks = element_line(size = line_size),
        axis.ticks.length = tick_length,
        axis.text = element_text(colour = text_colour),
        legend.position = 'bottom')
plot3

plot4 <- birds %>%
  ggplot(aes(x = foraging_3, y = res_brain)) +
  geom_boxplot(fill = 'gray80') +
  scale_x_discrete(limits = levels(birds$foraging_3),
                   labels = c('Arboreal', 'Others'),
                   breaks = c("arboreal", "others")) + 
  labs(x = "Foraging substrate",y = "Residual of ln(brain size)", color = 'Developmental mode') +
  theme_classic() +
  theme(text = element_text(size = text_size, family = "Helvetica", colour = text_colour),
        axis.line = element_line(size = line_size, lineend = 'square'),
        axis.ticks = element_line(size = line_size),
        axis.ticks.length = tick_length,
        axis.text = element_text(colour = text_colour),
        legend.position = 'bottom')
plot4

ggarrange(plot2, plot1, plot3, plot4, nrow = 2, ncol = 2, common.legend = T, legend = 'top',
          labels = "AUTO")
ggsave(filename = "vis_gridplot_Science.pdf", device = 'pdf', scale = 0.8)

plot5 <- birds %>%
  ggplot(aes(x = time_fed, y = res_brain, color = devo_mode_full)) +
  geom_point(size = 2, alpha = 0.3) +
  geom_smooth(method = 'lm') +
  scale_color_manual(values = c('#d55e00', '#3db7e9', '#f748a5', '#359b73')) +
  labs(x = "Ln(time fed + 1)", y = "Residual of ln(brain size)", color = 'Developmental mode') +
  theme_classic() +
  theme(text = element_text(size = text_size, family = "Helvetica"),
        axis.line = element_line(size = line_size, lineend = 'square'),
        axis.ticks = element_line(size = line_size),
        axis.ticks.length = tick_length,
        legend.position = 'bottom')
plot5
ggsave(filename = "vis_alldevomode.pdf", device = "pdf", scale = 0.8)


plot6.11 <- birds %>%
  ggplot(aes(x = food_energy, y = fibres)) +
  geom_point(size = 2, alpha = 0.3) +
  geom_smooth(method = 'loess') +
  labs(x = "Overall food energy content", y = "Fibres in food") +
  theme_classic() +
  theme(text = element_text(size = text_size, family = "Helvetica"),
        axis.line = element_line(size = line_size, lineend = 'square'),
        axis.ticks = element_line(size = line_size),
        axis.ticks.length = tick_length,
        legend.position = 'bottom')
plot6.11

plot6.22 <- birds %>%
  ggplot(aes(x = food_energy, y = food_h_level)) +
  geom_point(size = 2, alpha = 0.3) +
  geom_smooth(method = 'loess') +
  labs(x = "Overall food energy content", y = "Food handling levels") +
  theme_classic() +
  theme(text = element_text(size = text_size, family = "Helvetica"),
        axis.line = element_line(size = line_size, lineend = 'square'),
        axis.ticks = element_line(size = line_size),
        axis.ticks.length = tick_length,
        legend.position = 'bottom')
plot6.22

plot6.33 <- birds %>%
  ggplot(aes(x = food_h_level, y = fibres)) +
  geom_point(size = 2, alpha = 0.3) +
  geom_smooth(method = 'loess') +
  labs(x = "Food handling levels", y = "Fibres in food") +
  theme_classic() +
  theme(text = element_text(size = text_size, family = "Helvetica"),
        axis.line = element_line(size = line_size, lineend = 'square'),
        axis.ticks = element_line(size = line_size),
        axis.ticks.length = tick_length,
        legend.position = 'bottom')
plot6.33

ggarrange(plot6.11, plot6.33, plot6.22, nrow = 2, ncol = 2)

plot6.33 <- birds %>%
  ggplot(aes(x = food_h_level, y = fibres)) +
  geom_point(size = 2, alpha = 0.3) +
  geom_smooth(method = 'loess') +
  labs(x = "Food handling levels", y = "Fibres in food") +
  theme_classic() +
  theme(text = element_text(size = text_size, family = "Helvetica"),
        axis.line = element_line(size = line_size, lineend = 'square'),
        axis.ticks = element_line(size = line_size),
        axis.ticks.length = tick_length,
        legend.position = 'bottom')

arr1 <- c(cor(birds$food_energy, birds$food_energy_RC) * 0.05 * sqrt(nrow(birds)-1))
arr2 <- c(cor(birds$food_energy, birds$food_h_level_nofibres_RC) * 0.05 * sqrt(nrow(birds)-1))
arr4 <- c(cor(birds$fibres, birds$food_energy_RC) * 0.05 * sqrt(nrow(birds)-1))
arr3 <- c(cor(birds$fibres, birds$food_h_level_nofibres_RC) * 0.05 * sqrt(nrow(birds)-1))
arr5 <- c(cor(birds$food_h_level, birds$food_energy_RC) * 0.05 * sqrt(nrow(birds)-1))
arr6 <- c(cor(birds$food_h_level, birds$food_h_level_nofibres_RC) * 0.05 * sqrt(nrow(birds)-1))
plot6.44 <- birds %>%
  ggplot(aes(x = food_h_level_nofibres_RC, y = food_energy_RC)) +
  geom_point(size = 2, alpha = 0.3, colour = 'turquoise') +
  geom_segment(aes(x=0, y=0, xend=arr1,yend=arr2), arrow = arrow(length = unit(10, 'pt'))) +
  geom_segment(aes(x=0, y=0, xend=arr3,yend=arr4), arrow = arrow(length = unit(10, 'pt'))) +
  geom_segment(aes(x=0, y=0, xend=arr5,yend=arr6), arrow = arrow(length = unit(10, 'pt'))) +
  labs(x = "PC1", y = "PC2") +
  geom_text(x = -2, y = 0.3, label = 'Fibres in food', hjust = 'left', lineheight = 1) +
  geom_text(x = 0.1, y = 2.15, label = 'Overall food energy \ncontent', hjust = 'left', lineheight = 1) +
  geom_text(x = 1.25, y = 0.85, label = 'Food handling \nlevels', hjust = 'left', lineheight = 1) +
  theme_classic() +
  theme(text = element_text(size = text_size, family = "Helvetica"),
        axis.line = element_line(size = line_size, lineend = 'square'),
        axis.ticks = element_line(size = line_size),
        axis.ticks.length = tick_length,
        legend.position = 'bottom')
plot6.44

ggarrange(plot6.11, plot6.33, plot6.22, plot6.44, nrow = 2, ncol = 2, labels = 'AUTO')
ggsave(filename = 'vis_foodpca_2_Science.pdf', device = 'pdf', scale = 0.8)



#### additional vis ----

plotA <- birds %>%
  ggplot(aes(x = log10(exp(weight)), y = log10(exp(brain_log)), colour = devo_mode)) +
  geom_point(size = 2, alpha = 0.3) +
  #geom_smooth(method = 'lm', formula = y~I(x^2)) +
  labs(x = "log(Body weight)", y = "log(Brain size)") +
  theme_classic() +
  theme(text = element_text(size = text_size, family = "Helvetica"),
        axis.line = element_line(size = line_size, lineend = 'square'),
        axis.ticks = element_line(size = line_size),
        axis.ticks.length = tick_length,
        legend.position = 'bottom')
plotA


# effects plot ----

effects <- read.table("effects_estimates.csv", sep = ";", head = T)

labels_order <- rev(as.character(subset(effects, set == "parental provisioning")$term))
p <- ggplot(data = subset(effects, set == "allocation"),
            aes(x = estimate, y = term, xmin = lower_CI, xmax = upper_CI))

p1 <- p + geom_vline(xintercept = 0, colour = 'gray', linetype = 2) +
  geom_point(size = 2.5) + theme_classic() +
  geom_point(aes(x = estmulti, y = term, shape = f_cat), size = 2.5, position = position_nudge(y = -0.4)) +
  scale_shape_manual(values = c(3,1), labels = c("<20%", ">80%")) +
  scale_y_discrete(limits = labels_order) +
  theme(axis.line.y = element_blank(), panel.grid.major.y = element_line(size = 0.5),
        text = element_text(size = 15, colour = 'black'),
        axis.title.y = element_blank(),
        axis.text = element_text(colour = "black")) +
  geom_errorbarh(height = 0) +
  xlab("Effect stimate") + labs(shape = "Fraction p < 0.05")

p1
ggsave("vis_coef1_210225.pdf", device = "pdf", scale = 0.7)


labels_order <- rev(as.character(subset(effects, set == "ecosocial")$term))
p <- ggplot(data = subset(effects, set == "ecosocial"),
            aes(x = estimate, y = term, xmin = lower_CI, xmax = upper_CI))

p2 <- p + geom_vline(xintercept = 0, colour = 'gray', linetype = 2) + 
  geom_point(size = 2.5) + theme_classic() +
  geom_point(aes(x = estmulti, y = term, shape = f_cat), size = 2.5, position = position_nudge(y = -0.4)) +
  scale_shape_manual(values = c(3, 8, 1), labels = c("<20%", "20-80%", ">80%")) +
  scale_y_discrete(limits = labels_order) +
  theme(axis.line.y = element_blank(), panel.grid.major.y = element_line(size = 0.5),
        text = element_text(size = 15, colour = 'black'),
        axis.title.y = element_blank(),
        axis.text = element_text(colour = "black")) +
  geom_errorbarh(height = 0) +
  xlab("Effect stimate") + labs(shape = "Fraction p < 0.05")

p2
ggsave("vis_coef2_210225.pdf", device = "pdf", scale = 0.7)


labels_order <- rev(as.character(subset(effects, set == "combined")$term))
p <- ggplot(data = subset(effects, set == "combined"),
            aes(x = estimate, y = term, xmin = lower_CI, xmax = upper_CI))

p3 <- p + geom_vline(xintercept = 0, colour = 'gray', linetype = 2) + 
  geom_point(size = 2.5) + theme_classic() +
  geom_point(aes(x = estmulti, y = term, shape = f_cat), size = 2.5, position = position_nudge(y = -0.4)) +
  scale_shape_manual(values = c(3, 8, 1), labels = c("<20%", "20-80%", ">80%")) +
  scale_y_discrete(limits = labels_order) +
  theme(axis.line.y = element_blank(), panel.grid.major.y = element_line(size = 0.5),
        text = element_text(size = 15, colour = 'black'),
        axis.title.y = element_blank(),
        axis.text = element_text(colour = "black")) +
  geom_errorbarh(height = 0) +
  xlab("Effect stimate") + labs(shape = "Fraction p < 0.05")

p3

#ggarrange(p1, p2, p3)
ggsave("vis_coef3_210225.pdf", device = "pdf", scale = 0.7)





# bigger effects plot
effects <- read.table("effects_estimates.csv", sep = ";", head = T, stringsAsFactors = T)
labels_alloc <- rev(as.character(subset(effects, set == "parental provisioning")$term))
names(labels_alloc) <- labels_alloc
labels_alloc <- labels_alloc[-which(labels_alloc == "mass")]
labels_esoc <- rev(as.character(subset(effects, set == "ecosocial")$term))
names(labels_esoc) <- labels_esoc
labels_esoc <- labels_esoc[-which(labels_esoc == "mass")]
labels_comb <- rev(as.character(subset(effects, set == "combined")$term))
names(labels_comb) <- labels_comb
labels_comb <- labels_comb[-which(labels_comb == "mass")]
labels_lh <- rev(as.character(subset(effects, set == "longevity")$term))
names(labels_lh) <- labels_lh
labels_lh <- labels_lh[-which(labels_lh == "mass")]

allcomb <- which(labels_comb %in% labels_alloc)
escomb <- which(labels_comb %in% labels_esoc)
alllh <- which(labels_lh %in% labels_comb)
eslh <- which(labels_lh %in% labels_comb)
mixlh <- which(labels_lh %in% labels_comb)

final_labels <- rev(c("mass", rev(labels_alloc), rev(labels_esoc),
                      rev(labels_comb[-c(allcomb, escomb)]),
                      rev(labels_lh[-c(alllh, eslh, mixlh)])
                      ))

names(final_labels) <- NULL
final_labels
length(final_labels)
final_labels_vals <- Hmisc::capitalize(final_labels)
names(final_labels_vals) <- final_labels

p <- ggplot(data = subset(effects),
            aes(x = estimate, y = term, xmin = lower_CI, xmax = upper_CI))

p4 <- p + geom_vline(xintercept = 0, colour = 'gray90', linetype = 2) +
  geom_errorbarh(height = 0, lwd = 0.75) +
  geom_point(aes(fill = type), size = 2.5, colour = "black", pch = 21, stroke = 1) + theme_classic() +
  scale_y_discrete(limits = final_labels, expand = expansion(add = 0.8)) +
  scale_fill_manual(values = c("#00d302",  "#ff3cfe", "#ffac3b", "#00c2f9", "red")) +
  theme(axis.line.y = element_blank(), panel.grid.major.y = element_line(size = 0.5),
        text = element_text(size = 15, colour = 'black'),
        axis.title.y = element_blank(),
        axis.text = element_text(colour = "black"),
        strip.background = element_rect(fill = "gray90", linetype = 0)) +
  xlab("Effect stimate") + labs(shape = "Fraction p < 0.05", fill = "Predictor set") +
  facet_grid(cols = vars(factor(set, levels = c("parental provisioning", "ecosocial", "combined", "longevity")))) +
  geom_point(aes(x = estmulti, y = term, shape = f_cat, colour = type), size = 2,
             stroke = 1, position = position_nudge(y = -0.40)) +
  scale_shape_manual(values = c(20,3,8), labels = c("<20%", "20%-80%", ">80%")) +
  scale_colour_manual(values = c("#00d302",  "#ff3cfe", "#ffac3b", "#00c2f9", "red"), guide = F)

p4
ggsave("vis_coefall_210302_1", device = "pdf", scale = 0.7)

facetlabels <- list(`parental provisioning` = "Parental provisioning",
                    ecosocial = "Eco-social",
                    combined = "Combined",
                    longevity = "Longevity")

p4 <- p + geom_vline(xintercept = 0, colour = 'gray90', linetype = 2) +
  geom_errorbarh(height = 0, lwd = 0.75) +
  geom_point(aes(fill = type), size = 2.5, colour = "black", pch = 21, stroke = 1) + theme_classic() +
  scale_y_discrete(limits = final_labels, expand = expansion(add = 0.8),
                   labels = final_labels_vals) +
  scale_fill_manual(values = c("#ffac3b", "#00d302","#00c2f9",   "#ff3cfe", "darkgrey"),
                    labels = c("Parental provisioning", "Ecological", "Social", "Mixed", "Life-history"),
                    breaks = c("parental provisioning", "ecological", "social", "mixed", "life-history")) +
  theme(axis.line.y = element_blank(), panel.grid.major.y = element_line(size = 0.5),
        text = element_text(size = 15, colour = 'black'),
        axis.title.y = element_blank(),
        axis.text = element_text(colour = "black"),
        strip.background = element_rect(fill = "gray90", linetype = 0)) +
  xlab("Effect stimate") + labs(shape = "Fraction p < 0.05", fill = "Predictor set") +
  facet_grid(cols = vars(factor(set, levels = c("parental provisioning", "ecosocial", "combined", "longevity"))),
             labeller = function(variable,value) facetlabels[value]) +
  geom_point(aes(x = estmulti, y = term, shape = f_cat, colour = type), size = 2,
             stroke = 1, position = position_nudge(y = -0.40)) +
  scale_shape_manual(values = c(20,3,8), labels = c("<5%", "5%-99%", ">99%"), breaks = c("_0", "_0.5", "_1")) +
  scale_colour_manual(values = c("#ffdc3d",  "#afff2a", "#7cfffa", "#ff92fd", "red"), guide = F,
                      breaks = c("parental provisioning", "ecological", "social", "mixed", "life-history"))

p4
ggsave("vis_coefall_210822", device = "pdf", scale = 0.7)


 # annotate plots ----

birds
p <- ggplot(data = birds, aes(x = weight, y = res_brain, colour = devo_mode))
p1 <- p + geom_point() + geom_smooth(method = "lm") + theme_classic()
p1

p2 <- p1 + geom_text_repel(data = subset(birds, 
                                         (devo_mode == "altrical" & res_brain < -0.55) | 
                                           (devo_mode == "precocial" & res_brain > 0.25)),
                     aes(label = tip_label), colour = "black",
                     size = 3,
                     box.padding = unit(0.35, "lines"),
                     point.padding = unit(0.3, "lines"))
p2
ggsave(file = "brain_weight_names.pdf", device = "pdf")


p <- ggplot(data = birds, aes(x = time_fed, y = res_brain, colour = devo_mode))
p1 <- p + geom_point() + geom_smooth(method = "lm") + theme_classic()
p1

p2 <- p1 + geom_text_repel(data = subset(birds, devo_mode == "altrical" & res_brain < 0.4 & time_fed > 5.8),
                           aes(label = tip_label), colour = "black",
                           size = 3,
                           box.padding = unit(0.35, "lines"),
                           point.padding = unit(0.3, "lines"))
p2
ggsave(file = "brain_altricial_hightfed_smallbrain.pdf", device = "pdf")


p <- ggplot(data = birds, aes(x = time_fed, y = res_brain, colour = devo_mode))
p1 <- p + geom_point() + geom_smooth(method = "lm") + theme_classic()
p1

p2 <- p1 + geom_text_repel(data = subset(birds, devo_mode == "precocial" & time_fed > 4.8),
                           aes(label = tip_label), colour = "black",
                           size = 3,
                           box.padding = unit(0.35, "lines"),
                           point.padding = unit(0.3, "lines"))
p2
ggsave(file = "brain_prec_high_tfed.pdf", device = "pdf")
