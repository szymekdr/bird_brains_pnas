m_pa <- phylopath::define_model_set(
  
  # FULL MODEL ----
  pa_all_massfoc = c(
    #weight ~ clutch_size,
    clutch_size ~ weight,
    
    devo_mode ~ weight,
    #weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    res_brain ~ devo_mode,
    res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  
  # *REV* FULL MODEL ----
  pa_all_devfoc = c(
    
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    res_brain ~ devo_mode,
    res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  
  
  
  # PARTIAL res_brain MODELS ----
  pa_Xdevmd_massfoc = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_massfoc = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    # res_brain ~ devo_mode,
    # res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    # weight ~ time_fed,
    # weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_massfoc_noCS = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    # res_brain ~ devo_mode,
    # res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    # res_brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_Xeggm_massfoc = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_Xeggm_massfoc_onlyCS = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xtfed_Xeggm_massfoc = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xeggm_massfoc = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_massfoc = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  
  # PARTIAL res_brain MODELS + NO EGG FEEDING LINK ----
  pa_Xdevmd_massfoc2 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_massfoc2 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_massfoc2_noCS = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    # res_brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_Xeggm_massfoc2 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_Xeggm_massfoc2_onlyCS = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xtfed_Xeggm_massfoc2 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xeggm_massfoc2 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_massfoc2 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_massfoc2_noCS = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    # res_brain ~ clutch_size,
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  
  # PARTIAL res_brain MODELS + NO EGG FEEDING LINK + NO WEIGHT TIMEFED LINK ----
  pa_Xdevmd_massfoc3 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_massfoc3 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_massfoc3_noCS = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    # res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_Xeggm_massfoc3 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xtfed_Xeggm_massfoc3 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xeggm_massfoc3 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_massfoc3 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_massfoc3_noCS = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    # res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_massfoc3_onlyCS = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    # res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  
  # PARTIAL res_brain MODELS + NO WEIGHT TIMEFED LINK ----
  pa_Xdevmd_massfoc4 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_massfoc4_noCS = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    # res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_massfoc4 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_massfoc4_noCS = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_Xeggm_massfoc4 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_Xeggm_massfoc4_onlyCS = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xtfed_Xeggm_massfoc4 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xeggm_massfoc4 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_massfoc4 = c(
    clutch_size ~ weight,
    clutch_size ~ devo_mode,
    
    devo_mode ~ weight,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    
    #time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  
  
  
  
  
  # *REV* PARTIAL res_brain MODELS ----
  pa_Xdevmd_devfoc = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_devfoc_noCS = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    # res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_devfoc = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_devfoc_noCS = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    # res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_Xeggm_devfoc = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_Xeggm_devfoc_onlyCS = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xtfed_Xeggm_devfoc = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xeggm_devfoc = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_devfoc = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_devfoc_noCS = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    # res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  
  # *REV* PARTIAL res_brain MODELS + NO EGG FEEDING LINK ----
  pa_Xdevmd_devfoc2 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_devfoc2_no_CS = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    # res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_devfoc2 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_devfoc2_noCS = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_Xeggm_devfoc2 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_Xeggm_devfoc2_onlyCS = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xtfed_Xeggm_devfoc2 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xeggm_devfoc2 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_devfoc2 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_devfoc2_noCS = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  
  # *REV* PARTIAL res_brain MODELS + NO EGG FEEDING LINK + NO WEIGHT TIMEFED LINK ----
  pa_Xdevmd_devfoc3 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_devfoc3_noCS = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    # res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_devfoc3 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_devfoc3_noCS = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    # res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_Xeggm_devfoc3 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_Xeggm_devfoc3_onlyCS = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xtfed_Xeggm_devfoc3 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xeggm_devfoc3 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_devfoc3_noCS = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_devfoc3 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  
  # *REV* PARTIAL res_brain MODELS + NO WEIGHT TIMEFED LINK ----
  pa_Xdevmd_devfoc4 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_devfoc4_noCS = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    # res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_devfoc4 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_devfoc4_noCS = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    # res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_Xeggm_devfoc4 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_Xeggm_devfoc4_onlyCS = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xtfed_Xeggm_devfoc4 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xeggm_devfoc4 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    res_brain ~ time_fed,
    #res_brain ~ res_egg_mass
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_devfoc4 = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    res_brain ~ clutch_size,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  pa_Xdevmd_Xtfed_devfoc4_noCS = c(
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    res_brain ~ res_egg_mass,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    #weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  
  
  
  
  # NULL MODEL ----
  pa_all_massfoc_null = c(
    #weight ~ clutch_size,
    clutch_size ~ weight,
    
    devo_mode ~ weight,
    #weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass,
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  
  # *REV* NULL MODEL ----
  pa_all_devfoc_null = c(
    
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    res_egg_mass ~ devo_mode,
    res_egg_mass ~ clutch_size,
    time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  
  # NULL MODEL2 ----
  pa_all_massfoc_null2 = c(
    #weight ~ clutch_size,
    clutch_size ~ weight,
    
    devo_mode ~ weight,
    #weight ~ devo_mode,
    
    #res_egg_mass ~ devo_mode,
    #res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass,
    
    time_fed ~ weight,
    res_egg_mass ~ weight
    #weight ~ time_fed,
    #weight ~ res_egg_mass
  ),
  
  
  # *REV* NULL MODEL2 ----
  pa_all_devfoc_null2 = c(
    
    weight ~ clutch_size,
    #clutch_size ~ weight,
    
    #devo_mode ~ weight,
    weight ~ devo_mode,
    
    #res_egg_mass ~ devo_mode,
    #res_egg_mass ~ clutch_size,
    #time_fed ~ res_egg_mass,
    
    #res_brain ~ devo_mode,
    #res_brain ~ time_fed,
    #res_brain ~ res_egg_mass,
    
    #time_fed ~ weight,
    #res_egg_mass ~ weight
    weight ~ time_fed,
    weight ~ res_egg_mass
  ),
  
  
  
  # COMMON PATHS ----
  .common = c(
    res_brain ~ weight,
    clutch_size ~ devo_mode,
    time_fed ~ devo_mode
  )
)
