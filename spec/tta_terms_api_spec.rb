require 'spec_helper'
require 'tta_terms_api'
describe TtaTermsApi do
  subject(:tta_terms_api) { TtaTermsApi }
  describe ".list" do
    let(:list) { TtaTermsApi.list(search: "list") }
    it "return array of word object" do
      expect(list.class).to be Array
      expect(list.first.class).to be TtaTermsApi::WordCriteria
    end
  end
  describe ".list" do
    let(:list) { TtaTermsApi.list(search: "commit") }
    it "return array of word object" do
      expect(list.class).to be Array
      expect(list.first.class).to be TtaTermsApi::WordCriteria
      expect{ list.map(&:to_word) }.to_not raise_error
    end
  end

  describe ".view" do
    let(:view) { TtaTermsApi.view(gubun: 1, terms_num: 17626) }
    it "return array of word object" do
      expect(view.class).to be TtaTermsApi::Word
    end
  end

  describe ".html" do
    let(:html) { TtaTermsApi.html("", "cache-test", {}) }
    it "cache html object" do
      expect(html).to_not be_nil
      expect(TtaTermsApi::STORE["cache-test"]).to_not be_nil
      TtaTermsApi::STORE.delete("cache-test")
    end
  end
end
