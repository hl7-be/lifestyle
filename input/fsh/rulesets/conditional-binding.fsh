// Conditional binding (R5 ElementDefinition.binding.additional, as the tools extension in R4):
// the value set applies to {element} when Observation.category contains {categoryCode}.
// The validator evaluates a usage whose code.system is this profile's url and code is an element path.
RuleSet: ConditionalBindingOnCategory(element, purpose, valueSet, categoryCode, doco)
* {element} ^binding.extension[+].url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* {element} ^binding.extension[=].extension[+].url = "purpose"
* {element} ^binding.extension[=].extension[=].valueCode = #{purpose}
* {element} ^binding.extension[=].extension[+].url = "valueSet"
* {element} ^binding.extension[=].extension[=].valueCanonical = Canonical({valueSet})
* {element} ^binding.extension[=].extension[+].url = "shortDoco"
* {element} ^binding.extension[=].extension[=].valueString = "{doco}"
* {element} ^binding.extension[=].extension[+].url = "usage"
* {element} ^binding.extension[=].extension[=].valueUsageContext.code = https://www.ehealth.fgov.be/standards/fhir/lifestyle/StructureDefinition/be-observation-lifestyle#Observation.category
* {element} ^binding.extension[=].extension[=].valueUsageContext.valueCodeableConcept = {categoryCode}
