m_all <- phylopath::define_model_set(
  
  # NULL MODEL2 ----
  es_null1 = c(
    
  ),
  
  # FULL MODEL 1 no connection ----
  all_full_noconn1 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    # brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    # brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy
  ),
  
  # FULL MODEL 2 no connections ----
  all_full_noconn2 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    brain ~ insularity,
    #brain ~ social_bonds,
    #brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy
  ),
  
  
  
  # FULL MODEL all conn ----
  all_full_1 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    # brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    # brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    devo_mode ~ insularity,
    res_egg_mass ~ insularity,
    time_fed ~ insularity,
    res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    clutch_size ~ temp_range,
    
    clutch_size ~ food_energy,
    res_egg_mass ~ food_energy,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
    
  ),
  
  
  all_full_2 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    brain ~ insularity,
    #brain ~ social_bonds,
    #brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    devo_mode ~ insularity,
    res_egg_mass ~ insularity,
    time_fed ~ insularity,
    res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    clutch_size ~ temp_range,
    
    clutch_size ~ food_energy,
    res_egg_mass ~ food_energy,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
  ),
  
  
  
  
  # FULL MODEL no insularity on dev ----
  all_full_1noinsondev = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    # brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    # brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    # devo_mode ~ insularity,
    # res_egg_mass ~ insularity,
    time_fed ~ insularity,
    res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    clutch_size ~ temp_range,
    
    clutch_size ~ food_energy,
    res_egg_mass ~ food_energy,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
    
  ),
  
  
  all_full_2noinsondev = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    brain ~ insularity,
    #brain ~ social_bonds,
    #brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    # devo_mode ~ insularity,
    # res_egg_mass ~ insularity,
    time_fed ~ insularity,
    res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    clutch_size ~ temp_range,
    
    clutch_size ~ food_energy,
    res_egg_mass ~ food_energy,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
  ),
  
  
  
  
  # FULL MODEL no ins ----
  all_full_1noins = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    # brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    # brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    # devo_mode ~ insularity,
    # res_egg_mass ~ insularity,
    # time_fed ~ insularity,
    res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    clutch_size ~ temp_range,
    
    clutch_size ~ food_energy,
    res_egg_mass ~ food_energy,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
    
  ),
  
  
  all_full_2noins = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    brain ~ insularity,
    #brain ~ social_bonds,
    #brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    # devo_mode ~ insularity,
    # res_egg_mass ~ insularity,
    # time_fed ~ insularity,
    res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    clutch_size ~ temp_range,
    
    clutch_size ~ food_energy,
    res_egg_mass ~ food_energy,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
  ),
  
  
  # FULL MODEL all conn ----
  all_full_1noinsonfed = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    # brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    # brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    devo_mode ~ insularity,
    res_egg_mass ~ insularity,
    # time_fed ~ insularity,
    res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    clutch_size ~ temp_range,
    
    clutch_size ~ food_energy,
    res_egg_mass ~ food_energy,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
    
  ),
  
  
  all_full_2noinsonfed = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    brain ~ insularity,
    #brain ~ social_bonds,
    #brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    devo_mode ~ insularity,
    res_egg_mass ~ insularity,
    # time_fed ~ insularity,
    res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    clutch_size ~ temp_range,
    
    clutch_size ~ food_energy,
    res_egg_mass ~ food_energy,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
  ),
  
  
  
  # FULL MODEL all conn ----
  all_full_1nofoodondev = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    # brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    # brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    devo_mode ~ insularity,
    res_egg_mass ~ insularity,
    time_fed ~ insularity,
    res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    clutch_size ~ temp_range
    
    # clutch_size ~ food_energy,
    # res_egg_mass ~ food_energy,
    # clutch_size ~ foraging_3,
    # res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
    
  ),
  
  
  all_full_2nofoodondev = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    brain ~ insularity,
    #brain ~ social_bonds,
    #brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    devo_mode ~ insularity,
    res_egg_mass ~ insularity,
    time_fed ~ insularity,
    res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    clutch_size ~ temp_range
    
    # clutch_size ~ food_energy,
    # res_egg_mass ~ food_energy,
    # clutch_size ~ foraging_3,
    # res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
  ),
  
  
  
  # FULL MODEL all conn ----
  all_full_1notempondev = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    # brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    # brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    devo_mode ~ insularity,
    res_egg_mass ~ insularity,
    time_fed ~ insularity,
    # res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    # clutch_size ~ temp_range,
    
    clutch_size ~ food_energy,
    res_egg_mass ~ food_energy,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
    
  ),
  
  
  all_full_2notempondev = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    brain ~ insularity,
    #brain ~ social_bonds,
    #brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    devo_mode ~ insularity,
    res_egg_mass ~ insularity,
    time_fed ~ insularity,
    # res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    # clutch_size ~ temp_range,
    
    clutch_size ~ food_energy,
    res_egg_mass ~ food_energy,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
  ),
  
  
  # FULL MODEL all conn ----
  all_full_1notemp = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    # brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    # brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    devo_mode ~ insularity,
    res_egg_mass ~ insularity,
    time_fed ~ insularity,
    # res_egg_mass ~ temp_range,
    # time_fed ~ temp_range,
    # clutch_size ~ temp_range,
    
    clutch_size ~ food_energy,
    res_egg_mass ~ food_energy,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
    
  ),
  
  
  all_full_2notemp = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    brain ~ insularity,
    #brain ~ social_bonds,
    #brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    devo_mode ~ insularity,
    res_egg_mass ~ insularity,
    time_fed ~ insularity,
    # res_egg_mass ~ temp_range,
    # time_fed ~ temp_range,
    # clutch_size ~ temp_range,
    
    clutch_size ~ food_energy,
    res_egg_mass ~ food_energy,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
  ),
  
  
  # FULL MODEL all conn ----
  all_full_1nothingondev = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    # brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    # brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    # devo_mode ~ insularity,
    # res_egg_mass ~ insularity,
    time_fed ~ insularity,
    # res_egg_mass ~ temp_range,
    time_fed ~ temp_range
    # clutch_size ~ temp_range,
    
    # clutch_size ~ food_energy,
    # res_egg_mass ~ food_energy,
    # clutch_size ~ foraging_3,
    # res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
    
  ),
  
  
  all_full_2nothinondev = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    brain ~ insularity,
    #brain ~ social_bonds,
    #brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    # devo_mode ~ insularity,
    # res_egg_mass ~ insularity,
    time_fed ~ insularity,
    # res_egg_mass ~ temp_range,
    time_fed ~ temp_range
    # clutch_size ~ temp_range,
    
    # clutch_size ~ food_energy,
    # res_egg_mass ~ food_energy,
    # clutch_size ~ foraging_3,
    # res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
  ),
  
  
  
  # FULL MODEL all conn ----
  all_full_1nothingonfed = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    # brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    # brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    devo_mode ~ insularity,
    res_egg_mass ~ insularity,
    # time_fed ~ insularity,
    res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    # clutch_size ~ temp_range,
    
    clutch_size ~ food_energy,
    res_egg_mass ~ food_energy,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
    
  ),
  
  
  all_full_2nothingonfed = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain ~ devo_mode,
    brain ~ time_fed,
    brain ~ res_egg_mass,
    brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    brain ~ insularity,
    #brain ~ social_bonds,
    #brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy,
    
    
    devo_mode ~ insularity,
    res_egg_mass ~ insularity,
    # time_fed ~ insularity,
    res_egg_mass ~ temp_range,
    # time_fed ~ temp_range,
    clutch_size ~ temp_range,
    
    clutch_size ~ food_energy,
    res_egg_mass ~ food_energy,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
  ),
  
  # COMMON PATHS ----
  .common = c(
    brain ~ weight,
    move_max ~ insularity + temp_range,
    weight ~ insularity + temp_range,
    food_energy ~ temp_range + food_h_level + fibres,
    foraging_3 ~ food_energy,
    grouping ~ social_bonds,
    clutch_size ~ devo_mode + insularity,
    time_fed ~ devo_mode + food_energy + fibres + food_h_level,
    devo_mode ~ move_max
  )
)

