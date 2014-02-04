# TtaTermsApi

Ruby interface to [Korean IT terms(정보 통신 용어 사전)](http://word.tta.or.kr/terms/terms.jsp)

## Installation

Add this line to your application's Gemfile:

    gem 'tta_terms_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tta_terms_api

## Requirement

ruby >= 1.9

## Usage

To start using the gem, you can either perform direct calls on `TtaTermsApi`

``` ruby
words_criteria = TtaTermsApi.list search: "commit"
# => [#<struct TtaTermsApi::WordCriteria name="완료", options={:gubun=>"4", :terms_num=>"4-290", :title=>"%BF%CF%B7%E1%7Ccommit%7C", :title_gubun=>"kor", :gubun2=>"", :terms_num2=>"", :title2=>"", :title2_gubun=>"", :gabora_gubun=>"", :popular=>"false"}>, #<struct TtaTermsApi::WordCriteria name="커미트", options={:gubun=>"1", :terms_num=>"17625", :title=>"%C4%BF%B9%CC%C6%AE%7Ccommit%7C", :title_gubun=>"kor", :gubun2=>"", :terms_num2=>"", :title2=>"", :title2_gubun=>"", :gabora_gubun=>"", :popular=>"false"}>]

words_criteria.first.to_word
# => #<struct TtaTermsApi::Word name="commit", origin="완료", type="", similar="북한말 : 결속", description=nil>

TtaTermsApi.view gubun: 1, terms_num: 17624
# => #<struct TtaTermsApi::Word name="커뮤니케이터", origin="Communicator", type=" [컴퓨터]", similar="", description="☞넷스케이프 커뮤니케이터.">
```

## Contributing

1. Fork it ( http://github.com/marocchino/tta_terms_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
