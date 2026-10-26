// Realises the logical model BeModelLifestyle (CareSet Lifestyle V0.1 FR, issue #1). Mapping: mappings/BeModelLifestyle-be-observation-lifestyle.csv
Profile: BeObservationLifestyle
Parent: Observation
Id: be-observation-lifestyle
Title: "Lifestyle Observation"
Description: "Belgian profile of Observation for the Lifestyle CareSet: the consumption by a patient of a substance (tobacco, alcohol, drugs, medication), current or past."

// Business Identifier 1..*
* identifier 1..* MS
// RecordedDate 1..1 - be-core extension (R4 Observation has no recordedDate)
// Recorder 1..1 - be-core extension (R4 Observation has no recorder)
* extension contains
    BeExtRecordedDate named recordedDate 1..1 MS and
    BeExtRecorder named recorder 1..1 MS
* extension[recorder].value[x] only Reference(BePatient or BePractitioner or BePractitionerRole)
// Patient 1..1
* subject 1..1 MS
* subject only Reference(BePatient)
// Performer 0..1
* performer 0..1 MS
* performer only Reference(BePractitioner)
// Category 1..*
* category 1..* MS
* category from BeVSLifestyleCategory (extensible)
// Status 1..1
* status MS
* status from BeVSLifestyleStatus (required)
// Code 1..1
* code MS
// Code depends on Category: conditional bindings per category, no overall value set
* insert ConditionalBindingOnCategory(code, extensible, BeVSLifestyleCodeTobacco, $sct#266918002, When category is tobacco)
* insert ConditionalBindingOnCategory(code, extensible, BeVSLifestyleCodeAlcohol, $sct#897148007, When category is alcohol)
// *TODO* BeVSLifestyleCodeDrug: no conditional binding until the drugs category has a code
// Value 1..1 - *TODO* unit per day per code (source table) has no coded unit yet; unknown / no consumption rule (VerificationStatus) is open
* value[x] 1..1 MS
* value[x] only Quantity
// Period 0..1 with Start 0..1 and End 0..1
* effective[x] only Period
* effective[x] MS
* effectivePeriod.start MS
* effectivePeriod.end MS
// Interpretation 0..1 - *TODO* VS_Consum_interpretation not defined in the source, no binding
* interpretation 0..1 MS
// Note 0..*
* note MS
