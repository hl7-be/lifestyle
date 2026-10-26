// Translations of element short and definition texts (rendered by the IG Publisher for i18n-lang)
RuleSet: TrShort(path, lang, text)
* {path} ^short.extension[+].url = $translation
* {path} ^short.extension[=].extension[+].url = "lang"
* {path} ^short.extension[=].extension[=].valueCode = #{lang}
* {path} ^short.extension[=].extension[+].url = "content"
* {path} ^short.extension[=].extension[=].valueString = "{text}"

RuleSet: TrDefinition(path, lang, text)
* {path} ^definition.extension[+].url = $translation
* {path} ^definition.extension[=].extension[+].url = "lang"
* {path} ^definition.extension[=].extension[=].valueCode = #{lang}
* {path} ^definition.extension[=].extension[+].url = "content"
* {path} ^definition.extension[=].extension[=].valueString = "{text}"
