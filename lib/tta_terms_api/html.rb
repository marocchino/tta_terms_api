require "nokogiri"
require 'open-uri'
require 'moneta'
module TtaTermsApi
  module HTML
    BASE_URL = "http://word.tta.or.kr/terms/"

    def self.get(type, key, options)
      uri = "#{BASE_URL}terms#{type.to_s.capitalize}.jsp?#{options.map{|k,v|"#{k}=#{v}"} * "&"}"
      html = store.fetch(key){ store[key] = open(uri).read }
      Nokogiri::HTML(html, nil, "EUC-KR")
    end

    def self.store
      @store ||= Moneta.new(:File, :dir => 'tmp')
    end
  end
end
