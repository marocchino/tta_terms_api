require "tta_terms_api/version"
require "tta_terms_api/word_criteria"
require "tta_terms_api/word"
require "tta_terms_api/html"

module TtaTermsApi

  def self.list(options)
    pattern = %r{sendData\(\s*
      '(?<gubun>.*)',\s*
      '(?<terms_num>.*)',\s*
      '(?<title>.*)',\s*
      '(?<title_gubun>.*)',\s*
      '(?<gubun2>.*)',\s*
      '(?<terms_num2>.*)',\s*
      '(?<title2>.*)',\s*
      '(?<title2_gubun>.*)',\s*
      '(?<gabora_gubun>.*)',\s*
      '(?<popular>[^']*)'\s*\)
    }x
    key = "list-#{options[:search]}"
    html = HTML.get(:list, key, options)
    trs = html.css("#tableWidth tr")
    trs.pop
    trs.map do |tr|
      script = tr.css(".input_size0").attr("onkeydown").value
      match_options = pattern.match(script)
      options = Hash[ match_options.names.zip( match_options.captures ) ]
      WordCriteria.new options
    end
  end

  def self.view(options)
    WordCriteria.new(options).to_word
  end

end

