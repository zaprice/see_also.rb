
# see_also.rb

Searches Wikipedia for pages with list items in the "See Also" section that do not have the initial letter capitalized

False positives:
* Links to foreign language wikis, ex. "fr:Article name"
* Wikimedia-specific prefixes; commons:, file:, category:, b:, q:, s:, special:, etc.
* Links formatted as "[ article_name | Article name]"
* Pages where the name is truly lowercase, like "grep"