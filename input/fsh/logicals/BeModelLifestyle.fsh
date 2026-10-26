// Source: CareSet Lifestyle V0.1 FR (issue #1), section "Eléments". The CareSet is renamed from Consumption to Lifestyle; V0.1 still uses the old name in places.
// EN texts are translations of the FR source and need review; NL texts are not available yet (*TODO*).
Logical: BeModelLifestyle
Id: BeModelLifestyle
Title: "Lifestyle"
Description: "Logical model of the Lifestyle CareSet: the consumption by a patient of a substance (tobacco, alcohol, drugs, medication), current or past, that may have an impact on the patient's health."
Characteristics: #can-be-target
* insert TrShort(., fr-BE, Lifestyle)
* insert TrDefinition(., fr-BE, Le CareSet « Lifestyle » enregistre\, sous la forme d'une observation clinique structurée\, la consommation par un patient d'une substance donnée relevant de l'une des catégories suivantes : tabac\, alcool\, drogue et médicaments.)

// Business Identifier 1..* - Identifier
* identifier 1..* Identifier "Unique identifier of the observation" "Unique identifier of the observation."
* insert TrShort(identifier, fr-BE, Identifiant unique de l'observation.)
* insert TrDefinition(identifier, fr-BE, Identifiant unique de l'observation.)

// RecordedDate 1..1 - RecordedDate
* recordedDate 1..1 dateTime "Date the observation was encoded by the recorder" "Date the observation was encoded by the Recorder (DateTime format)."
* insert TrShort(recordedDate, fr-BE, Date d'encodage de l'observation par le Recorder.)
* insert TrDefinition(recordedDate, fr-BE, Date d'encodage de l'observation par le Recorder (format DateTime\).)

// Patient 1..1 - Subject
* patient 1..1 Reference(BePatient) "Unique identifier of the patient" "Unique identifier of the patient. Must be the patient's national register number (NISS)."
* insert TrShort(patient, fr-BE, Identifiant unique du patient.)
* insert TrDefinition(patient, fr-BE, Identifiant unique du patient. Doit être le n° de registre national du patient (NISS\).)

// Recorder 1..1 - Recorder
* recorder 1..1 Reference(BePatient or BePractitioner or BePractitionerRole) "Person who encodes the information and takes responsibility for it" "Unique identifier (national register number) of the health professional who encodes the information and takes responsibility for it."
* insert TrShort(recorder, fr-BE, Professionnel de santé qui encode les informations et en prend la responsabilité.)
* insert TrDefinition(recorder, fr-BE, Identifiant unique (n° de registre national\) du professionnel de santé qui encode les informations et en prend la responsabilité.)

// Performer 0..1 - Performer
* performer 0..1 Reference(BePractitioner) "Care provider who collects the observations" "Unique identifier (NISS) of the care provider who collects the observations, when different from the Recorder."
* insert TrShort(performer, fr-BE, Prestataire qui rassemble les observations.)
* insert TrDefinition(performer, fr-BE, Identifiant unique du prestataire (NISS\) qui rassemble les observations.)

// Category 1..* - Category
* category 1..* CodeableConcept "Category of the observation" "Category of the observation: consumption of alcohol, drugs or tobacco. See VS_Lifestyle_Category."
* category from BeVSLifestyleCategory (extensible)
* insert TrShort(category, fr-BE, Catégorie de l'observation.)
* insert TrDefinition(category, fr-BE, Catégorie de l'observation : consommation d'alcool\, de drogue ou de tabac. Voir VS_Lifestyle_Category.)

// Status 1..1 - Status
* status 1..1 code "Status of the observation, by default final" "Status of the observation, by default 'Final' (invariant). In case of error, use the status 'Entered-in-Error' (logical deletion of the record). See VS_Lifestyle_Status."
* status from BeVSLifestyleStatus (required)
* insert TrShort(status, fr-BE, Statut de l'observation\, par défaut « Final ».)
* insert TrDefinition(status, fr-BE, Statut de l'observation\, par défaut « Final » (invariant\). En cas d'erreur\, utiliser le statut « Entered-in-Error » (suppression logique de l'enregistrement\). Voir VS_Lifestyle_Status.)

// Code 1..1 - Code
* code 1..1 CodeableConcept "Type of consumption, depending on the category" "Type of consumption related to the category (e.g. wine, heroin, cigarette). See the value set of the category: VS_Lifestyle_Code_Drug, VS_Lifestyle_Code_Tobacco or VS_Lifestyle_Code_Alcohol."
// Bound in the profile by conditional bindings on Category; here only described
* code ^binding.strength = #extensible
* code ^binding.description = "Depends on the category: [drugs](ValueSet-be-vs-lifestyle-code-drug.html), [tobacco](ValueSet-be-vs-lifestyle-code-tobacco.html) or [alcohol](ValueSet-be-vs-lifestyle-code-alcohol.html). See the conditional bindings in [BeObservationLifestyle](StructureDefinition-be-observation-lifestyle.html)."
* insert TrShort(code, fr-BE, Type de consommation lié à la catégorie.)
* insert TrDefinition(code, fr-BE, Type de consommation lié à la catégorie (ex. : vin\, héroïne\, cigarette\). Voir la ValueSet de la catégorie : VS_Lifestyle_Code_Drug\, VS_Lifestyle_Code_Tobacco ou VS_Lifestyle_Code_Alcohol.)

// Value 1..1 - (no FHIR resource given in the source; Quantity agreed for the draft)
* value 1..1 Quantity "Value of the consumption" "Value of the consumption (e.g. number of cigarettes per day)."
* insert TrShort(value, fr-BE, Valeur de la consommation.)
* insert TrDefinition(value, fr-BE, Valeur de la consommation (ex. : nombre de cigarettes par jour\).)

// Period 0..1 - effective(period); no description in the source, short taken from its Start/End sub-elements
* period 0..1 BackboneElement "Period of consumption" "Period during which the patient consumed the substance (no description in the source document)."
* insert TrShort(period, fr-BE, Période de consommation.)
// Start 0..1 - startdate
* period.start 0..1 dateTime "Start date of the consumption" "Start date of the consumption."
* insert TrShort(period.start, fr-BE, Date de début de la consommation.)
* insert TrDefinition(period.start, fr-BE, Date de début de la consommation.)
// End 0..1 - enddate
* period.end 0..1 dateTime "End date of the consumption" "End date of the consumption."
* insert TrShort(period.end, fr-BE, Date de fin de consommation.)
* insert TrDefinition(period.end, fr-BE, Date de fin de consommation.)

// Interpretation 0..1 - Interpretation; no description in the source, definition taken from the Correlation business rule
// *TODO* VS_Lifestyle_Interpretation (VS_Consum_interpretation in V0.1) is announced but not defined in the source document - no binding yet
* interpretation 0..1 CodeableConcept "Interpretation of the consumption period" "Calculated by correlating the start date of the period of interest (e.g. start of pregnancy) with the end date of the consumption Period, to determine the period during which the patient consumed the substance."
* insert TrShort(interpretation, fr-BE, Interprétation de la période de consommation.)
* insert TrDefinition(interpretation, fr-BE, Interpretation est calculée par corrélation entre la date de début de la période d'intérêt et la date de fin de la Period de consommation\, afin de déterminer la période durant laquelle le patient a consommé la substance.)

// Note 0..* - Note
* note 0..* Annotation "Free text comments" "Comments in free text format."
* insert TrShort(note, fr-BE, Commentaires en format de texte libre.)
* insert TrDefinition(note, fr-BE, Commentaires en format de texte libre.)
