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
    
    #brain_log ~ devo_mode,
    brain_log ~ time_fed,
    brain_log ~ res_egg_mass,
    brain_log ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  # # FULL MODEL 2 no connections ----
  # all_full_noconn2 = c(
  #   clutch_size ~ weight,
  #   clutch_size ~ devo_mode,
  #   
  #   devo_mode ~ weight,
  #   
  #   res_egg_mass ~ devo_mode,
  #   res_egg_mass ~ clutch_size,
  #   time_fed ~ res_egg_mass,
  #   
  #   #brain_log ~ devo_mode,
  #   brain_log ~ time_fed,
  #   brain_log ~ res_egg_mass,
  #   brain_log ~ clutch_size,
  #   
  #   time_fed ~ weight,
  #   res_egg_mass ~ weight,
  #   #weight ~ time_fed,
  #   #weight ~ res_egg_mass,
  #   
  #   
  #   brain_log ~ move_max,
  #   brain_log ~ foraging_3,
  #   brain_log ~ food_energy,
  #   brain_log ~ food_h_level,
  #   brain_log ~ fibres,
  #   brain_log ~ insularity,
  #   #brain_log ~ social_bonds,
  #   #brain_log ~ grouping,
  #   
  #   foraging_3 ~ insularity,
  #   
  #   weight ~ fibres,
  #   weight ~ food_energy
  # ),
  
  
  
  # FULL MODEL all conn ----
  all_full_1 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain_log ~ devo_mode,
    brain_log ~ time_fed,
    brain_log ~ res_egg_mass,
    brain_log ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC,
    
    
    # insularity ~ devo_mode,
    move_max ~ devo_mode,
    res_egg_mass ~ insularity,
    time_fed ~ insularity,
    res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    clutch_size ~ temp_range,
    
    clutch_size ~ food_energy_RC,
    res_egg_mass ~ food_energy_RC,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
    
  ),
  
  
  # all_full_2 = c(
  #   clutch_size ~ weight,
  #   clutch_size ~ devo_mode,
  #   
  #   devo_mode ~ weight,
  #   
  #   res_egg_mass ~ devo_mode,
  #   res_egg_mass ~ clutch_size,
  #   time_fed ~ res_egg_mass,
  #   
  #   #brain_log ~ devo_mode,
  #   brain_log ~ time_fed,
  #   brain_log ~ res_egg_mass,
  #   brain_log ~ clutch_size,
  #   
  #   time_fed ~ weight,
  #   res_egg_mass ~ weight,
  #   #weight ~ time_fed,
  #   #weight ~ res_egg_mass,
  #   
  #   
  #   brain_log ~ move_max,
  #   brain_log ~ foraging_3,
  #   brain_log ~ food_energy,
  #   brain_log ~ food_h_level,
  #   brain_log ~ fibres,
  #   brain_log ~ insularity,
  #   #brain_log ~ social_bonds,
  #   #brain_log ~ grouping,
  #   
  #   foraging_3 ~ insularity,
  #   
  #   weight ~ fibres,
  #   weight ~ food_energy,
  #   
  #   
  #   insularity ~ devo_mode,
  #   res_egg_mass ~ insularity,
  #   time_fed ~ insularity,
  #   res_egg_mass ~ temp_range,
  #   time_fed ~ temp_range,
  #   clutch_size ~ temp_range,
  #   
  #   clutch_size ~ food_energy,
  #   res_egg_mass ~ food_energy,
  #   clutch_size ~ foraging_3,
  #   res_egg_mass ~ foraging_3
  #   # food_energy ~ clutch_size + res_egg_mass,
  #   # foraging_3 ~ clutch_size + res_egg_mass
  # ),
  
  
  
  
  # FULL MODEL no insularity on dev ----
  all_full_1noinsondev = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain_log ~ devo_mode,
    brain_log ~ time_fed,
    brain_log ~ res_egg_mass,
    brain_log ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC,
    
    
    # insularity ~ devo_mode,
    # res_egg_mass ~ insularity,
    time_fed ~ insularity,
    res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    clutch_size ~ temp_range,
    
    clutch_size ~ food_energy_RC,
    res_egg_mass ~ food_energy_RC,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
    
  ),
  
  
  # all_full_2noinsondev = c(
  #   clutch_size ~ weight,
  #   clutch_size ~ devo_mode,
  #   
  #   devo_mode ~ weight,
  #   
  #   res_egg_mass ~ devo_mode,
  #   res_egg_mass ~ clutch_size,
  #   time_fed ~ res_egg_mass,
  #   
  #   #brain_log ~ devo_mode,
  #   brain_log ~ time_fed,
  #   brain_log ~ res_egg_mass,
  #   brain_log ~ clutch_size,
  #   
  #   time_fed ~ weight,
  #   res_egg_mass ~ weight,
  #   #weight ~ time_fed,
  #   #weight ~ res_egg_mass,
  #   
  #   
  #   brain_log ~ move_max,
  #   brain_log ~ foraging_3,
  #   brain_log ~ food_energy,
  #   brain_log ~ food_h_level,
  #   brain_log ~ fibres,
  #   brain_log ~ insularity,
  #   #brain_log ~ social_bonds,
  #   #brain_log ~ grouping,
  #   
  #   foraging_3 ~ insularity,
  #   
  #   weight ~ fibres,
  #   weight ~ food_energy,
  #   
  #   
  #   # insularity ~ devo_mode,
  #   # res_egg_mass ~ insularity,
  #   time_fed ~ insularity,
  #   res_egg_mass ~ temp_range,
  #   time_fed ~ temp_range,
  #   clutch_size ~ temp_range,
  #   
  #   clutch_size ~ food_energy,
  #   res_egg_mass ~ food_energy,
  #   clutch_size ~ foraging_3,
  #   res_egg_mass ~ foraging_3
  #   # food_energy ~ clutch_size + res_egg_mass,
  #   # foraging_3 ~ clutch_size + res_egg_mass
  # ),
  
  
  
  
  # FULL MODEL no ins ----
  all_full_1noins = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain_log ~ devo_mode,
    brain_log ~ time_fed,
    brain_log ~ res_egg_mass,
    brain_log ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC,
    
    
    # insularity ~ devo_mode,
    # res_egg_mass ~ insularity,
    # time_fed ~ insularity,
    res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    clutch_size ~ temp_range,
    
    clutch_size ~ food_energy_RC,
    res_egg_mass ~ food_energy_RC,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
    
  ),
  
  
  # all_full_2noins = c(
  #   clutch_size ~ weight,
  #   clutch_size ~ devo_mode,
  #   
  #   devo_mode ~ weight,
  #   
  #   res_egg_mass ~ devo_mode,
  #   res_egg_mass ~ clutch_size,
  #   time_fed ~ res_egg_mass,
  #   
  #   #brain_log ~ devo_mode,
  #   brain_log ~ time_fed,
  #   brain_log ~ res_egg_mass,
  #   brain_log ~ clutch_size,
  #   
  #   time_fed ~ weight,
  #   res_egg_mass ~ weight,
  #   #weight ~ time_fed,
  #   #weight ~ res_egg_mass,
  #   
  #   
  #   brain_log ~ move_max,
  #   brain_log ~ foraging_3,
  #   brain_log ~ food_energy,
  #   brain_log ~ food_h_level,
  #   brain_log ~ fibres,
  #   brain_log ~ insularity,
  #   #brain_log ~ social_bonds,
  #   #brain_log ~ grouping,
  #   
  #   foraging_3 ~ insularity,
  #   
  #   weight ~ fibres,
  #   weight ~ food_energy,
  #   
  #   
  #   # insularity ~ devo_mode,
  #   # res_egg_mass ~ insularity,
  #   # time_fed ~ insularity,
  #   res_egg_mass ~ temp_range,
  #   time_fed ~ temp_range,
  #   clutch_size ~ temp_range,
  #   
  #   clutch_size ~ food_energy,
  #   res_egg_mass ~ food_energy,
  #   clutch_size ~ foraging_3,
  #   res_egg_mass ~ foraging_3
  #   # food_energy ~ clutch_size + res_egg_mass,
  #   # foraging_3 ~ clutch_size + res_egg_mass
  # ),
  
  
  # FULL MODEL all conn ----
  all_full_1noinsonfed = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain_log ~ devo_mode,
    brain_log ~ time_fed,
    brain_log ~ res_egg_mass,
    brain_log ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC,
    
    
    # insularity ~ devo_mode,
    move_max ~ devo_mode,
    res_egg_mass ~ insularity,
    # time_fed ~ insularity,
    res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    clutch_size ~ temp_range,
    
    clutch_size ~ food_energy_RC,
    res_egg_mass ~ food_energy_RC,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
    
  ),
  
  
  # all_full_2noinsonfed = c(
  #   clutch_size ~ weight,
  #   clutch_size ~ devo_mode,
  #   
  #   devo_mode ~ weight,
  #   
  #   res_egg_mass ~ devo_mode,
  #   res_egg_mass ~ clutch_size,
  #   time_fed ~ res_egg_mass,
  #   
  #   #brain_log ~ devo_mode,
  #   brain_log ~ time_fed,
  #   brain_log ~ res_egg_mass,
  #   brain_log ~ clutch_size,
  #   
  #   time_fed ~ weight,
  #   res_egg_mass ~ weight,
  #   #weight ~ time_fed,
  #   #weight ~ res_egg_mass,
  #   
  #   
  #   brain_log ~ move_max,
  #   brain_log ~ foraging_3,
  #   brain_log ~ food_energy,
  #   brain_log ~ food_h_level,
  #   brain_log ~ fibres,
  #   brain_log ~ insularity,
  #   #brain_log ~ social_bonds,
  #   #brain_log ~ grouping,
  #   
  #   foraging_3 ~ insularity,
  #   
  #   weight ~ fibres,
  #   weight ~ food_energy,
  #   
  #   
  #   insularity ~ devo_mode,
  #   res_egg_mass ~ insularity,
  #   # time_fed ~ insularity,
  #   res_egg_mass ~ temp_range,
  #   time_fed ~ temp_range,
  #   clutch_size ~ temp_range,
  #   
  #   clutch_size ~ food_energy,
  #   res_egg_mass ~ food_energy,
  #   clutch_size ~ foraging_3,
  #   res_egg_mass ~ foraging_3
  #   # food_energy ~ clutch_size + res_egg_mass,
  #   # foraging_3 ~ clutch_size + res_egg_mass
  # ),
  
  
  
  # FULL MODEL all conn ----
  all_full_1nofoodondev = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain_log ~ devo_mode,
    brain_log ~ time_fed,
    brain_log ~ res_egg_mass,
    brain_log ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC,
    
    
    # insularity ~ devo_mode,
    move_max ~ devo_mode,
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
  
  
  # all_full_2nofoodondev = c(
  #   clutch_size ~ weight,
  #   clutch_size ~ devo_mode,
  #   
  #   devo_mode ~ weight,
  #   
  #   res_egg_mass ~ devo_mode,
  #   res_egg_mass ~ clutch_size,
  #   time_fed ~ res_egg_mass,
  #   
  #   #brain_log ~ devo_mode,
  #   brain_log ~ time_fed,
  #   brain_log ~ res_egg_mass,
  #   brain_log ~ clutch_size,
  #   
  #   time_fed ~ weight,
  #   res_egg_mass ~ weight,
  #   #weight ~ time_fed,
  #   #weight ~ res_egg_mass,
  #   
  #   
  #   brain_log ~ move_max,
  #   brain_log ~ foraging_3,
  #   brain_log ~ food_energy,
  #   brain_log ~ food_h_level,
  #   brain_log ~ fibres,
  #   brain_log ~ insularity,
  #   #brain_log ~ social_bonds,
  #   #brain_log ~ grouping,
  #   
  #   foraging_3 ~ insularity,
  #   
  #   weight ~ fibres,
  #   weight ~ food_energy,
  #   
  #   
  #   insularity ~ devo_mode,
  #   res_egg_mass ~ insularity,
  #   time_fed ~ insularity,
  #   res_egg_mass ~ temp_range,
  #   time_fed ~ temp_range,
  #   clutch_size ~ temp_range
  #   
  #   # clutch_size ~ food_energy,
  #   # res_egg_mass ~ food_energy,
  #   # clutch_size ~ foraging_3,
  #   # res_egg_mass ~ foraging_3
  #   # food_energy ~ clutch_size + res_egg_mass,
  #   # foraging_3 ~ clutch_size + res_egg_mass
  # ),
  
  
  
  # FULL MODEL all conn ----
  all_full_1notempondev = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain_log ~ devo_mode,
    brain_log ~ time_fed,
    brain_log ~ res_egg_mass,
    brain_log ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC,
    
    
    # insularity ~ devo_mode,
    move_max ~ devo_mode,
    res_egg_mass ~ insularity,
    time_fed ~ insularity,
    # res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    # clutch_size ~ temp_range,
    
    clutch_size ~ food_energy_RC,
    res_egg_mass ~ food_energy_RC,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
    
  ),
  
  
  # all_full_2notempondev = c(
  #   clutch_size ~ weight,
  #   clutch_size ~ devo_mode,
  #   
  #   devo_mode ~ weight,
  #   
  #   res_egg_mass ~ devo_mode,
  #   res_egg_mass ~ clutch_size,
  #   time_fed ~ res_egg_mass,
  #   
  #   #brain_log ~ devo_mode,
  #   brain_log ~ time_fed,
  #   brain_log ~ res_egg_mass,
  #   brain_log ~ clutch_size,
  #   
  #   time_fed ~ weight,
  #   res_egg_mass ~ weight,
  #   #weight ~ time_fed,
  #   #weight ~ res_egg_mass,
  #   
  #   
  #   brain_log ~ move_max,
  #   brain_log ~ foraging_3,
  #   brain_log ~ food_energy,
  #   brain_log ~ food_h_level,
  #   brain_log ~ fibres,
  #   brain_log ~ insularity,
  #   #brain_log ~ social_bonds,
  #   #brain_log ~ grouping,
  #   
  #   foraging_3 ~ insularity,
  #   
  #   weight ~ fibres,
  #   weight ~ food_energy,
  #   
  #   
  #   insularity ~ devo_mode,
  #   res_egg_mass ~ insularity,
  #   time_fed ~ insularity,
  #   # res_egg_mass ~ temp_range,
  #   time_fed ~ temp_range,
  #   # clutch_size ~ temp_range,
  #   
  #   clutch_size ~ food_energy,
  #   res_egg_mass ~ food_energy,
  #   clutch_size ~ foraging_3,
  #   res_egg_mass ~ foraging_3
  #   # food_energy ~ clutch_size + res_egg_mass,
  #   # foraging_3 ~ clutch_size + res_egg_mass
  # ),
  
  
  # FULL MODEL all conn ----
  all_full_1notemp = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain_log ~ devo_mode,
    brain_log ~ time_fed,
    brain_log ~ res_egg_mass,
    brain_log ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC,
    
    
    # insularity ~ devo_mode,
    move_max ~ devo_mode,
    res_egg_mass ~ insularity,
    time_fed ~ insularity,
    # res_egg_mass ~ temp_range,
    # time_fed ~ temp_range,
    # clutch_size ~ temp_range,
    
    clutch_size ~ food_energy_RC,
    res_egg_mass ~ food_energy_RC,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
    
  ),
  
  
  # all_full_2notemp = c(
  #   clutch_size ~ weight,
  #   clutch_size ~ devo_mode,
  #   
  #   devo_mode ~ weight,
  #   
  #   res_egg_mass ~ devo_mode,
  #   res_egg_mass ~ clutch_size,
  #   time_fed ~ res_egg_mass,
  #   
  #   #brain_log ~ devo_mode,
  #   brain_log ~ time_fed,
  #   brain_log ~ res_egg_mass,
  #   brain_log ~ clutch_size,
  #   
  #   time_fed ~ weight,
  #   res_egg_mass ~ weight,
  #   #weight ~ time_fed,
  #   #weight ~ res_egg_mass,
  #   
  #   
  #   brain_log ~ move_max,
  #   brain_log ~ foraging_3,
  #   brain_log ~ food_energy,
  #   brain_log ~ food_h_level,
  #   brain_log ~ fibres,
  #   brain_log ~ insularity,
  #   #brain_log ~ social_bonds,
  #   #brain_log ~ grouping,
  #   
  #   foraging_3 ~ insularity,
  #   
  #   weight ~ fibres,
  #   weight ~ food_energy,
  #   
  #   
  #   insularity ~ devo_mode,
  #   res_egg_mass ~ insularity,
  #   time_fed ~ insularity,
  #   # res_egg_mass ~ temp_range,
  #   # time_fed ~ temp_range,
  #   # clutch_size ~ temp_range,
  #   
  #   clutch_size ~ food_energy,
  #   res_egg_mass ~ food_energy,
  #   clutch_size ~ foraging_3,
  #   res_egg_mass ~ foraging_3
  #   # food_energy ~ clutch_size + res_egg_mass,
  #   # foraging_3 ~ clutch_size + res_egg_mass
  # ),
  
  
  # FULL MODEL all conn ----
  all_full_1nothingondev = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain_log ~ devo_mode,
    brain_log ~ time_fed,
    brain_log ~ res_egg_mass,
    brain_log ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC,
    
    
    # insularity ~ devo_mode,
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
  
  
  # all_full_2nothinondev = c(
  #   clutch_size ~ weight,
  #   clutch_size ~ devo_mode,
  #   
  #   devo_mode ~ weight,
  #   
  #   res_egg_mass ~ devo_mode,
  #   res_egg_mass ~ clutch_size,
  #   time_fed ~ res_egg_mass,
  #   
  #   #brain_log ~ devo_mode,
  #   brain_log ~ time_fed,
  #   brain_log ~ res_egg_mass,
  #   brain_log ~ clutch_size,
  #   
  #   time_fed ~ weight,
  #   res_egg_mass ~ weight,
  #   #weight ~ time_fed,
  #   #weight ~ res_egg_mass,
  #   
  #   
  #   brain_log ~ move_max,
  #   brain_log ~ foraging_3,
  #   brain_log ~ food_energy,
  #   brain_log ~ food_h_level,
  #   brain_log ~ fibres,
  #   brain_log ~ insularity,
  #   #brain_log ~ social_bonds,
  #   #brain_log ~ grouping,
  #   
  #   foraging_3 ~ insularity,
  #   
  #   weight ~ fibres,
  #   weight ~ food_energy,
  #   
  #   
  #   # insularity ~ devo_mode,
  #   # res_egg_mass ~ insularity,
  #   time_fed ~ insularity,
  #   # res_egg_mass ~ temp_range,
  #   time_fed ~ temp_range
  #   # clutch_size ~ temp_range,
  #   
  #   # clutch_size ~ food_energy,
  #   # res_egg_mass ~ food_energy,
  #   # clutch_size ~ foraging_3,
  #   # res_egg_mass ~ foraging_3
  #   # food_energy ~ clutch_size + res_egg_mass,
  #   # foraging_3 ~ clutch_size + res_egg_mass
  # ),
  
  
  
  # FULL MODEL all conn ----
  all_full_1nothingonfed = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #brain_log ~ devo_mode,
    brain_log ~ time_fed,
    brain_log ~ res_egg_mass,
    brain_log ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight,
    #weight ~ time_fed,
    #weight ~ res_egg_mass,
    
    
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC,
    
    
    # insularity ~ devo_mode,
    move_max ~ devo_mode,
    res_egg_mass ~ insularity,
    # time_fed ~ insularity,
    res_egg_mass ~ temp_range,
    time_fed ~ temp_range,
    # clutch_size ~ temp_range,
    
    clutch_size ~ food_energy_RC,
    res_egg_mass ~ food_energy_RC,
    clutch_size ~ foraging_3,
    res_egg_mass ~ foraging_3
    # food_energy ~ clutch_size + res_egg_mass,
    # foraging_3 ~ clutch_size + res_egg_mass
    
  ),
  
  
  # all_full_2nothingonfed = c(
  #   clutch_size ~ weight,
  #   clutch_size ~ devo_mode,
  #   
  #   devo_mode ~ weight,
  #   
  #   res_egg_mass ~ devo_mode,
  #   res_egg_mass ~ clutch_size,
  #   time_fed ~ res_egg_mass,
  #   
  #   #brain_log ~ devo_mode,
  #   brain_log ~ time_fed,
  #   brain_log ~ res_egg_mass,
  #   brain_log ~ clutch_size,
  #   
  #   time_fed ~ weight,
  #   res_egg_mass ~ weight,
  #   #weight ~ time_fed,
  #   #weight ~ res_egg_mass,
  #   
  #   
  #   brain_log ~ move_max,
  #   brain_log ~ foraging_3,
  #   brain_log ~ food_energy,
  #   brain_log ~ food_h_level,
  #   brain_log ~ fibres,
  #   brain_log ~ insularity,
  #   #brain_log ~ social_bonds,
  #   #brain_log ~ grouping,
  #   
  #   foraging_3 ~ insularity,
  #   
  #   weight ~ fibres,
  #   weight ~ food_energy,
  #   
  #   
  #   insularity ~ devo_mode,
  #   res_egg_mass ~ insularity,
  #   # time_fed ~ insularity,
  #   res_egg_mass ~ temp_range,
  #   # time_fed ~ temp_range,
  #   clutch_size ~ temp_range,
  #   
  #   clutch_size ~ food_energy,
  #   res_egg_mass ~ food_energy,
  #   clutch_size ~ foraging_3,
  #   res_egg_mass ~ foraging_3
  #   # food_energy ~ clutch_size + res_egg_mass,
  #   # foraging_3 ~ clutch_size + res_egg_mass
  # ),
  
  # COMMON PATHS ----
  .common = c(
    brain_log ~ weight,
    move_max ~ insularity + temp_range,
    weight ~ insularity + temp_range,
    food_energy_RC ~ temp_range + food_h_level_nofibres_RC,
    foraging_3 ~ food_energy_RC,
    grouping ~ social_bonds,
    clutch_size ~ devo_mode + insularity,
    time_fed ~ devo_mode + food_energy_RC + food_h_level_nofibres_RC
    
  )
)

