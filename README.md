# BitMask

Creates methods that accepts array of values and save them as bit mask to the attribute with an "_mask" suffix using specified source.

## Installation

Add this line to your application's Gemfile:

    gem 'bit_mask'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bit_mask

## Usage

Call `as_bit_mask` in an ActiveRecord class and pass the name of the attribute you wish to be the accessor for array of values.
In the option `:source` you can specify array of values or method name which return an array.
Bit mask would be saved to attribute with an "_mask" suffix, but you can also specify it in `:column` option

```ruby
class Permission < ActiveRecord::Base
  as_bit_mask :actions, :source => [:create, :show, :update]
end

permission = Permission.new
permission.actions = [:show, :update]
permission.actions_mask
=> 6
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
