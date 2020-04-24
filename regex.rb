
def build_regex
  # Partial regex to throw out bad prefixes from interwiki links
  interwiki_prefixes = ["wiktionary", "wikt", "wikibooks", "b", "wikiquote", "q",
                        "wikisource", "s"]
  language_prefixes = ["fr"]
  # Collect and add : to prefixes
  bad_prefixes = interwiki_prefixes + language_prefixes
  bad_prefixes.map! { |prefix| prefix + ":"}

  # Other exceptions: names, known use of lowercase, etc.
  exceptions = ["al-[A-Z]", "i-?[A-Z]", "e-?[A-Z]", "[a-z][A-Z]", "d'?[A-Z]", "p-", "de [A-Z]",
                "van (?:der )?[A-Z]", "della [A-Z]", "del [A-Z]", "von [A-Z]"]
  bad_prefixes += exceptions

  # OR into a regex
  bad_prefixes_regex = /(?!#{bad_prefixes.join('|')})/
  # Return regex to detect initial lowercase letters
  /\*\s*\[\[\s*#{bad_prefixes_regex}(?:[^\]]*\|)?\s*[a-z][^\|]*?\s*\]\]/
end
