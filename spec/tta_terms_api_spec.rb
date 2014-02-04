require 'spec_helper'
require 'tta_terms_api'
describe TtaTermsApi do
  subject(:tta_terms_api) { TtaTermsApi }
  describe ".list" do
    let(:list) { TtaTermsApi.list(search: "list") }
    it "return array of word object" do
      expect(list.class).to be Array
      expect(list.first.class).to be TtaTermsApi::WordCritria
    end
  end

  describe ".view" do
    let(:view) { TtaTermsApi.view(gubun: 1, terms_num: 17625) }
    it "return array of word object" do
      expect(view.class).to be TtaTermsApi::Word
    end
  end
end
