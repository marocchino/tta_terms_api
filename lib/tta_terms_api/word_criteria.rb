module TtaTermsApi
  class WordCriteria < Struct.new(:name, :options)
    def to_word
      TtaTermsApi.view(options)
    end
  end
end
