m_es <- phylopath::define_model_set(
  
  # FULL MODEL ----
  es_full = c(
    res_brain ~ move_max,
    res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL - NOFOOD ----
  es_nofood = c(
    res_brain ~ move_max,
    #res_brain ~ foraging_3,
    #res_brain ~ food_energy_RC,
    #res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOSOCIAL ----
  es_full_nosocial = c(
    res_brain ~ move_max,
    res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    #res_brain ~ social_bonds,
    #res_brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOECOLOGY ----
  es_full_noecology = c(
    #res_brain ~ move_max,
    #res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    #res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL ONLY SOCIAL ----
  es_full_social = c(
    # res_brain ~ move_max,
    # res_brain ~ foraging_3,
    # res_brain ~ food_energy_RC,
    # res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  
  # FULL MODEL ONLY ECOLOGY ----
  es_full_eco = c(
    res_brain ~ move_max,
    # res_brain ~ foraging_3,
    # res_brain ~ food_energy_RC,
    # res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    # res_brain ~ social_bonds,
    # res_brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  
  # FULL MODEL ONLY FOOD ----
  es_full_food = c(
    # res_brain ~ move_max,
    res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ insularity,
    # res_brain ~ social_bonds,
    # res_brain ~ grouping,
    
    foraging_3 ~ insularity,

    weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  
  # FULL MODEL NOFIBRES ----
  es_full_nofib = c(
    res_brain ~ move_max,
    res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL - NOFOOD NOFIBRES ----
  es_nofood_nofib = c(
    res_brain ~ move_max,
    #res_brain ~ foraging_3,
    #res_brain ~ food_energy_RC,
    #res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOSOCIAL NO FIBRES ----
  es_full_nosocial_nofib = c(
    res_brain ~ move_max,
    res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    #res_brain ~ social_bonds,
    #res_brain ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOECOLOGY NO FIBRES ----
  es_full_noecology_nofib = c(
    #res_brain ~ move_max,
    #res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    #res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL ONLY SOCIAL NO FIBRES ----
  es_full_social_nofib = c(
    # res_brain ~ move_max,
    # res_brain ~ foraging_3,
    # res_brain ~ food_energy_RC,
    # res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  
  # FULL MODEL ONLY ECOLOGY ----
  es_full_eco_nofib = c(
    res_brain ~ move_max,
    # res_brain ~ foraging_3,
    # res_brain ~ food_energy_RC,
    # res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    # res_brain ~ social_bonds,
    # res_brain ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  
  # FULL MODEL ONLY FOOD ----
  es_full_food_nofib = c(
    # res_brain ~ move_max,
    res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ insularity,
    # res_brain ~ social_bonds,
    # res_brain ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  
  
  # FULL MODEL NO F-I ----
  es_full_nofi = c(
    res_brain ~ move_max,
    res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping,
    
    #foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL - NOFOOD NO F-I ----
  es_nofood_nofi = c(
    res_brain ~ move_max,
    #res_brain ~ foraging_3,
    #res_brain ~ food_energy_RC,
    #res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping,
    
    #foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOSOCIAL NO F-I ----
  es_full_nosocial_nofi = c(
    res_brain ~ move_max,
    res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    #res_brain ~ social_bonds,
    #res_brain ~ grouping,
    
    # foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOECOLOGY NO F-I ----
  es_full_noecology_nofi = c(
    #res_brain ~ move_max,
    #res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    #res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping,
    
    #foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL ONLY SOCIAL NO F-I ----
  es_full_social_nofi = c(
    # res_brain ~ move_max,
    # res_brain ~ foraging_3,
    # res_brain ~ food_energy_RC,
    # res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping,
    
    # foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  
  # FULL MODEL ONLY ECOLOGY NO F-I ----
  es_full_eco_nofi = c(
    res_brain ~ move_max,
    # res_brain ~ foraging_3,
    # res_brain ~ food_energy_RC,
    # res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    # res_brain ~ social_bonds,
    # res_brain ~ grouping,
    
    # foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  
  # FULL MODEL ONLY FOOD NO F-I ----
  es_full_food_nofi = c(
    # res_brain ~ move_max,
    res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ insularity,
    # res_brain ~ social_bonds,
    # res_brain ~ grouping,
    
    # foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  
  
  
  # FULL MODEL 2 ----
  es_full2 = c(
    res_brain ~ move_max,
    res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL - NOFOOD 2 ----
  es_nofood2 = c(
    res_brain ~ move_max,
    #res_brain ~ foraging_3,
    #res_brain ~ food_energy_RC,
    #res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOSOCIAL 2 ----
  es_full_nosocial2 = c(
    res_brain ~ move_max,
    res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity
    #res_brain ~ social_bonds,
    #res_brain ~ grouping,
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOECOLOGY 2 ----
  es_full_noecology2 = c(
    #res_brain ~ move_max,
    #res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    #res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL ONLY SOCIAL 2 ----
  es_full_social2 = c(
    # res_brain ~ move_max,
    # res_brain ~ foraging_3,
    # res_brain ~ food_energy_RC,
    # res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  
  # FULL MODEL ONLY ECOLOGY 2----
  es_full_eco2 = c(
    res_brain ~ move_max,
    # res_brain ~ foraging_3,
    # res_brain ~ food_energy_RC,
    # res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity
    # res_brain ~ social_bonds,
    # res_brain ~ grouping,
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  
  # FULL MODEL ONLY FOOD 2 ----
  es_full_food2 = c(
    # res_brain ~ move_max,
    res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC
    # res_brain ~ insularity,
    # res_brain ~ social_bonds,
    # res_brain ~ grouping,
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  
  
  
  # FULL MODEL EN-W ----
  es_full_enw = c(
    res_brain ~ move_max,
    res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  # FULL - NOFOOD E-W ----
  es_nofood_enw = c(
    res_brain ~ move_max,
    #res_brain ~ foraging_3,
    #res_brain ~ food_energy_RC,
    #res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  # FULL MODEL NOSOCIAL E-W ----
  es_full_nosocial_enw = c(
    res_brain ~ move_max,
    res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    #res_brain ~ social_bonds,
    #res_brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  # FULL MODEL NOECOLOGY E-W ----
  es_full_noecology_enw = c(
    #res_brain ~ move_max,
    #res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    #res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  # FULL MODEL ONLY SOCIAL_E-W ----
  es_full_social_enw = c(
    # res_brain ~ move_max,
    # res_brain ~ foraging_3,
    # res_brain ~ food_energy_RC,
    # res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ fibres,
    # res_brain ~ insularity,
    res_brain ~ social_bonds,
    res_brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  
  # FULL MODEL ONLY ECOLOGY E-W ----
  es_full_eco_enw = c(
    res_brain ~ move_max,
    # res_brain ~ foraging_3,
    # res_brain ~ food_energy_RC,
    # res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ fibres,
    res_brain ~ insularity,
    # res_brain ~ social_bonds,
    # res_brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  
  # FULL MODEL ONLY FOOD E-W ----
  es_full_food_enw = c(
    # res_brain ~ move_max,
    res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ insularity,
    # res_brain ~ social_bonds,
    # res_brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  
  
  
  # NULL MODEL1 ----
  es_null1 = c(
    # res_brain ~ move_max,
    # res_brain ~ foraging_3,
    # res_brain ~ food_energy_RC,
    # res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ fibres,
    # res_brain ~ insularity,
    # res_brain ~ social_bonds,
    # res_brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  # NULL MODEL2 ----
  es_null1 = c(
    # res_brain ~ move_max,
    # res_brain ~ foraging_3,
    # res_brain ~ food_energy_RC,
    # res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ fibres,
    # res_brain ~ insularity,
    # res_brain ~ social_bonds,
    # res_brain ~ grouping,
    
    # foraging_3 ~ insularity,
    # 
    # weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  # FULL MODEL ----
  es_full_rev = c(
    res_brain ~ move_max,
    foraging_3 ~ res_brain, 
    food_energy_RC ~ res_brain,
    res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    social_bonds ~ res_brain,
    grouping ~ res_brain,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL - NOFOOD ----
  es_nofood_rev = c(
    res_brain ~ move_max,
    #res_brain ~ foraging_3,
    #res_brain ~ food_energy_RC,
    #res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    social_bonds ~ res_brain,
    grouping ~ res_brain,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  # FULL MODEL ONLY SOCIAL ----
  es_full_social_rev = c(
    # res_brain ~ move_max,
    # res_brain ~ foraging_3,
    # res_brain ~ food_energy_RC,
    # res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ insularity,
    social_bonds ~ res_brain,
    grouping ~ res_brain,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  
  # FULL MODEL NOECOLOGY NO FIBRES ----
  es_full_noecology_nofib_rev = c(
    #res_brain ~ move_max,
    #res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    #res_brain ~ insularity,
    social_bonds ~ res_brain,
    grouping ~ res_brain,
    
    foraging_3 ~ insularity
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  # FULL - NOFOOD NO F-I ----
  es_nofood_nofi_rev = c(
    res_brain ~ move_max,
    #res_brain ~ foraging_3,
    #res_brain ~ food_energy_RC,
    #res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    social_bonds ~ res_brain,
    grouping ~ res_brain,
    
    #foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  # FULL MODEL ONLY SOCIAL NO F-I ----
  es_full_social_nofi_rev = c(
    # res_brain ~ move_max,
    # res_brain ~ foraging_3,
    # res_brain ~ food_energy_RC,
    # res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ insularity,
    social_bonds ~ res_brain,
    grouping ~ res_brain,
    
    # foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  
  
  # FULL MODEL ONLY FOOD NO F-I ----
  es_full_food_nofi_rev = c(
    # res_brain ~ move_max,
    foraging_3 ~ res_brain, 
    food_energy_RC ~ res_brain,
    res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ insularity,
    # res_brain ~ social_bonds,
    # res_brain ~ grouping,
    
    # foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  
  
  
  # FULL MODEL 2 ----
  es_full2_rev = c(
    res_brain ~ move_max,
    res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    social_bonds ~ res_brain,
    grouping ~ res_brain
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL - NOFOOD 2 ----
  es_nofood2_rev = c(
    res_brain ~ move_max,
    #res_brain ~ foraging_3,
    #res_brain ~ food_energy_RC,
    #res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    social_bonds ~ res_brain,
    grouping ~ res_brain
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOSOCIAL 2 ----
  es_full_nosocial2_rev = c(
    res_brain ~ move_max,
    foraging_3 ~ res_brain, 
    food_energy_RC ~ res_brain,
    res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity
    #res_brain ~ social_bonds,
    #res_brain ~ grouping,
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOECOLOGY 2 ----
  es_full_noecology2_rev = c(
    #res_brain ~ move_max,
    #res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    #res_brain ~ insularity,
    social_bonds ~ res_brain,
    grouping ~ res_brain
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL ONLY SOCIAL 2 ----
  es_full_social2_rev = c(
    # res_brain ~ move_max,
    # res_brain ~ foraging_3,
    # res_brain ~ food_energy_RC,
    # res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ insularity,
    social_bonds ~ res_brain,
    grouping ~ res_brain
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  
  # FULL MODEL ONLY FOOD 2 ----
  es_full_food2_rev = c(
    # res_brain ~ move_max,
    foraging_3 ~ res_brain, 
    food_energy_RC ~ res_brain,
    res_brain ~ food_h_level_nofibres_RC
    # res_brain ~ insularity,
    # res_brain ~ social_bonds,
    # res_brain ~ grouping,
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  
  
  
  # FULL MODEL EN-W ----
  es_full_enw_rev = c(
    res_brain ~ move_max,
    res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    social_bonds ~ res_brain,
    grouping ~ res_brain,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  # FULL - NOFOOD E-W ----
  es_nofood_enw_rev = c(
    res_brain ~ move_max,
    #res_brain ~ foraging_3,
    #res_brain ~ food_energy_RC,
    #res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    social_bonds ~ res_brain,
    grouping ~ res_brain,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  # FULL MODEL NOSOCIAL E-W ----
  es_full_nosocial_enw_rev = c(
    res_brain ~ move_max,
    foraging_3 ~ res_brain, 
    food_energy_RC ~ res_brain,
    res_brain ~ food_h_level_nofibres_RC,
    res_brain ~ insularity,
    #res_brain ~ social_bonds,
    #res_brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
    # weight ~ food_energy_RC
  ),
  
  # FULL MODEL NOECOLOGY E-W ----
  es_full_noecology_enw_rev = c(
    #res_brain ~ move_max,
    #res_brain ~ foraging_3,
    res_brain ~ food_energy_RC,
    res_brain ~ food_h_level_nofibres_RC,
    #res_brain ~ insularity,
    social_bonds ~ res_brain,
    grouping ~ res_brain,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  # FULL MODEL ONLY SOCIAL_E-W ----
  es_full_social_enw_rev = c(
    # res_brain ~ move_max,
    # res_brain ~ foraging_3,
    # res_brain ~ food_energy_RC,
    # res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ fibres,
    # res_brain ~ insularity,
    social_bonds ~ res_brain,
    grouping ~ res_brain,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  
  
  
  
  # FULL MODEL ONLY FOOD E-W ----
  es_full_food_enw_rev = c(
    # res_brain ~ move_max,
    foraging_3 ~ res_brain, 
    food_energy_RC ~ res_brain,
    res_brain ~ food_h_level_nofibres_RC,
    # res_brain ~ insularity,
    # res_brain ~ social_bonds,
    # res_brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
    # weight ~ food_energy_RC
  ),
  
  
  
  
  # COMMON PATHS ----
  .common = c(
    res_brain ~ weight,
    move_max ~ insularity + temp_range,
    weight ~ insularity + temp_range,
    food_energy_RC ~ temp_range + food_h_level_nofibres_RC,
    foraging_3 ~ food_energy_RC,
    grouping ~ social_bonds
  )
)
