## Szymek Drobniak
## 200819
## auxiliary functions for d-sep analysis, mostly modified from phylopath


## find topological order for graph components
find_consensus_order <- function(model_set) {
  # If the fully combined model is acyclic, then we use that.
  model_set_same_order <- lapply(model_set, function(x) {
    x[rownames(model_set[[1]]), colnames(model_set[[1]])]
  } )
  full_model <- sign(Reduce('+', model_set_same_order))
  if (ggm::isAcyclic(full_model)) {
    return(rownames(ggm::topSort(full_model)))
  }
  # Otherwise we find the most common orderings and use those.
  # Make sure all models are ordered:
  model_set <- lapply(model_set, ggm::topSort)
  vars <- lapply(model_set, colnames)
  combs <- as.data.frame(t(utils::combn(vars[[1]], 2)), stringsAsFactors = FALSE)
  names(combs) <- c('node1', 'node2')
  combs$count <- 0
  for (i in seq_along(vars)) {
    v <- apply(combs, 1, function(x) {
      which(vars[[i]] == x[1]) < which(vars[[i]] == x[2])
    } )
    combs$count <- combs$count + v
  }
  
  # If node1 is commonly ordered above node2, leave as is, otherwise swap them around
  tmp <- combs$node1
  combs$node1 <- ifelse(combs$count > 0.5 * length(model_set), combs$node1, combs$node2)
  combs$node2 <- ifelse(combs$count > 0.5 * length(model_set), combs$node2, tmp)
  
  # Now we order the nodes by how many nodes they are above, this should go from n:1
  combs$n <- table(combs$node1)[combs$node1]
  combs <- combs[order(-combs$n), ]
  res <- unlist(c(unique(combs$node1), utils::tail(combs, 1)[, 'node2']))
  names(res) <- NULL
  res
}

## convert independency statements to a formula
set_to_formula <- function(x) {
  dep <- x[2]
  ind <- x[1]
  cond <- x[c(-1, -2)]
  
  stats::formula(paste(dep, paste(c(cond, ind), collapse = '+'), sep = '~'))
}


## generate statements from DAG models
find_statements <- function(d, order) {
  s <- ggm::basiSet(d)
  if (is.null(s)) {
    stop('One or some of your models are fully connected, and cannot be tested.')
  }
  s <- lapply(s, function(x) {
    # define whether there are existing paths between the two nodes in both directions.
    path1 <- !is.null(ggm::findPath(d, which(rownames(d) == x[1]), which(rownames(d) == x[2])))
    path2 <- !is.null(ggm::findPath(d, which(rownames(d) == x[2]), which(rownames(d) == x[1])))
    if (path1 & !path2) {
      # the first vertex is upstream, so we do not re-order
      return(x)
    }
    if ((path2 & !path1) | (path1 & path2)) {
      # these conditions should not occur, the first means basiSet is returning the wrong order,
      # the second should only occur if there are cycles.
      stop('If you get this error, please contact the maintainer.')
    }
    if (!path1 & !path2) {
      # check whether the order is according to `order`
      if (which(order == x[1]) < which(order == x[2])) {
        return(x)
      } else {
        return(c(x[2], x[1], x[-(1:2)]))
      }
    }
  } )
  return(s)
}


## generate formulas from statements
find_formulas <- function(d, order) {
  s <- ggm::basiSet(d)
  if (is.null(s)) {
    stop('One or some of your models are fully connected, and cannot be tested.')
  }
  s <- lapply(s, function(x) {
    # define whether there are existing paths between the two nodes in both directions.
    path1 <- !is.null(ggm::findPath(d, which(rownames(d) == x[1]), which(rownames(d) == x[2])))
    path2 <- !is.null(ggm::findPath(d, which(rownames(d) == x[2]), which(rownames(d) == x[1])))
    if (path1 & !path2) {
      # the first vertex is upstream, so we do not re-order
      return(x)
    }
    if ((path2 & !path1) | (path1 & path2)) {
      # these conditions should not occur, the first means basiSet is returning the wrong order,
      # the second should only occur if there are cycles.
      stop('If you get this error, please contact the maintainer.')
    }
    if (!path1 & !path2) {
      # check whether the order is according to `order`
      if (which(order == x[1]) < which(order == x[2])) {
        return(x)
      } else {
        return(c(x[2], x[1], x[-(1:2)]))
      }
    }
  } )
  lapply(s, set_to_formula)
}




## extract p-vals from an asreml call (MODIFIED)
get_p <- function(m) {
  # s <- asreml::summary.asreml(m, coef = T)
  t <- na.omit(m$coef.fixed)[1, "z.ratio"]
  p <- 2*(1 - pt(abs(t), df = m$nedf))
  if (p < .Machine$double.eps) p <- .Machine$double.eps
  return(p)
}

# REDUNDANT for now: lower and upper CI from boot object
# PLAN: reformat to use MCMCglmm instead
# get_lower <- function(m) {
#   s <- switch(
#     class(m),
#     phylolm = stats::coef(phylolm::summary.phylolm(m)),
#     phyloglm = stats::coef(phylolm::summary.phyloglm(m))
#   )
#   if ('lowerbootCI' %in% colnames(s)) {
#     r <- s[-1, 'lowerbootCI']
#   } else {
#     r <- NA
#   }
#   return(r)
# }
# 
# get_upper <- function(m) {
#   s <- switch(
#     class(m),
#     phylolm = stats::coef(phylolm::summary.phylolm(m)),
#     phyloglm = stats::coef(phylolm::summary.phyloglm(m))
#   )
#   if ('upperbootCI' %in% colnames(s)) {
#     r <- s[-1, 'upperbootCI']
#   } else {
#     r <- NA
#   }
#   return(r)
# }

## extract phylogenetic signal parameter (MODIFIED)
get_sigma_phy <- function(m) {
  sigma <- m$varcomp[1, "component"]
  if (is.null(sigma)) sigma <- NA
  return(sigma)
}






## collection of function to generate d-separation summary stats
C_stat <- function(ps) -2 * sum(log(as.numeric(ps)))

C_p <- function(C, k) 1 - stats::pchisq(C, 2 * k)

CICc <- function(C, q, n) C + 2 * q * (n / (n - 1 - q))

l <- function(dCICc) exp(-0.5 * dCICc)

w <- function(l) l / sum(l)




## summarize a final d-sep object
summarize_dsep <- function(object, ...) {
  
  n <- nrow(object$data)
  k <- sapply(object$d_sep, nrow)
  q <- sapply(object$model_sets, function(m) nrow(m) + sum(m))
  C <- sapply(object$d_sep, function(x) C_stat(x$p))
  p <- C_p(C, k)
  IC <- CICc(C, q, n)
  
  if (n <= max(q) + 1) {
    IC[n <= q] <- NA
    warning('CICc was not calculated for causal models where the number of parameters is equal to',
            'or larger than the number of species.')
  }
  
  d <- data.frame(
    model = names(object$model_set), k = k, q = q, C = C, p = p,
    CICc = IC, stringsAsFactors = FALSE
  )
  d <- d[order(d$CICc), ]
  d$delta_CICc <- d$CICc - d$CICc[1]
  d$l <- l(d$delta_CICc)
  d$w <- w(d$l)
  return(d)
}


## extract the best model
best <- function(object, ...) {
  # stopifnot(inherits(phylopath, 'phylopath'))
  # dots <- combine_dots(phylopath$dots, ...)
  
  b <- summarize_dsep(object)[1, 'model']
  best_model <- object$model_set[[b]]
  # do.call(
  #   est_DAG,
  #   c(list(best_model, phylopath$data, phylopath$tree, phylopath$model, phylopath$method), dots)
  # )
  
  best_model
}



## plot a DAG structure
plot.DAG <- function(x, labels = NULL, algorithm = 'sugiyama', manual_layout = NULL, text_size = 6,
                     box_x = 12, box_y = 8, edge_width = 1.5, curvature = 0.02, rotation = 0,
                     flip_x = FALSE, flip_y = FALSE,
                     arrow = grid::arrow(type = 'closed', 18, grid::unit(15, 'points')), ...) {
  g <- igraph::graph_from_adjacency_matrix(x, weighted = TRUE)
  
  l <- ggraph::create_layout(g, 'igraph', algorithm = algorithm)
  if (!is.null(manual_layout)) {
    l$x <- manual_layout$x[match(l$name, manual_layout$name)]
    l$y <- manual_layout$y[match(l$name, manual_layout$name)]
  }
  l <- adjust_layout(l, rotation, flip_x, flip_y)
  l <- combine_with_labels(l, labels)
  
  ggraph::ggraph(l) +
    ggraph::geom_edge_arc(
      curvature = curvature, arrow = arrow, edge_width = edge_width,
      end_cap = ggraph::rectangle(box_x, box_y, 'mm'),
      start_cap = ggraph::rectangle(box_x, box_y, 'mm')
    ) +
    ggraph::geom_node_text(ggplot2::aes_(label = ~name), size = text_size) +
    ggraph::theme_graph(base_family = 'sans')
}

adjust_layout <- function(l, rotation, flip_x, flip_y) {
  rotation <- rotation * (2 * pi / 360)
  R <- matrix(c(cos(rotation), sin(rotation), -sin(rotation), cos(rotation)), nrow = 2)
  l[c('x', 'y')] <- as.matrix(l[c('x', 'y')]) %*% R
  if (flip_x) {
    l$x <- -l$x
  }
  if (flip_y) {
    l$y <- -l$y
  }
  return(l)
}

combine_with_labels <- function(l, labels) {
  if (is.null(labels)) {
    return(l)
  }
  if (is.null(names(labels))) {
    stop('labels must be a named vector.', call. = FALSE)
  }
  if (length(setdiff(l$name, names(labels))) > 0) {
    stop('Some nodes are missing from labels.', call. = FALSE)
  }
  l$name <- factor(l$name, names(labels), labels)
  class(l) <- c("layout_igraph", "layout_ggraph", "data.frame")
  return(l)
}

DAG <- function(..., order = TRUE) {
  d <- ggm::DAG(..., order = order)
  class(d) <- c(class(d), 'DAG')
  d
}

## extract estimates from an asreml call (MODIFIED)
get_est <- function(m) {
  summ <- asreml::summary.asreml(m, coef = T)$coef.fixed
  summ <- na.omit(summ[rev(1:nrow(summ)),])
  
  return(summ[-1, 'solution'])
}

## extract SEs from anasreml call (MODIFIED)
get_se <- function(m) {
  summ <- asreml::summary.asreml(m, coef = T)$coef.fixed
  summ <- na.omit(summ[rev(1:nrow(summ)),])
  
  return(summ[-1, 'std error'])
}


## run a DAG as a linear model and map its estimates to DAG structure (MODIFIED)
est_DAG <- function(DAG, data, phylogeny, phy_var, link, ...) {
  stopifnot(inherits(DAG, 'DAG'))
  # scale the continous variables
  r <- rownames(data)
  data[sapply(data, is.numeric)] <- lapply(data[sapply(data, is.numeric)], scale)
  rownames(data) <- r
  
  d <- Map(function(x, y, n) {
    if (all(y == 0)) {
      return(cbind(y, y))
    }
    form <- stats::formula(paste(x, paste(n[y == 1], collapse = '+'), sep = '~'))
    
    m <- run_asreml(formula = form, data = data, phylogeny = phylogeny, phy_var = phy_var, link = link, ...)
    m <- m$result
    # below error handling will be updated later
    # if (!is.null(m$error)) {
    #   stop(paste('Fitting the following model:\n   ', Reduce(paste, deparse(f)),
    #              '\nproduced this error:\n   ', m$error),
    #        call. = FALSE)
    # }
    
    Coef <- se <- lower <- upper <- y
    
    Coef[Coef != 0]   <- get_est(m)
    se[se != 0]       <- get_se(m)
    
    # no CIs in asreml-R call
    # lower[lower != 0] <- get_lower(m)
    # upper[upper != 0] <- get_upper(m)
    return(cbind(coef = Coef, se = se))
  }, colnames(DAG), as.data.frame(DAG), MoreArgs = list(n = rownames(DAG)))
  coefs  <- sapply(d, `[`, 1:nrow(DAG), 1)
  ses    <- sapply(d, `[`, 1:nrow(DAG), 2)
  # lowers <- sapply(d, `[`, 1:nrow(DAG), 3)
  # uppers <- sapply(d, `[`, 1:nrow(DAG), 4)
  rownames(coefs) <- rownames(ses) <- rownames(DAG)
  res <- list(coef = coefs, se = ses)
  class(res) <- 'fitted_DAG'
  return(res)
}


## plotting functions
plot.fitted_DAG <- function(x, type = 'width', labels = NULL, algorithm = 'sugiyama',
                            manual_layout = NULL, text_size = 6, box_x = 12, box_y = 8,
                            edge_width = 1.25, curvature = 0.02, rotation = 0, flip_x = FALSE,
                            flip_y = FALSE,
                            arrow = grid::arrow(type = 'closed', 18, grid::unit(15, 'points')),
                            colors = c('firebrick', 'navy'), show.legend = TRUE,
                            width_const = NULL, ...) {
  if (!is.null(width_const)) {
    warning('width_const has been deprecated and is ignored.', call. = FALSE)
  }
  type <- match.arg(type, c('width', 'color', 'colour'), FALSE)
  if (type == 'colour') type <- 'color'
  
  g <- igraph::graph_from_adjacency_matrix(x$coef, weighted = TRUE)
  l <- ggraph::create_layout(g, 'igraph', algorithm = algorithm)
  if (!is.null(manual_layout)) {
    l$x <- manual_layout$x[match(l$name, manual_layout$name)]
    l$y <- manual_layout$y[match(l$name, manual_layout$name)]
  }
  l <- adjust_layout(l, rotation, flip_x, flip_y)
  l <- combine_with_labels(l, labels)
  
  if (type == 'width') {
    p <- ggplot2::ggplot(l) +
      ggraph::geom_edge_arc(
        ggplot2::aes_(width = ~abs(weight), color = ~weight < 0, label = ~round(weight, 2)),
        curvature = curvature, arrow = arrow, end_cap = ggraph::rectangle(box_x, box_y, 'mm'),
        start_cap = ggraph::rectangle(box_x, box_y, 'mm'), show.legend = show.legend,
        linejoin = c('bevel'), angle_calc = 'along', label_dodge = grid::unit(10, 'points')) +
      ggraph::geom_node_text(ggplot2::aes_(label = ~name), size = text_size) +
      ggraph::scale_edge_width_continuous(limits = c(0, max(abs(igraph::E(g)$weight))), range = c(0, 2),
                                          guide = 'none') +
      ggraph::scale_edge_color_manual(name = NULL,
                                      values = c('FALSE' = colors[2], 'TRUE' = colors[1]),
                                      labels = c('positive', 'negative')) +
      ggraph::theme_graph(base_family = 'sans')
  }
  
  if (type == 'color') {
    p <- ggplot2::ggplot(l) +
      ggraph::geom_edge_arc(
        ggplot2::aes_(colour = ~weight, label = ~round(weight, 2)),
        edge_width = edge_width,
        curvature = curvature, arrow = arrow,
        end_cap = ggraph::rectangle(box_x, box_y, 'mm'),
        start_cap = ggraph::rectangle(box_x, box_y, 'mm'),
        show.legend = show.legend,
        linejoin = c('bevel'),
        angle_calc = 'along',
        label_dodge = grid::unit(10, 'points')
      ) +
      ggraph::geom_node_text(ggplot2::aes_(label = ~name), size = text_size) +
      ggraph::scale_edge_color_gradient2(
        'standardized\npath coefficient',
        low = colors[1], high = colors[2],
        limits = c(-max(abs(igraph::E(g)$weight)),
                   max(abs(igraph::E(g)$weight))),
        guide = ggraph::guide_edge_colorbar()
      ) +
      ggraph::theme_graph(base_family = 'sans')
  }
  return(p)
}

coef_plot <- function(fitted_DAG, error_bar = 'ci', order_by = "default", from = NULL, to = NULL,
                      reverse_order = FALSE) {
  stopifnot(inherits(fitted_DAG, 'fitted_DAG'))
  error_bar <- match.arg(error_bar, c('ci', 'se'), several.ok = FALSE)
  order_by <- match.arg(order_by, c('default', 'causal', 'strength'), FALSE)
  if (error_bar == 'ci' & is.null(fitted_DAG$lower)) {
    message(
      'The fitted model does not contain confidence intervals, so showing standard errors instead. ',
      'Fit the model with `boot` larger than 0 to get confidence intervals, or set `error_bar = "se"` ',
      'to avoid this warning.'
    )
    error_bar <- 'se'
  }
  v <- colnames(fitted_DAG$coef)
  df <- as.data.frame(fitted_DAG$coef)
  df$from <- rownames(df)
  df <- stats::reshape(df, varying = v, 'coef', direction = 'long')
  df$to <- v[df$time]
  
  if (error_bar == 'ci') {
    df$lower <- c(fitted_DAG$lower)
    df$upper <- c(fitted_DAG$upper)
  } else {
    df$lower <- c(fitted_DAG$coef - fitted_DAG$se)
    df$upper <- c(fitted_DAG$coef + fitted_DAG$se)
  }
  
  df$path <- paste(df$from, df$to, sep = ' \U2192 ')
  
  # Do the ordering of paths:
  if (order_by == 'default') {
    df <- df[order(match(df$from, v), match(df$to, v)), ]
  }
  if (order_by == 'causal') {
    ordered_DAG <- fitted_DAG$coef > 0
    ordered_DAG[, ] <- as.numeric(ordered_DAG)
    order <- colnames(ggm::topSort(ordered_DAG))
    df <- df[order(match(df$from, order), match(df$to, order)), ]
  }
  if (order_by == 'strength') {
    df <- df[order(df$coef), ]
  }
  # Do the filtering of paths:
  if (!is.null(from)) {
    df <- df[df$from %in% from, ]
  }
  if (!is.null(to)) {
    # make sure the variable is unambiguous
    df <- df[df$to %in% to, ]
  }
  
  if (reverse_order) {
    df$path <- factor(df$path, levels = rev(df$path))
  } else {
    df$path <- factor(df$path, levels = df$path)
  }
  df <- df[abs(df$coef) > .Machine$double.eps, ]
  ggplot2::ggplot(df,
                  ggplot2::aes_(~path, ~coef, ymin = ~lower, ymax = ~upper)) +
    ggplot2::geom_hline(yintercept = 0, size = 1, lty = 2) +
    ggplot2::geom_pointrange(size = 0.75) +
    ggplot2::xlab('') +
    ggplot2::ylab(ifelse(error_bar == 'ci',
                         'standardized regression coefficient \U00B1 CI',
                         'standardized regression coefficient \U00B1 SE'))
}





####################
##### my versions of phylopath internals
####################


run_asreml <- function(formula, data, phylogeny, phy_var, phylo_lev = 1, family = NULL, link = "logit", trace = F, ...) {
  implicit <- list(...)
  
  # check if response variable if continous or factor
  y_var <- data[[all.vars(formula)[1]]]
  
  # print(link)
  if(is.factor(y_var)) {
    data[[all.vars(formula)[1]]] <- as.numeric(y_var) - 1
    family <- do.call(asr_binomial, list(link = link))
  } else {
    family <- asr_gaussian()
  }
  # print(family)
  if(is.null(family)) stop("Your data is of invalid type or you provided invalid family argument.")
  
  
  if(phylo_lev == 1) {
    random_formula <- as.formula(paste('~vm(', phy_var, ', vcv_phy)'))
  } else {
    random_formula <- as.formula(paste('~vm(', phy_var, ', vcv_phy) + ', phy_var))
  }
  
  args <- c(list(fixed = formula, data = data, family = family, random = random_formula, trace = trace), implicit)
  # model_method <- asreml
  
  vcv_phy <- vcv.phylo(phylogeny, corr = T)
  # invisible(capture.output(output <- do.call(asreml, args)))
  output <- do.call(purrr::quietly(asreml), args)
  # output <- do.call(asreml, args)
  
  # return(vcv_phy)
  # return(args)
  
  return(output)
  
}


dseps_asreml <- function(formulae, data, phylogeny, phy_var, link, ...) {
  implicit = list(...)
  output_list <- pbapply::pblapply(formulae,
                                   function(x, data, phylogeny, phy_var, link) {
                                     run_asreml(formula = x, data = data, phylogeny = phylogeny,
                                                phy_var = phy_var, link = link, ...)
                                   },
                                   data = data, phylogeny = phylogeny, phy_var = phy_var, link = link)
  
  return(output_list)
  # results_list <- purrr::map(output_list, ~asreml::summary.asreml(.x, coef = T))
}