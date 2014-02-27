require "tta_terms_api/version"
require "tta_terms_api/word_criteria"
require "tta_terms_api/word"
require "nokogiri"
require 'open-uri'
require 'moneta'


module TtaTermsApi
  BASE_URL = "http://word.tta.or.kr/terms/"
  STORE = Moneta.new(:File, :dir => 'tmp')

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
    html = html(:list, key, options)
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

  def self.html(type, key, options)
    uri = "#{BASE_URL}terms#{type.to_s.capitalize}.jsp?#{options.map{|k,v|"#{k}=#{v}"} * "&"}"
    html = STORE.fetch(key){ STORE[key] = open(uri).read }
    Nokogiri::HTML(html, nil, "EUC-KR")
  end
end

