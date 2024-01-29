# Flash Integration

A Faraday's extension to make it easier to create integrations.

[![Gem Version](https://badge.fury.io/rb/flash_integration.svg)](https://badge.fury.io/rb/flash_integration)
[![Build](https://github.com/Quasar-Flash/flash_integration/actions/workflows/tests.yml/badge.svg)](https://github.com/Quasar-Flash/flash_integration/actions/workflows/tests.yml)

## Dev Requirements

- Ruby: Any version
- Bundler

## Global Installation

```ruby
gem install flash_integration
```

## Installation for Rails

```ruby
# Add to the Gemfile
gem 'flash_integration', '~> 1.0.0'
```

## Example - How to extend

```ruby
module MyApp
  class Connection < Flash::Integration::Connection
    def initialize(base_url: "http://localhost")
      super(base_url: base_url)
    end

    def default_headers
      {
        "Accept":       "application/json",
        "Content-Type": "application/json"
      }
    end
  end
end
```

## Example - How to request

```ruby
res = @connection.post(
  method: :post,
  url: url,
  params: {},
  headers: {},
  body: body, # except for get
  multipart: multipart # only for post
)
res # Flash::Integration::Response type
res.request
res.status
res.headers
res.body
res.time
```

## Problems?

**Please do not directly email any committers with questions or problems.** A community is best served when discussions are held in public.

Searching the [issues](https://github.com/Quasar-Flash/flash_integration/issues) for your problem is also a good idea.

## Contributing

- Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet;
- Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it;
- Fork the project;
- Start a feature/bugfix branch;
- Commit and push until you are happy with your contribution;
- Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.;
- Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## License

Please see [LICENSE](https://github.com/Quasar-Flash/flash_integration/blob/master/LICENSE.txt) for licensing details.

## Authors

Danilo Carolino, [@danilogco](https://github.com/danilogco) / [@Quasar-Flash](https://github.com/Quasar-Flash)
