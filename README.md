# Mugatu

_Experimental Gem used to keep your models skinny. Don't use it in anything you care about._

![mugatu](http://www.brobible.com/files/uploads/images/bro-life/mugatu.jpg)

## Introduction

In an effort to follow [Single Responsibility Principle](http://www.oodesign.com/single-responsibility-principle.html) and combat [Fat Models](http://en.oreilly.com/rails2011/public/schedule/detail/18514), Mugatu will throw an `ActiveModel::ForbiddenMethods` hissy-fit (exception) when instance methods are added to any of your ActiveRecord models.

```ruby
class Person < ActiveRecord::Base
  # This will raise an ActiveModel::ForbiddenMethods exception because it's an
  # instance method on your ActiveRecord class
  def full_name
  end
end
```

## Installation

Add to Gemfile and run `bundle`

```ruby
# Gemfile
group :development, :test do
  gem 'mugatu'
end
``

Create an initializer to include mugatu module in all Active Record objects

```ruby
# config/initializers/mugatu.rb
ActiveRecord::Base.send :include, ActiveModel::ForbiddenMethodsProtection
```
