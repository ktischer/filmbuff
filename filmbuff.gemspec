# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "filmbuff/version"

Gem::Specification.new do |s|
  s.name        = "filmbuff"
  s.version     = Filmbuff::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kristoffer Sachse"]
  s.email       = ["kristoffer@sachse.nu"]
  s.homepage    = "https://github.com/sachse/filmbuff"
  s.summary     = %q{A Ruby wrapper for IMDb's JSON API}
  s.description = %q{Film Buff provides a Ruby wrapper for IMDb's JSON API, which is the fastest and easiest way to get information from IMDb.}

  s.rubyforge_project = "filmbuff"

  s.add_dependency("httparty", "~> 0.7.4")
  s.add_dependency("httparty-icebox", "~> 0.0.2")
  s.add_development_dependency("rspec", "~> 2.6.0")

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ["lib"]
end
