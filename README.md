BigId Auth's Library for Ruby
==============

[![Gem Version](https://badge.fury.io/rb/flash_integration.svg)](https://badge.fury.io/rb/flash_integration)
[![Build Status](https://travis-ci.com/Quasar-Flash/flash-integration-ruby.svg?branch=master)](https://travis-ci.com/Quasar-Flash/flash-integration-ruby)

Dev Requirements
-----------------

- Ruby: Any version
- Bundler

Global Installation
-----------------

    gem install flash_integration

Installation for Rails
-----------------

    # Add to the Gemfile
    gem 'flash_integration', '~> 0.1.0'

Result Example
-----------------

    #<Flash::Integration::Response:0x0000564181d2bef0
        @request=#<Flash::Integration::Request:0x0000564181d76a18
            @method=:post,
            @url="https://accesstoken.bigdatacorp.com.br/Generate",
            @params={},
            @headers={:"Content-Type"=>"application/json", :Accept=>"application/json"},
            @body="{\"login\":\"username\",\"password\":\"crtvreru\",\"expires\":60000}",
            @time=2021-04-18 18:55:24.678349974 UTC>,
            @status=200,
            @body="{\"expiration\":\"Mon, 21 Feb 2028 18:55:24 GMT\",\"message\":\"Token Generated\",\"success\":true,\"token\":\"xxxxxxxxxxxx\",\"tokenID\":\"0000000000\"}\n", @time=2021-04-18 18:55:24.995163484 UTC>

Problems?
-----------------

**Please do not directly email any committers with questions or problems.**  A community is best served when discussions are held in public.

Searching the [issues](https://github.com/Quasar-Flash/flash-integration-ruby/issues) for your problem is also a good idea.

Contributing
-----------------

- Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet;
- Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it;
- Fork the project;
- Start a feature/bugfix branch;
- Commit and push until you are happy with your contribution;
- Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.;
- Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

License
-----------------

Please see [LICENSE](https://github.com/Quasar-Flash/flash-integration-ruby/blob/master/LICENSE.txt) for licensing details.

Authors
-----------------

Danilo Carolino, [@danilogco](https://github.com/danilogco) / [@Quasar-Flash](https://github.com/Quasar-Flash)
