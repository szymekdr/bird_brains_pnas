m_es <- phylopath::define_model_set(
  
  # FULL MODEL ----
  es_full = c(
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres
  ),
  
  # FULL - NOFOOD ----
  es_nofood = c(
    brain ~ move_max,
    #brain ~ foraging_3,
    #brain ~ food_energy,
    #brain ~ food_h_level,
    #brain ~ fibres,
    brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres
  ),
  
  # FULL MODEL NOSOCIAL ----
  es_full_nosocial = c(
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    brain ~ insularity,
    #brain ~ social_bonds,
    #brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres
  ),
  
  # FULL MODEL NOECOLOGY ----
  es_full_noecology = c(
    #brain ~ move_max,
    #brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    #brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres
  ),
  
  # FULL MODEL ONLY SOCIAL ----
  es_full_social = c(
    # brain ~ move_max,
    # brain ~ foraging_3,
    # brain ~ food_energy,
    # brain ~ food_h_level,
    # brain ~ fibres,
    # brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres
  ),
  
  
  # FULL MODEL ONLY ECOLOGY ----
  es_full_eco = c(
    brain ~ move_max,
    # brain ~ foraging_3,
    # brain ~ food_energy,
    # brain ~ food_h_level,
    # brain ~ fibres,
    brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres
  ),
  
  
  # FULL MODEL ONLY FOOD ----
  es_full_food = c(
    # brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    # brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    foraging_3 ~ insularity,

    weight ~ fibres
  ),
  
  
  
  
  # FULL MODEL NOFIBRES ----
  es_full_nofib = c(
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    # brain ~ fibres,
    brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ fibres
  ),
  
  # FULL - NOFOOD NOFIBRES ----
  es_nofood_nofib = c(
    brain ~ move_max,
    #brain ~ foraging_3,
    #brain ~ food_energy,
    #brain ~ food_h_level,
    #brain ~ fibres,
    brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ fibres
  ),
  
  # FULL MODEL NOSOCIAL NO FIBRES ----
  es_full_nosocial_nofib = c(
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    # brain ~ fibres,
    brain ~ insularity,
    #brain ~ social_bonds,
    #brain ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ fibres
  ),
  
  # FULL MODEL NOECOLOGY NO FIBRES ----
  es_full_noecology_nofib = c(
    #brain ~ move_max,
    #brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    #brain ~ fibres,
    #brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ fibres
  ),
  
  # FULL MODEL ONLY SOCIAL NO FIBRES ----
  es_full_social_nofib = c(
    # brain ~ move_max,
    # brain ~ foraging_3,
    # brain ~ food_energy,
    # brain ~ food_h_level,
    # brain ~ fibres,
    # brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ fibres
  ),
  
  
  # FULL MODEL ONLY ECOLOGY ----
  es_full_eco_nofib = c(
    brain ~ move_max,
    # brain ~ foraging_3,
    # brain ~ food_energy,
    # brain ~ food_h_level,
    # brain ~ fibres,
    brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ fibres
  ),
  
  
  # FULL MODEL ONLY FOOD ----
  es_full_food_nofib = c(
    # brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    # brain ~ fibres,
    # brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    foraging_3 ~ insularity
    
    # weight ~ fibres
  ),
  
  
  
  
  
  # FULL MODEL NO F-I ----
  es_full_nofi = c(
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping,
    
    #foraging_3 ~ insularity,
    
    weight ~ fibres
  ),
  
  # FULL - NOFOOD NO F-I ----
  es_nofood_nofi = c(
    brain ~ move_max,
    #brain ~ foraging_3,
    #brain ~ food_energy,
    #brain ~ food_h_level,
    #brain ~ fibres,
    brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping,
    
    #foraging_3 ~ insularity,
    
    weight ~ fibres
  ),
  
  # FULL MODEL NOSOCIAL NO F-I ----
  es_full_nosocial_nofi = c(
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    brain ~ insularity,
    #brain ~ social_bonds,
    #brain ~ grouping,
    
    # foraging_3 ~ insularity,
    
    weight ~ fibres
  ),
  
  # FULL MODEL NOECOLOGY NO F-I ----
  es_full_noecology_nofi = c(
    #brain ~ move_max,
    #brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    #brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping,
    
    #foraging_3 ~ insularity,
    
    weight ~ fibres
  ),
  
  # FULL MODEL ONLY SOCIAL NO F-I ----
  es_full_social_nofi = c(
    # brain ~ move_max,
    # brain ~ foraging_3,
    # brain ~ food_energy,
    # brain ~ food_h_level,
    # brain ~ fibres,
    # brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping,
    
    # foraging_3 ~ insularity,
    
    weight ~ fibres
  ),
  
  
  # FULL MODEL ONLY ECOLOGY NO F-I ----
  es_full_eco_nofi = c(
    brain ~ move_max,
    # brain ~ foraging_3,
    # brain ~ food_energy,
    # brain ~ food_h_level,
    # brain ~ fibres,
    brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    # foraging_3 ~ insularity,
    
    weight ~ fibres
  ),
  
  
  # FULL MODEL ONLY FOOD NO F-I ----
  es_full_food_nofi = c(
    # brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    # brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    # foraging_3 ~ insularity,
    
    weight ~ fibres
  ),
  
  
  
  
  
  
  # FULL MODEL 2 ----
  es_full2 = c(
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    # brain ~ fibres,
    brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping
    
    # foraging_3 ~ insularity,
    
    # weight ~ fibres
  ),
  
  # FULL - NOFOOD 2 ----
  es_nofood2 = c(
    brain ~ move_max,
    #brain ~ foraging_3,
    #brain ~ food_energy,
    #brain ~ food_h_level,
    #brain ~ fibres,
    brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping
    
    # foraging_3 ~ insularity,
    
    # weight ~ fibres
  ),
  
  # FULL MODEL NOSOCIAL 2 ----
  es_full_nosocial2 = c(
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    # brain ~ fibres,
    brain ~ insularity
    #brain ~ social_bonds,
    #brain ~ grouping,
    
    # foraging_3 ~ insularity,
    
    # weight ~ fibres
  ),
  
  # FULL MODEL NOECOLOGY 2 ----
  es_full_noecology2 = c(
    #brain ~ move_max,
    #brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    # brain ~ fibres,
    #brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping
    
    # foraging_3 ~ insularity,
    
    # weight ~ fibres
  ),
  
  # FULL MODEL ONLY SOCIAL 2 ----
  es_full_social2 = c(
    # brain ~ move_max,
    # brain ~ foraging_3,
    # brain ~ food_energy,
    # brain ~ food_h_level,
    # brain ~ fibres,
    # brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping
    
    # foraging_3 ~ insularity,
    
    # weight ~ fibres
  ),
  
  
  # FULL MODEL ONLY ECOLOGY 2----
  es_full_eco2 = c(
    brain ~ move_max,
    # brain ~ foraging_3,
    # brain ~ food_energy,
    # brain ~ food_h_level,
    # brain ~ fibres,
    brain ~ insularity
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    # foraging_3 ~ insularity,
    
    # weight ~ fibres
  ),
  
  
  # FULL MODEL ONLY FOOD 2 ----
  es_full_food2 = c(
    # brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level
    # brain ~ fibres,
    # brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    # foraging_3 ~ insularity,
    
    # weight ~ fibres
  ),
  
  
  
  
  
  
  # FULL MODEL EN-W ----
  es_full_enw = c(
    brain ~ move_max,
    brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy
  ),
  
  # FULL - NOFOOD E-W ----
  es_nofood_enw = c(
    brain ~ move_max,
    #brain ~ foraging_3,
    #brain ~ food_energy,
    #brain ~ food_h_level,
    #brain ~ fibres,
    brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy
  ),
  
  # FULL MODEL NOSOCIAL E-W ----
  es_full_nosocial_enw = c(
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
  
  # FULL MODEL NOECOLOGY E-W ----
  es_full_noecology_enw = c(
    #brain ~ move_max,
    #brain ~ foraging_3,
    brain ~ food_energy,
    brain ~ food_h_level,
    brain ~ fibres,
    #brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy
  ),
  
  # FULL MODEL ONLY SOCIAL_E-W ----
  es_full_social_enw = c(
    # brain ~ move_max,
    # brain ~ foraging_3,
    # brain ~ food_energy,
    # brain ~ food_h_level,
    # brain ~ fibres,
    # brain ~ insularity,
    brain ~ social_bonds,
    brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy
  ),
  
  
  # FULL MODEL ONLY ECOLOGY E-W ----
  es_full_eco_enw = c(
    brain ~ move_max,
    # brain ~ foraging_3,
    # brain ~ food_energy,
    # brain ~ food_h_level,
    # brain ~ fibres,
    brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres,
    weight ~ food_energy
  ),
  
  
  # FULL MODEL ONLY FOOD E-W ----
  es_full_food_enw = c(
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
  
  
  
  
  # NULL MODEL1 ----
  es_null1 = c(
    # brain ~ move_max,
    # brain ~ foraging_3,
    # brain ~ food_energy,
    # brain ~ food_h_level,
    # brain ~ fibres,
    # brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    foraging_3 ~ insularity,
    
    weight ~ fibres
  ),
  
  
  
  # NULL MODEL2 ----
  es_null1 = c(
    # brain ~ move_max,
    # brain ~ foraging_3,
    # brain ~ food_energy,
    # brain ~ food_h_level,
    # brain ~ fibres,
    # brain ~ insularity,
    # brain ~ social_bonds,
    # brain ~ grouping,
    
    # foraging_3 ~ insularity,
    # 
    # weight ~ fibres
  ),
  
  
  
  
  # COMMON PATHS ----
  .common = c(
    brain ~ weight,
    move_max ~ insularity + temp_range,
    weight ~ insularity + temp_range,
    food_energy ~ temp_range + food_h_level + fibres,
    foraging_3 ~ food_energy,
    grouping ~ social_bonds
  )
)
