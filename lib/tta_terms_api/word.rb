module TtaTermsApi
  class Word < Struct.new(:name, :origin, :type, :similar, :description)
    def to_word
      TtaTermsApi.view(options)
    end
  end
end
