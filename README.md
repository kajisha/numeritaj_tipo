# NumeritajTipo

[![Code Climate](https://codeclimate.com/github/kajisha/numeritaj_tipo/badges/gpa.svg)](https://codeclimate.com/github/kajisha/numeritaj_tipo)

NumeritajTipo is yet another enumeration types library. This library does not override any methods defined at ActiveRecord or Mongoid or Neo4jrb.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'numeritaj_tipo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install numeritaj_tipo

## Usage

### ActiveRecord
```ruby
class User < ActiveRecord::Base
  include NumeritajTipo::ActiveRecord

  enumerize :role, values: %i(admin user), type: Symbol, default: :user
end
```

### Mongoid
```ruby
class User
  include Mongoid::Document
  include NumeritajTipo::Mongoid

  field :name
  enumerize :role, values: %i(admin user), type: Symbol, default: :user
end
```

### Neo4j
```ruby
class User
  include Neo4j::ActiveNode
  include NumeritajTipo::Neo4j

  property :name
  enumerize :role, values: %i(admin user), type: Symbol, default: :user
end
```

#### enumerize options
* values:
  * enum values range.
  * values should be Symbol values list.
* type:
  * enum type (describe below).
* default:
  * default value of the attribute.
* allow_nil
  * if `true` allow the null value, it doesn't allow in the case of `false`.

#### predicate methods
```ruby
user = User.create

user.user?
=> true

user.admin?
=> false
```

#### helper methods
```ruby
User.roles
=> [:admin, :user]
```

#### scopes
```ruby
User.admin.count
=> 1

User.user.count
=> 0
```

## Type safe enums support

* generate enums
```shell
$ rails g enum Role admin user
```

will generate enum type under `app/enums`:

* app/enums/role.rb:
```ruby
NumritajTipo.define_enum :Role, %i{
  admin
  user
}
```

* using enum
```ruby
class User < ActiveRecord::Base
  include NumeritajTipo::ActiveRecord

  enumerize :role, type: 'Role', default: :user
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kajisha/numeritaj_tipo.

