// Transposed from CareSet Lifestyle V0.1 FR (issue #1); EN displays are the SNOMED CT preferred terms.
// fr-BE / nl-BE designations are the 'Nom Fr' / 'Nom Nl' columns of the source; empty NL names are *TODO*.

ValueSet: BeVSLifestyleCategory
Id: be-vs-lifestyle-category
Title: "Lifestyle - Category"
Description: "Category of the lifestyle observation (VS_Lifestyle_Category; VS_Consum_Category / VS_eB_Category in CareSet V0.1). *TODO* No code yet for the categories Drogue (drugs; 307052004 Illicit medication use is not acceptable) and Médicaments (medication). See notes/1-lifestyle-notes.md."
* ^status = #draft
* ^experimental = false
* $sct#266918002 "Tobacco smoking consumption"
* $sct#266918002 ^designation[0].language = #fr-BE
* $sct#266918002 ^designation[0].value = "Tabac"
* $sct#897148007 "Alcoholic beverage intake"
* $sct#897148007 ^designation[0].language = #fr-BE
* $sct#897148007 ^designation[0].value = "Alcool"

ValueSet: BeVSLifestyleStatus
Id: be-vs-lifestyle-status
Title: "Lifestyle - Status"
Description: "Status of the lifestyle observation (VS_Lifestyle_Status; VS_Consum_Status / VS_eB_Status in CareSet V0.1)."
* ^status = #draft
* ^experimental = false
* $obs-status#final "Final"
* $obs-status#final ^designation[0].language = #fr-BE
* $obs-status#final ^designation[0].value = "Final"
* $obs-status#final ^designation[1].language = #nl-BE
* $obs-status#final ^designation[1].value = "Finaal"
* $obs-status#entered-in-error "Entered in Error"
* $obs-status#entered-in-error ^designation[0].language = #fr-BE
* $obs-status#entered-in-error ^designation[0].value = "Entré en erreur"
* $obs-status#entered-in-error ^designation[1].language = #nl-BE
* $obs-status#entered-in-error ^designation[1].value = "Foutieve ingave"

ValueSet: BeVSLifestyleCodeDrug
Id: be-vs-lifestyle-code-drug
Title: "Lifestyle - Code (drugs)"
Description: "Type of consumption when the category is drugs (Quand Code = Drogue) (VS_Consum_Code_P / VS_eB_Code_P in CareSet V0.1). Bound to Observation.code by a conditional binding on the category. Codes must be clinical findings: where the source gave a substance code and an equivalent use finding exists, the finding is used. *TODO* most codes are still substances. *TODO* The unit per day given in the source for each code is not carried yet - see the Value mapping. See notes/1-lifestyle-notes.md."
* ^status = #draft
* ^experimental = false
* $sct#387341002 "Diamorphine"
* $sct#387341002 ^designation[0].language = #fr-BE
* $sct#387341002 ^designation[0].value = "Héroïne"
* $sct#387341002 ^designation[1].language = #nl-BE
* $sct#387341002 ^designation[1].value = "heroïne"
* $sct#21919007 "Opium"
* $sct#21919007 ^designation[0].language = #fr-BE
* $sct#21919007 ^designation[0].value = "Opiacé"
* $sct#21919007 ^designation[1].language = #nl-BE
* $sct#21919007 ^designation[1].value = "Opium"
* $sct#62821004 "Hydroxybutyric acid"
* $sct#62821004 ^designation[0].language = #fr-BE
* $sct#62821004 ^designation[0].value = "GHB"
* $sct#62821004 ^designation[1].language = #nl-BE
* $sct#62821004 ^designation[1].value = "GHB"
* $sct#733461000 "Cocaine user"
* $sct#733461000 ^designation[0].language = #fr-BE
* $sct#733461000 ^designation[0].value = "Cocaine"
* $sct#733461000 ^designation[1].language = #nl-BE
* $sct#733461000 ^designation[1].value = "Cocaïne"
* $sct#229003004 "Cocaine freebase"
* $sct#229003004 ^designation[0].language = #fr-BE
* $sct#229003004 ^designation[0].value = "Crack"
* $sct#229003004 ^designation[1].language = #nl-BE
* $sct#229003004 ^designation[1].value = "Crack"
* $sct#398705004 "Cannabis"
* $sct#398705004 ^designation[0].language = #fr-BE
* $sct#398705004 ^designation[0].value = "Cannabis"
* $sct#398705004 ^designation[1].language = #nl-BE
* $sct#398705004 ^designation[1].value = "Cannabis"
* $sct#72024007 "Tetrahydrocannabinol"
* $sct#72024007 ^designation[0].language = #fr-BE
* $sct#72024007 ^designation[0].value = "THC"
* $sct#72024007 ^designation[1].language = #nl-BE
* $sct#72024007 ^designation[1].value = "THC"
* $sct#229006007 "Hallucinogenic mushrooms"
* $sct#229006007 ^designation[0].language = #fr-BE
* $sct#229006007 ^designation[0].value = "Champignons hallucinogènes"
* $sct#229006007 ^designation[1].language = #nl-BE
* $sct#229006007 ^designation[1].value = "Paddos"
* $sct#373780001 "Mescaline"
* $sct#373780001 ^designation[0].language = #fr-BE
* $sct#373780001 ^designation[0].value = "mescaline"
* $sct#15698006 "Lysergic acid diethylamide"
* $sct#15698006 ^designation[0].language = #fr-BE
* $sct#15698006 ^designation[0].value = "LSD / STP"
* $sct#15698006 ^designation[1].language = #nl-BE
* $sct#15698006 ^designation[1].value = "LSD"
* $sct#9721008 "Phencyclidine"
* $sct#9721008 ^designation[0].language = #fr-BE
* $sct#9721008 ^designation[0].value = "PCP"
* $sct#9721008 ^designation[1].language = #nl-BE
* $sct#9721008 ^designation[1].value = "PCP"
* $sct#288459003 "Methylenedioxymethamphetamine"
* $sct#288459003 ^designation[0].language = #fr-BE
* $sct#288459003 ^designation[0].value = "Ecstasy (XTC)"
* $sct#733767000 "Gamma-butyrolactone"
* $sct#733767000 ^designation[0].language = #fr-BE
* $sct#733767000 ^designation[0].value = "GHB /GBL"
* $sct#255677008 "Volatile solvent"
* $sct#255677008 ^designation[0].language = #fr-BE
* $sct#255677008 ^designation[0].value = "Solvant"
* $sct#372664007 "Benzodiazepine"
* $sct#372664007 ^designation[0].language = #fr-BE
* $sct#372664007 ^designation[0].value = "Benzodiazépine"
* $sct#372664007 ^designation[1].language = #nl-BE
* $sct#372664007 ^designation[1].value = "Benzodiazepine"
* $sct#373282008 "Anxiolytic agent"
* $sct#373282008 ^designation[0].language = #fr-BE
* $sct#373282008 ^designation[0].value = "Anxiolytique"
* $sct#387264003 "Diazepam"
* $sct#387264003 ^designation[0].language = #fr-BE
* $sct#387264003 ^designation[0].value = "Diazépam"
* $sct#387264003 ^designation[1].language = #nl-BE
* $sct#387264003 ^designation[1].value = "Diazepam"
* $sct#387455006 "Oxazepam"
* $sct#387455006 ^designation[0].language = #fr-BE
* $sct#387455006 ^designation[0].value = "Oxazépam"
* $sct#387455006 ^designation[1].language = #nl-BE
* $sct#387455006 ^designation[1].value = "Oxazepam"
* $sct#386983007 "Alprazolam"
* $sct#386983007 ^designation[0].language = #fr-BE
* $sct#386983007 ^designation[0].value = "Alprazolam"
* $sct#386983007 ^designation[1].language = #nl-BE
* $sct#386983007 ^designation[1].value = "Alprozolam"
* $sct#703842006 "Amphetamine"
* $sct#703842006 ^designation[0].language = #fr-BE
* $sct#703842006 ^designation[0].value = "Amphétamine"
* $sct#703842006 ^designation[1].language = #nl-BE
* $sct#703842006 ^designation[1].value = "Amfetamine"
* $sct#373464007 "Ketamine"
* $sct#373464007 ^designation[0].language = #fr-BE
* $sct#373464007 ^designation[0].value = "Kétamine"
* $sct#373464007 ^designation[1].language = #nl-BE
* $sct#373464007 ^designation[1].value = "Ketamine"
* $sct#372769005 "Methoxamine"
* $sct#372769005 ^designation[0].language = #fr-BE
* $sct#372769005 ^designation[0].value = "Methoxétamine"
* $sct#387499002 "Methamphetamine"
* $sct#387499002 ^designation[0].language = #fr-BE
* $sct#387499002 ^designation[0].value = "Methamphétamine"
* $sct#387499002 ^designation[1].language = #nl-BE
* $sct#387499002 ^designation[1].value = "Methamfetamine"
* $sct#372800002 "Laxative"
* $sct#372800002 ^designation[0].language = #fr-BE
* $sct#372800002 ^designation[0].value = "Laxatif"
* $sct#372800002 ^designation[1].language = #nl-BE
* $sct#372800002 ^designation[1].value = "Laxans"
* $sct#387173000 "Buprenorphine"
* $sct#387173000 ^designation[0].language = #fr-BE
* $sct#387173000 ^designation[0].value = "Buprénorphine"
* $sct#387173000 ^designation[1].language = #nl-BE
* $sct#387173000 ^designation[1].value = "Bruprenorfine"
* $sct#373492002 "Fentanyl"
* $sct#373492002 ^designation[0].language = #fr-BE
* $sct#373492002 ^designation[0].value = "Fentanyl"
* $sct#373492002 ^designation[1].language = #nl-BE
* $sct#373492002 ^designation[1].value = "Fentanyl"
* $sct#372798009 "Barbiturate"
* $sct#372798009 ^designation[0].language = #fr-BE
* $sct#372798009 ^designation[0].value = "Barbiturique"
* $sct#372798009 ^designation[1].language = #nl-BE
* $sct#372798009 ^designation[1].value = "Barbituraat"

ValueSet: BeVSLifestyleCodeTobacco
Id: be-vs-lifestyle-code-tobacco
Title: "Lifestyle - Code (tobacco)"
Description: "Type of consumption when the category is tobacco (Quand Code = Tabac) (VS_Consum_Code_P / VS_eB_Code_P in CareSet V0.1). Bound to Observation.code by a conditional binding on the category. Codes must be clinical findings: where the source gave a substance code and an equivalent use finding exists, the finding is used. *TODO* most codes are still substances. *TODO* The unit per day given in the source for each code is not carried yet - see the Value mapping. See notes/1-lifestyle-notes.md."
* ^status = #draft
* ^experimental = false
* $sct#65568007 "Cigarette smoker"
* $sct#65568007 ^designation[0].language = #fr-BE
* $sct#65568007 ^designation[0].value = "Cigarettes"
* $sct#65568007 ^designation[1].language = #nl-BE
* $sct#65568007 ^designation[1].value = "Sigaretten"
* $sct#59978006 "Cigar smoker"
* $sct#59978006 ^designation[0].language = #fr-BE
* $sct#59978006 ^designation[0].value = "Cigares"
* $sct#59978006 ^designation[1].language = #nl-BE
* $sct#59978006 ^designation[1].value = "sigaren"
* $sct#82302008 "Pipe smoker"
* $sct#82302008 ^designation[0].language = #fr-BE
* $sct#82302008 ^designation[0].value = "Pipe"
* $sct#82302008 ^designation[1].language = #nl-BE
* $sct#82302008 ^designation[1].value = "Pijp"
* $sct#160619003 "Rolls own cigarettes"
* $sct#160619003 ^designation[0].language = #fr-BE
* $sct#160619003 ^designation[0].value = "Cigarette roulée"
* $sct#160619003 ^designation[1].language = #nl-BE
* $sct#160619003 ^designation[1].value = "Shag"
* $sct#722499006 "Electronic cigarette user"
* $sct#722499006 ^designation[0].language = #fr-BE
* $sct#722499006 ^designation[0].value = "Cigarette électronique"

ValueSet: BeVSLifestyleCodeAlcohol
Id: be-vs-lifestyle-code-alcohol
Title: "Lifestyle - Code (alcohol)"
Description: "Type of consumption when the category is alcohol (Quand Code = Alcool) (VS_Consum_Code_P / VS_eB_Code_P in CareSet V0.1). Bound to Observation.code by a conditional binding on the category. Codes must be clinical findings: where the source gave a substance code and an equivalent use finding exists, the finding is used. *TODO* most codes are still substances. *TODO* The unit per day given in the source for each code is not carried yet - see the Value mapping. See notes/1-lifestyle-notes.md. *TODO* champagne has no code."
* ^status = #draft
* ^experimental = false
* $sct#53410008 "Beer"
* $sct#53410008 ^designation[0].language = #fr-BE
* $sct#53410008 ^designation[0].value = "Bière"
* $sct#53410008 ^designation[1].language = #nl-BE
* $sct#53410008 ^designation[1].value = "Bier"
* $sct#160591008 "Drinks wine"
* $sct#160591008 ^designation[0].language = #fr-BE
* $sct#160591008 ^designation[0].value = "Vin"
* $sct#447087000 "Drinks alcoholic cider"
* $sct#447087000 ^designation[0].language = #fr-BE
* $sct#447087000 ^designation[0].value = "cidre"
* $sct#6524003 "Distilled spirits"
* $sct#6524003 ^designation[0].language = #fr-BE
* $sct#6524003 ^designation[0].value = "Spiritueux"
* $sct#226019007 "Brandy"
* $sct#226019007 ^designation[0].language = #fr-BE
* $sct#226019007 ^designation[0].value = "Eau de vie"
* $sct#53527002 "Alcoholic beverage"
* $sct#53527002 ^designation[0].language = #fr-BE
* $sct#53527002 ^designation[0].value = "Autre"
* $sct#53527002 ^designation[1].language = #nl-BE
* $sct#53527002 ^designation[1].value = "andere"
