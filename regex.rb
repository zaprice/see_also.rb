
def build_regex
  # Partial regex to throw out bad prefixes from interwiki links
  interwiki_prefixes = ["wiktionary", "wikt", "wikibooks", "b", "wikiquote", "q", "wikisource", "s"]
  language_prefixes = ["fr"]
  # Collect and add : to prefixes
  bad_prefixes = interwiki_prefixes + language_prefixes
  bad_prefixes.map! { |prefix| prefix + ":"}

  # Other exceptions: names, known use of lowercase, etc.
  exceptions = ["al-[A-Z]", "i-?[A-Z]", "e-?[A-Z]", "pH", "d'?[A-Z]", "p-"]
  bad_prefixes += exceptions

  # OR into a regex
  bad_prefixes_regex = /(?!#{bad_prefixes.join('|')})/
  # Return regex to detect initial lowercase letters
  /\*\s*\[\[\s*#{bad_prefixes_regex}(?:[^\]]*\|)?\s*[a-z][^\|]*?\s*\]\]/
end
