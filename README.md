# Mugatu

_* WARNING: This is an experimental Gem and should not be used in production codebases *_

## Introduction

In an effort to follow [Single Responsibility Principle](http://www.oodesign.com/single-responsibility-principle.html) and combat [Fat Models](http://en.oreilly.com/rails2011/public/schedule/detail/18514), this Gem will throw an `ActiveModel::ForbiddenMethods` exception when instance methods are added to any of your ActiveRecord models.

    class Person < ActiveRecord::Base
      # This will raise an ActiveModel::ForbiddenMethods exception because it's an
      # instance method on your ActiveRecord class
      def full_name
      end
    end

## Installation

Add to Gemfile and run `bundle`

    # Gemfile
    gem 'mugatu'

Create an initializer to include mugatu module in all Active Record objects

    # config/initializers/mugatu.rb
    ActiveRecord::Base.send :include, ActiveModel::ForbiddenMethodsProtection