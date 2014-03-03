module TtaTermsApi
  class WordCriteria < Struct.new(:options)
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

    def to_word
      key = "view-#{options[:gubun]}-#{options[:terms_num]}"
      name, origin, type, similar, description = HTML.get(:view, key, options).css("#printSpace font").text.gsub("\t", "").split(/\n/)
      Word.new name, origin, type, similar, description
    end
  end
end
