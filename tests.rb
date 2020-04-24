# coding: utf-8

require "test/unit"
require_relative "regex"

class TestSeeAlso < Test::Unit::TestCase

  def test_bad_regex_match
    should_match = [
      "==See also==
* [[insertion (disambiguation)]]",
      "* [[sodium tungsten bronze]]",
      "* [[badminton]]",
      "*[[algorithm]]",
      "*[[broadcast orchestra|broadcast Orchestra]]",
      "*[[Broadcast orchestra|broadcast Orchestra]]",
      "* [[ broadcast orchestra | broadcast Orchestra ]]",
    ]

    bad_regex = build_regex
    should_match.each { |text| assert_match(bad_regex, text) }
  end

  def test_bad_regex_nomatch
    no_match = [
      "==See also==
* [[s:The Petition of Chung Keng Quee & 44 Others|The Petition of Chung Keng Quee & 44 Others to Sir Harry Ord seeking government protection.]]",
      "* fr:Momo le doyen",
      "* [[wiktionary:the proof of the pudding is in the eating|The proof of the pudding is in the eating]] (Wiktionary)",
      "*[[iPhone]]",
      "* [[eToys.com]]",
      "*[[al-Khwarizmi]]",
      "*[[broadcast orchestra|Broadcast Orchestra]]",
      "*[[hornet#Stings|Hornet stings]]",
      "*[[o-Xylene|''o''-Xylene]]",
      "* [[beta-Methylamino-L-alanine|β-Methylamino-<small>L</small>-alanine]] (BMAA)",
      "*[[allo-Inositol|''allo''-Inositol]]",
      "*[[broadcast orchestra|Broadcast Orchestra]]",
      "* [[Frangipani family]], a powerful [[Rome|Roman]] [[patrician (post-Roman Europe)|patrician]] clan in the [[Middle Ages]]",
      "* [[van der Lith]] and van Lith, Dutch-language surnames",
      "* [[van Lith]]",
    ]

    bad_regex = build_regex
    no_match.each { |text| assert_no_match(bad_regex, text) }
  end

  def test_bad_regex_nomatch_todo
    bad_regex = build_regex

    no_match = [
      "*[[Wikt:Corde|corde]]",
      "<!--* [[vacancy rate]] -->",
      "* [[IPhone OS#Web applications|iPhone Web Applications]]",
      "* [[e-gold]]", # weird hyphen
      "*[[F-number|{{mvar|f}}-number]]",
      "* [[IDEN|iDEN technology explained]]",
    ]

    bad_regex = build_regex
    # no_match.each { |text| assert_no_match(bad_regex, text) }
  end

end
