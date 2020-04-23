
def build_regex
  # Partial regex to throw out bad prefixes
  interwiki_prefixes = ["wiktionary", "wikt", "wikibooks", "b", "wikiquote", "q", "wikisource", "s"]
  language_prefixes = ["fr"]
  # Collect and add : to prefixes
  bad_prefixes = interwiki_prefixes + language_prefixes
  bad_prefixes.map! { |prefix| prefix + ":"}
  # OR into a regex
  bad_prefixes_regex = /(?!(#{bad_prefixes.join('|')}))/
  # Return regex to detect initial lowercase letters
  /\*[[:space:]]*\[\[[[:space:]]*#{bad_prefixes_regex}([a-z].*?)[[:space:]]*\]\]/
end
