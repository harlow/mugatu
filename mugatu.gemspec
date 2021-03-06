$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mugatu/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mugatu"
  s.version     = Mugatu::VERSION
  s.authors     = ["Harlow Ward"]
  s.email       = ["harlow@hward.com"]
  s.homepage    = "https://github.com/harlow/mugatu"
  s.summary     = "Restricts instance methods on ActiveRecord models"
  s.description = ""

  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_development_dependency "activerecord"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "rspec"
  s.add_development_dependency "sqlite3"
end
