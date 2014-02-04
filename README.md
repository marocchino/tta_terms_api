# TtaTermsApi

Ruby interface to [정보 통신 용어 사전(telecommunication word terms)](http://word.tta.or.kr/terms/terms.jsp)

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
TtaTermsApi.list search: "commit"
TtaTermsApi.view gubun: 1, terms_num: 17624
```

## Contributing

1. Fork it ( http://github.com/marocchino/tta_terms_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
