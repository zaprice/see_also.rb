require 'httparty'
require 'nokogiri'
require 'JSON'
require_relative 'regex'

# MediaWiki only allows full text for 50 pages per request
per = 50
# Number of requests to do in succession
num = 1000

mediawiki_query = "https://en.wikipedia.org/w/api.php?action=query&prop=revisions&generator=random&grnnamespace=0&grnlimit=#{per}&rvprop=content&format=json"

page_base = "https://en.wikipedia.org/wiki/"
bad_regex = build_regex

for i in 1..num

  json = JSON.parse HTTParty.get(mediawiki_query).body

  json["query"]["pages"].keys.each do |id|
    text = json["query"]["pages"][id]["revisions"][0]["*"]
    see_also = /\s*==See Also==\s*(.*)/i.match text

    if !see_also.nil? and see_also[1] =~ bad_regex
      title_underscores =  json["query"]["pages"][id]["title"].gsub(/\s/, '_')
      system("open \"#{page_base}#{title_underscores}#See_also\"")
    end
  end
end
