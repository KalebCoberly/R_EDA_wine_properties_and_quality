basic_hist = function (data, x, x_lbl, leg_lbl = 'type') {
  # Creates a basic histogram with lines for the types.
  return(
    ggplot(data = data, aes(x = x)) +
      geom_histogram() +
      geom_freqpoly(aes(color = type)) +
      xlab(label = x_lbl) +
      labs(color = leg_lbl)
  )
}

# ==============================================================================

basic_hist2 = function (data, x, binw, x_lbl, breaks = waiver(), limits = NULL,
                        freq = wine_df$type, leg_lbl = 'type') {
  # Creates a basic histogram with lines for subsets.
  return(
    ggplot(data = data, aes(x = x)) +
      geom_histogram(binwidth = binw) +
      geom_freqpoly(aes(color = freq), binwidth = binw) +
      scale_x_continuous(breaks = breaks, limits = limits) +
      labs(x = x_lbl, color = leg_lbl)
  )
}

# ==============================================================================

jitter_box_violin = function (data, x, x_lbl, y = 'type', y_lbl = 'type',
                              breaks = waiver(), limits = NULL,
                              jit_color = 'red') {
  # Creates overlapping whisker box plot, violin plot, and jittered points.
  # Subset by a variable along the y axis.
  return(
    ggplot(data = data, aes(x = data[ , x], y = data[ , y])) +
      geom_jitter(alpha = .2, color = jit_color) +
      geom_boxplot(varwidth = T, notch = T, notchwidth = .1, alpha = 0) +
      geom_violin(alpha = 0) +
      scale_x_continuous(breaks = breaks, limits = limits) +
      labs(x = x_lbl, y = y_lbl)
  )
}

# ==============================================================================

get_out_bounds = function (x) {
  # Returns a vector of the upper and lower bounds for outliers.
  # First value is lower bound; second is upper.
  bounds_vec = c(0, 0)
  
  bounds_vec[1] = quantile(x = x, probs = .25) - (1.5 * IQR(x))
  bounds_vec[2] = quantile(x = x, probs = .75) + (1.5 * IQR(x))
  
  return(bounds_vec)
}

# ==============================================================================

basic_cor = function (data, name, nbreaks = 6, label = T, label_alpha = T,
                      label_round = 2, label_size = 3, layout.exp = 1.75,
                      nudge_x = -1.25) {
  # Creates a basic correlation heatmap with default settings.
  plt = ggcorr(data = data, nbreaks = nbreaks, name = name, label = label,
               label_alpha = label_alpha, label_round = label_round,
               label_size = label_size, layout.exp = layout.exp,
               nudge_x = nudge_x)
  
  return(plt)
}

# ==============================================================================

basic_scatter = function (data, x, y, x_lbl, y_lbl, x_breaks = waiver(),
                          y_breaks = waiver(), x_limits = NULL,
                          y_limits = NULL, jit_color = NULL, pt_color = NULL,
                          leg_lbl = 'type', fr = T, jit_w = .5, jit_h = .5,
                          alpha = .2, jit_size = NULL, reg_lines = T){
  # Creates a scatter plot with linear and default smoothing lines, defaults.
  # Subset by a variable with colored points.
  plt = NULL
  
  jit = NULL
  if (is.null(pt_color)) {
    jit = geom_jitter(alpha = alpha,
                      position = position_jitter(w = jit_w, h = jit_h),
                      aes(color = jit_color, size = jit_size))
  } else {
    jit = geom_jitter(alpha = alpha,
                      position = position_jitter(w = jit_w, h = jit_h),
                      color = pt_color)
  }
  
  plt = ggplot(data = data, aes(x = data[ ,x], y = data[ ,y])) +
    jit +
    scale_x_continuous(breaks = x_breaks, limits = x_limits) +
    scale_y_continuous(breaks = y_breaks, limits = y_limits) +
    labs(x = x_lbl, y = y_lbl, color = leg_lbl)
  
  if (reg_lines) {
    plt = plt + geom_smooth(fullrange = fr) +
      geom_smooth(method = 'lm', color = 'yellow', fullrange = fr)
  }
  
  return(plt)
}

# ==============================================================================

jbv_trend = function (data, x, y, x_lbl = NULL, y_lbl = NULL, leg_lbl = NULL,
                      x_breaks = waiver(), x_limits = NULL,
                      y_breaks = waiver(), y_limits = NULL,
                      jit_color = NULL, jit_w = .4, jit_h = .4, alpha = .2,
                      pt_color = NULL, upper_probs = .9, lower_probs = .1) {
  
  gplt = NULL
  jit = NULL
  if (is.null(pt_color)) {
    gplt = ggplot(data = data,
                  aes(x = data[ , x], y = data[ , y], color = jit_color))
    jit = geom_jitter(alpha = alpha,
                      position = position_jitter(w = jit_w, h = jit_h))
  } else {
    gplt = ggplot(data = data, aes(x = data[ , x], y = data[ , y]))
    jit = geom_jitter(alpha = alpha,
                      position = position_jitter(w = jit_w, h = jit_h),
                      aes(color = pt_color))
  }
  
  plt = gplt + jit +
    geom_boxplot(notch = T, notchwidth = .1, varwidth = T, alpha = 0) +
    geom_violin(alpha = 0) +
    geom_line(stat = 'summary', fun = quantile,
              fun.args = list(probs = upper_probs),
              linetype = 2, aes(group = 1)) +
    geom_line(stat = 'summary', fun = mean, aes(group = 1)) +
    geom_line(stat = 'summary', fun = quantile,
              fun.args = list(probs = lower_probs),
              linetype = 2, aes(group = 1)) +
    scale_x_discrete(breaks = x_breaks, limits = x_limits) +
    scale_y_continuous(breaks = y_breaks, limits = y_limits) +
    xlab(label = x_lbl) + ylab(label = y_lbl)
  
  if (!is.null(leg_lbl)) {
    plt = plt + labs(color = leg_lbl)
  }
  
  return(plt)
}

# ==============================================================================

get_proto_spline_lst =
  function (data, x, y, l_col, x_lbl, y_lbl, x_breaks = waiver(),
            y_breaks = waiver(), x_limits = NULL, y_limits = NULL,
            jit_color = NULL, leg_lbl = 'type', fr = T, jit_w = .5,
            jit_h = .5, pt_color = NULL) {
    plts = list()
    
    level_vect = sort(unique(data[ , l_col]))
    
    plts = lapply(X = level_vect, FUN = function(level){
      basic_scatter(data = data[data[l_col] == as.character(level), ],
                    x = x, y = y, x_lbl = x_lbl, y_lbl = y_lbl,
                    x_breaks = x_breaks, y_breaks = y_breaks,
                    x_limits = x_limits, y_limits = y_limits,
                    jit_color = jit_color, leg_lbl = leg_lbl, fr = fr,
                    jit_w = jit_w, jit_h = jit_h, pt_color = pt_color)
    })
    
    return(plts)
  }

# ==============================================================================

get_pair_scats = function (data, x_str, y_lst, size, alpha = .2) {
  plt_lst = list()
  
  plt_lst = lapply(X = y_lst, FUN = function(y_str){
    return(
      ggplot(data = data, aes(x = data[ , x_str], y = data[ , y_str])) +
        geom_jitter(alpha = alpha, size = size) +
        labs(x = x_str, y = y_str)
    )
  })
  
  return(plt_lst)
}