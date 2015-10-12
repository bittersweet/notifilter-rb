# -*- encoding: utf-8 -*-
require File.expand_path('../lib/notifilter/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors = ["Mark Mulder"]
  gem.email = ["markmulder@gmail.com"]
  gem.description = "Track events and get notified"
  gem.summary = "Gem to track events into https://github.com/bittersweet/notifilter"
  gem.homepage = "https://github.com/bittersweet/notifilter-rb"

  gem.files = `git ls-files`.split("\n")
  gem.test_files = `git ls-files -- spec/*`.split("\n")
  gem.name = "notifilter"
  gem.require_paths = ['lib']
  gem.version = Notifilter::VERSION

  gem.add_runtime_dependency 'json'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'byebug'
end

