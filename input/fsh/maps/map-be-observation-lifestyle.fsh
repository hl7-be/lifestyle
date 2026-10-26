// Generated from mappings/BeModelLifestyle-be-observation-lifestyle.csv - do not edit, regenerate with: python mappings/generate-conceptmaps.py
Instance: map-be-observation-lifestyle
InstanceOf: ConceptMap
Usage: #definition
Title: "BeModelLifestyle to be-observation-lifestyle mapping"
Description: "Mapping from the BeModelLifestyle logical model to the be-observation-lifestyle profile"
* url = "https://www.ehealth.fgov.be/standards/fhir/lifestyle/ConceptMap/map-be-observation-lifestyle"
* name = "MapBeObservationLifestyle"
* status = #draft
* experimental = false
* group[+]
  * source = "https://www.ehealth.fgov.be/standards/fhir/lifestyle/StructureDefinition/BeModelLifestyle"
  * target = "https://www.ehealth.fgov.be/standards/fhir/lifestyle/StructureDefinition/be-observation-lifestyle"
  * insert ConceptMapElementWithComment(BeModelLifestyle.identifier, Business Identifier, Observation.identifier, Business Identifier for observation, equivalent, 1..* as in the CareSet.)
  * insert ConceptMapElementWithComment(BeModelLifestyle.recordedDate, RecordedDate, Observation.extension:recordedDate, BeExtRecordedDate, equivalent, R4 Observation has no recordedDate: be-core extension BeExtRecordedDate (agreed in draft review\).)
  * insert ConceptMapElementWithComment(BeModelLifestyle.patient, Patient, Observation.subject, Who and/or what the observation is about, equivalent, Reference(BePatient\); the NISS is carried by BePatient.)
  * insert ConceptMapElementWithComment(BeModelLifestyle.recorder, Recorder, Observation.extension:recorder, BeExtRecorder, equivalent, R4 Observation has no recorder: be-core extension BeExtRecorder restricted to Reference(BePatient | BePractitioner | BePractitionerRole\) (decided in review\). The CareSet text still says health professional - to be updated in the source.)
  * insert ConceptMapElementWithComment(BeModelLifestyle.performer, Performer, Observation.performer, Who is responsible for the observation, equivalent, Restricted from 0..* to 0..1 and to Reference(BePractitioner\) as in the CareSet. *TODO* confirm whether BePractitionerRole or BeOrganization must also be allowed (the conceptual view mentions organisations\).)
  * insert ConceptMapElementWithComment(BeModelLifestyle.category, Category, Observation.category, Classification of type of observation, equivalent, Bound (extensible\) to BeVSLifestyleCategory. *TODO* binding strength not stated in the CareSet; no code yet for the categories Drogue and Médicaments (307052004 Illicit medication use was removed\).)
  * insert ConceptMapElementWithComment(BeModelLifestyle.status, Status, Observation.status, registered | preliminary | final | amended +, equivalent, Bound (required\) to BeVSLifestyleStatus: final and entered-in-error.)
  * insert ConceptMapElementWithComment(BeModelLifestyle.code, Code, Observation.code, Type of observation (code / type\), equivalent, No overall value set: conditional (additional\) bindings (extensible\) to BeVSLifestyleCodeTobacco and BeVSLifestyleCodeAlcohol apply when Observation.category is tobacco / alcohol. Codes must be clinical findings - most source codes are still substances. *TODO* binding strength not stated; *TODO* no conditional binding for BeVSLifestyleCodeDrug until the drugs category has a code; champagne has no code.)
  * insert ConceptMapElementWithComment(BeModelLifestyle.value, Value, Observation.value[x], Actual result, equivalent, valueQuantity 1..1 (agreed in draft review\). *TODO* the unit per day given per code in the source (Verres / Joints / comprimé...\) has no coded unit yet; the source also links Value to VS_eB_SubCode_P which is not defined. *TODO* the business rule for unknown values and for no consumption (VerificationStatus unknown / refuted\) has no element in Observation - open question.)
  * insert ConceptMapElementWithComment(BeModelLifestyle.period, Period, Observation.effectivePeriod, Clinically relevant time/time-period for observation, equivalent, effective[x] restricted to Period.)
  * insert ConceptMapElement(BeModelLifestyle.period.start, Start, Observation.effectivePeriod.start, Starting time with inclusive boundary, equivalent)
  * insert ConceptMapElement(BeModelLifestyle.period.end, End, Observation.effectivePeriod.end, End time with inclusive boundary, equivalent)
  * insert ConceptMapElementWithComment(BeModelLifestyle.interpretation, Interpretation, Observation.interpretation, High / low / normal etc., equivalent, Restricted from 0..* to 0..1 as in the CareSet. *TODO* VS_Lifestyle_Interpretation (VS_Consum_interpretation in V0.1\) is not defined in the source - no binding.)
  * insert ConceptMapElement(BeModelLifestyle.note, Note, Observation.note, Comments about the observation, equivalent)
