require 'spec_helper'
require 'tta_terms_api'
describe TtaTermsApi do
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
end

module TtaTermsApi
  describe HTML do
    let(:store) { HTML.store }
    describe ".get" do
      it "cache html object" do
        expect(HTML.get("", "cache-test", {})).to_not be_nil
        expect(store["cache-test"]).to_not be_nil
        store.delete("cache-test")
        expect(store["cache-test"]).to be_nil
      end
    end
  end
end
