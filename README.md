# DrySerialization

[![Gem Version](https://badge.fury.io/rb/dry_serialization.svg)](https://badge.fury.io/rb/dry_serialization)
![GitHub issues](https://img.shields.io/github/issues-raw/mikeyduece/dry_serialization?style=plastic)

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/dry_serialization`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dry_serialization'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install dry_serialization

## Usage

- Install with rails generator
  * currently supported serializers are [jsonapi_serializer](https://github.com/jsonapi-serializer/jsonapi-serializer) and [blueprinter](https://github.com/procore/blueprinter)
  

    `rails g dry_serialization:<serializer_name>:install`
    

- This gem will assume you have an api controller, and create one if you do not. This is to further keep the api separate from the web controllers. 
  - The inclusion of the module corresponding to your chosen serializer gem will give you access to `#serialized_resource`.
    - The `#serialized_resource` method also takes an optional 'options' hash. For `jsonapi-serializer`, that can come in the form of the `include` hash and/or `meta` or any of the other options available through that gem. Please see their documentation for all options.
    - Similarly for `blueprinter` it will also take an optional options hash. Again, please see the official documentation in their repo.
  ```ruby
  user = User.find(params[:id])
  render json: serialized_resource(user, UserSerializer) # UserSerializer can be substituted with UserBlueprint if that is the gem you've chosen.
  ```
  
- SerializationHelper
  - This module provides success and error response helper methods. 
  - In your controller you can use them like so:
  ```ruby
  def create
    user = User.create(create_user_params)
    return error_response(user.errors) unless user.errors.empty?
    
    success_response(user, UserSerializer, :created)
  end
  ```
  - Both methods take an optional argument for the status. You can either use the symbol representation or the number code.
    

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mikeyduece/dry_serialization.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
