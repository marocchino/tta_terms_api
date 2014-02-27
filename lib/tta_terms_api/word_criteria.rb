module TtaTermsApi
  class WordCriteria < Struct.new(:options)
    def to_word
      key = "view-#{options[:gubun]}-#{options[:terms_num]}"
      name, origin, type, similar, description = TtaTermsApi.html(:view, key, options).css("#printSpace font").text.gsub("\t", "").split(/\n/)
      Word.new name, origin, type, similar, description
    end
  end
end
