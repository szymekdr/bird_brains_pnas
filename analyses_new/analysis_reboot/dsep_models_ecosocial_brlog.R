m_es <- phylopath::define_model_set(
  
  # FULL MODEL ----
  es_full = c(
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL - NOFOOD ----
  es_nofood = c(
    brain_log ~ move_max,
    #brain_log ~ foraging_3,
    #brain_log ~ food_energy_RC,
    #brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOSOCIAL ----
  es_full_nosocial = c(
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    #brain_log ~ social_bonds,
    #brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOECOLOGY ----
  es_full_noecology = c(
    #brain_log ~ move_max,
    #brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    #brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL ONLY SOCIAL ----
  es_full_social = c(
    # brain_log ~ move_max,
    # brain_log ~ foraging_3,
    # brain_log ~ food_energy_RC,
    # brain_log ~ food_h_level_nofibres_RC,
    # brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  
  # FULL MODEL ONLY ECOLOGY ----
  es_full_eco = c(
    brain_log ~ move_max,
    # brain_log ~ foraging_3,
    # brain_log ~ food_energy_RC,
    # brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    # brain_log ~ social_bonds,
    # brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  
  # FULL MODEL ONLY FOOD ----
  es_full_food = c(
    # brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    # brain_log ~ insularity,
    # brain_log ~ social_bonds,
    # brain_log ~ grouping,
    
    foraging_3 ~ insularity,

    weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  
  # FULL MODEL NOFIBRES ----
  es_full_nofib = c(
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL - NOFOOD NOFIBRES ----
  es_nofood_nofib = c(
    brain_log ~ move_max,
    #brain_log ~ foraging_3,
    #brain_log ~ food_energy_RC,
    #brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOSOCIAL NO FIBRES ----
  es_full_nosocial_nofib = c(
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    #brain_log ~ social_bonds,
    #brain_log ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOECOLOGY NO FIBRES ----
  es_full_noecology_nofib = c(
    #brain_log ~ move_max,
    #brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    #brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL ONLY SOCIAL NO FIBRES ----
  es_full_social_nofib = c(
    # brain_log ~ move_max,
    # brain_log ~ foraging_3,
    # brain_log ~ food_energy_RC,
    # brain_log ~ food_h_level_nofibres_RC,
    # brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  
  # FULL MODEL ONLY ECOLOGY ----
  es_full_eco_nofib = c(
    brain_log ~ move_max,
    # brain_log ~ foraging_3,
    # brain_log ~ food_energy_RC,
    # brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    # brain_log ~ social_bonds,
    # brain_log ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  
  # FULL MODEL ONLY FOOD ----
  es_full_food_nofib = c(
    # brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    # brain_log ~ insularity,
    # brain_log ~ social_bonds,
    # brain_log ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  
  
  # FULL MODEL NO F-I ----
  es_full_nofi = c(
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    #foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL - NOFOOD NO F-I ----
  es_nofood_nofi = c(
    brain_log ~ move_max,
    #brain_log ~ foraging_3,
    #brain_log ~ food_energy_RC,
    #brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    #foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOSOCIAL NO F-I ----
  es_full_nosocial_nofi = c(
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    #brain_log ~ social_bonds,
    #brain_log ~ grouping,
    
    # foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOECOLOGY NO F-I ----
  es_full_noecology_nofi = c(
    #brain_log ~ move_max,
    #brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    #brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    #foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL ONLY SOCIAL NO F-I ----
  es_full_social_nofi = c(
    # brain_log ~ move_max,
    # brain_log ~ foraging_3,
    # brain_log ~ food_energy_RC,
    # brain_log ~ food_h_level_nofibres_RC,
    # brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    # foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  
  # FULL MODEL ONLY ECOLOGY NO F-I ----
  es_full_eco_nofi = c(
    brain_log ~ move_max,
    # brain_log ~ foraging_3,
    # brain_log ~ food_energy_RC,
    # brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    # brain_log ~ social_bonds,
    # brain_log ~ grouping,
    
    # foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  
  # FULL MODEL ONLY FOOD NO F-I ----
  es_full_food_nofi = c(
    # brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    # brain_log ~ insularity,
    # brain_log ~ social_bonds,
    # brain_log ~ grouping,
    
    # foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  
  
  
  # FULL MODEL 2 ----
  es_full2 = c(
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL - NOFOOD 2 ----
  es_nofood2 = c(
    brain_log ~ move_max,
    #brain_log ~ foraging_3,
    #brain_log ~ food_energy_RC,
    #brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOSOCIAL 2 ----
  es_full_nosocial2 = c(
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity
    #brain_log ~ social_bonds,
    #brain_log ~ grouping,
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL NOECOLOGY 2 ----
  es_full_noecology2 = c(
    #brain_log ~ move_max,
    #brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    #brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  # FULL MODEL ONLY SOCIAL 2 ----
  es_full_social2 = c(
    # brain_log ~ move_max,
    # brain_log ~ foraging_3,
    # brain_log ~ food_energy_RC,
    # brain_log ~ food_h_level_nofibres_RC,
    # brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  
  # FULL MODEL ONLY ECOLOGY 2----
  es_full_eco2 = c(
    brain_log ~ move_max,
    # brain_log ~ foraging_3,
    # brain_log ~ food_energy_RC,
    # brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity
    # brain_log ~ social_bonds,
    # brain_log ~ grouping,
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  
  # FULL MODEL ONLY FOOD 2 ----
  es_full_food2 = c(
    # brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC
    # brain_log ~ insularity,
    # brain_log ~ social_bonds,
    # brain_log ~ grouping,
    
    # foraging_3 ~ insularity,
    
    # weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  
  
  
  # FULL MODEL EN-W ----
  es_full_enw = c(
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
  
  # FULL - NOFOOD E-W ----
  es_nofood_enw = c(
    brain_log ~ move_max,
    #brain_log ~ foraging_3,
    #brain_log ~ food_energy_RC,
    #brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  # FULL MODEL NOSOCIAL E-W ----
  es_full_nosocial_enw = c(
    brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    brain_log ~ insularity,
    #brain_log ~ social_bonds,
    #brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  # FULL MODEL NOECOLOGY E-W ----
  es_full_noecology_enw = c(
    #brain_log ~ move_max,
    #brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    #brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  # FULL MODEL ONLY SOCIAL_E-W ----
  es_full_social_enw = c(
    # brain_log ~ move_max,
    # brain_log ~ foraging_3,
    # brain_log ~ food_energy_RC,
    # brain_log ~ food_h_level_nofibres_RC,
    # brain_log ~ fibres,
    # brain_log ~ insularity,
    brain_log ~ social_bonds,
    brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  
  # FULL MODEL ONLY ECOLOGY E-W ----
  es_full_eco_enw = c(
    brain_log ~ move_max,
    # brain_log ~ foraging_3,
    # brain_log ~ food_energy_RC,
    # brain_log ~ food_h_level_nofibres_RC,
    # brain_log ~ fibres,
    brain_log ~ insularity,
    # brain_log ~ social_bonds,
    # brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  
  # FULL MODEL ONLY FOOD E-W ----
  es_full_food_enw = c(
    # brain_log ~ move_max,
    brain_log ~ foraging_3,
    brain_log ~ food_energy_RC,
    brain_log ~ food_h_level_nofibres_RC,
    # brain_log ~ insularity,
    # brain_log ~ social_bonds,
    # brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC,
    weight ~ food_energy_RC
  ),
  
  
  
  
  # NULL MODEL1 ----
  es_null1 = c(
    # brain_log ~ move_max,
    # brain_log ~ foraging_3,
    # brain_log ~ food_energy_RC,
    # brain_log ~ food_h_level_nofibres_RC,
    # brain_log ~ fibres,
    # brain_log ~ insularity,
    # brain_log ~ social_bonds,
    # brain_log ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  # NULL MODEL2 ----
  es_null1 = c(
    # brain_log ~ move_max,
    # brain_log ~ foraging_3,
    # brain_log ~ food_energy_RC,
    # brain_log ~ food_h_level_nofibres_RC,
    # brain_log ~ fibres,
    # brain_log ~ insularity,
    # brain_log ~ social_bonds,
    # brain_log ~ grouping,
    
    # foraging_3 ~ insularity,
    # 
    # weight ~ food_h_level_nofibres_RC
  ),
  
  
  
  
  # COMMON PATHS ----
  .common = c(
    brain_log ~ weight,
    move_max ~ insularity + temp_range,
    weight ~ insularity + temp_range,
    food_energy_RC ~ temp_range + food_h_level_nofibres_RC,
    foraging_3 ~ food_energy_RC,
    grouping ~ social_bonds
  )
)
