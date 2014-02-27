module TtaTermsApi
  class Word < Struct.new(:name, :origin, :type, :similar, :description)
  end
end
