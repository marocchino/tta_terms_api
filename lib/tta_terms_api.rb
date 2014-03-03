require "tta_terms_api/html"
require "tta_terms_api/version"
require "tta_terms_api/word"
require "tta_terms_api/word_criteria"
module TtaTermsApi
  def self.list(options)
    WordCriteria.list(options)
  end

  def self.view(options)
    WordCriteria.new(options).to_word
  end
end
