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
    key = "list-#{options[:search]}"
    html = html(:list, key, options)
    trs = html.css("#tableWidth tr")
    trs.pop
    trs.map do |tr|
      name = tr.children.first.text.gsub("\n","")
      script = tr.css(".input_size0").attr("onkeydown").value
      script.match(/sendData\(\s*'(.*)',\s*'(.*)',\s*'(.*)',\s*'(.*)',\s*'(.*)',\s*'(.*)',\s*'(.*)',\s*'(.*)',\s*'(.*)',\s*'([^']*)'\s*\)/)
      WordCriteria.new name,
        gubun: $1,
        terms_num: $2,
        title: $3,
        title_gubun: $4,
        gubun2: $5,
        terms_num2: $6,
        title2: $7,
        title2_gubun: $8,
        gabora_gubun: $9,
        popular: $10
    end
  end

  def self.view(options)
    key = "view-#{options[:gubun]}-#{options[:terms_num]}"
    name, origin, type, similar, description = html(:view, key, options).css("#printSpace font").text.gsub("\t", "").split(/\n/)
    Word.new name, origin, type, similar, description
  end

  def self.html(type, key, options)
    uri = "#{BASE_URL}terms#{type.to_s.capitalize}.jsp?#{options.map{|k,v|"#{k}=#{v}"} * "&"}"
    html = STORE.fetch(key){ STORE[key] = open(uri).read }
    Nokogiri::HTML(html, nil, "EUC-KR")
  end
end

