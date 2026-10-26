# Lifestyle CareSet (#1) - review notes

Source: `CareSet_Consumption_V0.1_FR .docx` (CareSet Lifestyle V0.1 FR). Only the FR version is available.
Artefacts: logical model `BeModelLifestyle`, profile `BeObservationLifestyle` (on Observation), value sets
`BeVSLifestyleCategory` / `BeVSLifestyleStatus` / `BeVSLifestyleCodeDrug` / `BeVSLifestyleCodeTobacco` /
`BeVSLifestyleCodeAlcohol`, mapping
`mappings/BeModelLifestyle-be-observation-lifestyle.csv` -> ConceptMap `map-be-observation-lifestyle`.

All of this is a draft for review. Nothing below is validated.

## Fixed in the IG

| # | Topic | What was done |
|---|-------|---------------|
| F1 | Recorder | `Recorder` allows `BePatient`, `BePractitioner` and `BePractitionerRole` (model and profile, via `BeExtRecorder`). |
| F2 | Rename Consumption -> Lifestyle | All artefacts are named Lifestyle. Element definitions refer to `VS_Lifestyle_Category`, `VS_Lifestyle_Status`, `VS_Lifestyle_Code`; the value set descriptions keep the V0.1 names (`VS_Consum_*` / `VS_eB_*`) for traceability. |
| F3 | Category | `307052004` Illicit medication use removed from `BeVSLifestyleCategory`. Drugs has no category code now (see C2). |
| F4 | Codes must be findings | Where the source gave a substance (or physical object) and SNOMED CT has an equivalent *use* finding, the finding replaces it (table below). |
| F5 | RecordedDate, Recorder | Carried by be-core extensions `BeExtRecordedDate` and `BeExtRecorder` (R4 Observation has neither). Adds the dependency `hl7.fhir.be.core` 2.2.0. |
| F6 | Value | `value[x]` restricted to Quantity, 1..1. |
| F8 | Code depends on Category | One value set per category: `BeVSLifestyleCodeDrug`, `BeVSLifestyleCodeTobacco` and `BeVSLifestyleCodeAlcohol`, with no combined value set. `Observation.code` has only conditional bindings (`additional-binding` extension, purpose extensible, usage = `Observation.category`) for tobacco and alcohol. |
| F7 | Translations | EN default text (translated from FR - needs review); FR source text as `translation` extensions on short and definition; value set designations fr-BE / nl-BE from the source tables. |

F4 replacements:

| Nom Fr | Source code (hierarchy) | Replaced by (finding) |
|--------|-------------------------|-----------------------|
| Cocaine | 387085005 Cocaine (substance) | 733461000 Cocaine user |
| Cigarette électronique | 722498003 Electronic cigarette (physical object) | 722499006 Electronic cigarette user |
| Vin | 35748005 Wine (substance) | 160591008 Drinks wine |
| cidre | 226025006 Hard cider (substance) | 447087000 Drinks alcoholic cider |

The other tobacco codes (65568007, 59978006, 82302008, 160619003) were already findings.

## Cannot be fixed in the IG - need a decision or a source update

### C1. Most codes are substances and have no "use" finding in SNOMED CT

SNOMED CT (international) has findings for *harmful use*, *misuse*, *dependence* or *disorder* of most
substances, but not for plain *use*. The CareSet explicitly excludes addiction, so those are not acceptable.
Still substance codes:

| Nom Fr | Source code | Closest finding found | Why it is not used |
|--------|-------------|-----------------------|--------------------|
| Héroïne | 387341002 | 231477003 Heroin dependence | dependence |
| Opiacé | 21919007 | - | |
| GHB | 62821004 | - | |
| Crack | 229003004 | 428493006 Crack cocaine misuse | misuse |
| Cannabis | 398705004 | 37344009 Harmful pattern of use of cannabis | harmful use |
| THC | 72024007 | - | |
| Champignons hallucinogènes | 229006007 | - | |
| mescaline | 373780001 | 231469002 Mescaline dependence | dependence |
| LSD / STP | 15698006 | - | |
| PCP | 9721008 | 7071007 Harmful pattern of use of phencyclidine | harmful use |
| Ecstasy (XTC) | 288459003 | - | |
| GHB /GBL | 733767000 | - | |
| Solvant | 255677008 | 105549004 Abuses volatile solvents | abuse |
| Benzodiazépine | 372664007 | - | |
| Anxiolytique | 373282008 | 1335952009 Harmful pattern of use of anxiolytic | harmful use |
| Diazépam | 387264003 | - | |
| Oxazépam | 387455006 | - | |
| Alprazolam | 386983007 | - | |
| Amphétamine | 703842006 | 785277001 Harmful pattern of use of amphetamine and/or amphetamine derivative | harmful use |
| Kétamine | 373464007 | 1344922008 Harmful pattern of use of ketamine | harmful use |
| Methoxétamine | 372769005 | - | see C3 |
| Methamphétamine | 387499002 | 699449003 Harmful pattern of use of methamphetamine | harmful use |
| Laxatif | 372800002 | 280982009 Harmful pattern of use of laxative | harmful use |
| Buprénorphine | 387173000 | - | |
| Fentanyl | 373492002 | - | |
| Barbiturique | 372798009 | 231462006 Harmful pattern of use of barbiturate | harmful use |
| Bière | 53410008 | 160590009 Drinks beer and hard liquor | combines beer and spirits |
| Spiritueux | 6524003 | 160590009 Drinks beer and hard liquor | combines beer and spirits |
| Eau de vie | 226019007 | - | |
| Autre | 53527002 | - | |

Options for the group:
- **a.** Request Belgian extension concepts ("uses X" findings) from the SNOMED CT Belgian NRC.
- **b.** Put a generic finding per category in `code` (for example 365980008 Finding of tobacco use and exposure,
  228273003 Finding relating to alcohol drinking behavior), and carry the substance separately, in a `component`
  or a `BeExtCodeableConcept` extension. This changes the model (Code would no longer be the substance).
- **c.** Keep the substance codes for the substances that have no finding, and accept a mixed value set.

### C2. Category codes

- Drugs (Drogue): no code since 307052004 was removed. Candidates: 228366006 Finding relating to drug misuse
  behavior (says *misuse*), 409069009 Finding related to substance use (also covers tobacco and alcohol).
- Medication (Médicaments): no code in the source, none proposed.
- The remaining category codes 266918002 Tobacco smoking consumption and 897148007 Alcoholic beverage intake are
  *observable entities*, not findings. If categories must be findings too: 365980008 Finding of tobacco use and
  exposure, 228273003 Finding relating to alcohol drinking behavior.
- Should `category` also carry the FHIR `social-history` category?

### C3. Errors in the source document

- 372769005 is *Methoxamine* in SNOMED CT, not methoxetamine.
- Champagne has no code.
- The document still uses the old name: the element table is titled "Consumption", the text says
  "CareSet Consommation", and value sets are named both `VS_eB_*` and `VS_Consum_*` (the Code value set is also
  called `VS_eB_Code_A`). The file name is `CareSet_Consumption_V0.1_FR .docx`.
- Recorder is described as a health professional; it must now also cover the patient and a practitioner role.
- The document says there are three categories in one place and four (with Médicaments) in another.

### C4. Open modelling questions

- **Unknown / no consumption:** the business rules ask for VerificationStatus `unknown` / `refuted`.
  Observation (R4 and R5) has no verificationStatus. Options: `dataAbsentReason` for unknown and a value of 0 for
  no consumption; a local extension (and possibly move it to be-core); or a dedicated "no consumption" code.
- **Units:** the source gives a unit per day per code (Verres, Joints, comprimé...). No coded unit (UCUM or
  other) is defined. The source also links Value to `VS_eB_SubCode_P`, which is not defined.
- **Code depends on Category (drugs):** no conditional binding for `BeVSLifestyleCodeDrug` yet, because the drugs
  category has no code (C2). As there is no combined value set, drug codes are not bound at all until then. If the tobacco / alcohol category codes change (C2), the conditional bindings change too.
  The conditional bindings use the validator's convention (usage code = profile url + element path); they are
  generated correctly but not yet tested with the validator on an example.
- **Interpretation:** `VS_Lifestyle_Interpretation` (`VS_Consum_interpretation`) is announced but empty; no binding.
- **Performer:** restricted to `BePractitioner`. The conceptual view also mentions organisations.
- **Binding strengths:** not stated in the source. Draft: Category and Code extensible, Status required.

### C5. Translations

- NL: only the NL names given in the value set tables. No NL text for the element descriptions, and several value
  set entries have no NL name. Needs the NL version of the document.
- EN: all EN texts are translations made for the draft and must be reviewed.
- Two FR short texts are not in the source and were written for the draft: Period ("Période de consommation") and
  Interpretation ("Interprétation de la période de consommation").
