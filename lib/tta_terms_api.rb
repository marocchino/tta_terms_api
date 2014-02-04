require "tta_terms_api/version"
require "nokogiri"
require 'open-uri'


module TtaTermsApi
  BASE_URL = "http://word.tta.or.kr/terms/"
  WordCritria = Struct.new(:name, :options) do
    def to_word
      TtaTermsApi.view(@options)
    end
  end
  Word = Struct.new(:name, :origin, :type, :description)

  def self.list(options)
    html = html(:list, options)
    trs = html.css("#tableWidth tr")
    trs.pop
    trs.map do |tr|
      name = tr.children.first.text.gsub("\n","")
      script = tr.css(".input_size0").attr("onkeydown").value
      script.match(/sendData\(\s*'(.*)',\s*'(.*)',\s*'(.*)',\s*'(.*)',\s*'(.*)',\s*'(.*)',\s*'(.*)',\s*'(.*)',\s*'(.*)',\s*'([^']*)'\s*\)/)
      WordCritria.new name,
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
    name, origin, type, _, description = html(:view, options).css("#printSpace font").text.gsub("\t", "").split(/\n/)
    Word.new name, origin, type, description
  end

  def self.html(type, options)
    uri = "#{BASE_URL}terms#{type.to_s.capitalize}.jsp?#{options.map{|k,v|"#{k}=#{v}"} * "&"}"
    Nokogiri::HTML(open(uri), nil, "EUC-KR")
  end
end
