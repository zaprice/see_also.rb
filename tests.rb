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
      "*[[Broadcast orchestra|broadcast Orchestra]]"
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
      "*[[Jordan Historic District]], Jordan, Minnesota, [[List of RHPs in MN|listed on the NRHP in Minnesota]]"
    ]

    bad_regex = build_regex
    no_match.each { |text| assert_no_match(bad_regex, text) }
  end

  def test_bad_regex_nomatch_todo
    bad_regex = build_regex

    no_match = []

    bad_regex = build_regex
    # no_match.each { |text| assert_no_match(bad_regex, text) }
  end

end
