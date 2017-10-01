# RailsFormObject

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_form_object'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_form_object
    
## Intention
    
It allow you to move validations away from models. It get `hash` of params, or `strong parameters` as initializer instead of `model instance` and then run `active_model` validations on it

Gem allow you to:
  - validates `hashes` or `strong_parameters`
  - use standard validations from `active_model`
  
Gem do not allow you to:
  - validates models directly, because of simplicity
  - save model, because of single responsibility principle

## Usage

To define form_object you need to specify list of attributes to validation, and then define standard `active_model` validations

```ruby
 class UserEditFriendData < RailsFormObject::Base
   attributes :frist_name, :last_name
   validates :first_name, :last_name, presence: true
   validate :custom_validation
     
   def custom_validation
     # custom validator here
   end
 end
```

Example usage of `UserEditOwnData` in controller
 
```ruby
  class FriendsController < ActionController::Base
    def new 
      @friend_form = UserEditFriendData.new
    end
    
    def edit
       friend = Friend.find(params[:id])
       @friend_form = UserEditFriendData.new(friend.attributes)
    end
    
    def create
      @friend_form = UserEditFriendData.new(friend_params)
      if @friend_form.valid?
         friend = Friend.new(friend_params)
         friend.save(validation: false)
         redirect_to friend
      else
         render :new
      end
    end
    
    def update
      @friend_form = UserEditFriendData.new(friend_params)
      if @friend_form.valid?
         friend = Friend.find(params[:id])
         friend.assign_attributes(friend_params)
         friend.save(validation: false)
         redirect_to friend
      else
         render :edit
      end
    end
    
    def friend_params
      params.require(:user_edit_friend_data).permit(:first_name, :last_name)
    end
  end
``` 

## TODO
 PR are welcome
 
 - Add support for nested attributes and nested form
 - Add optional uniqueness validator


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. Then run `rubocop` You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/piotr-galas/rails_form_object. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

