# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "microservices/version"

Gem::Specification.new do |s|
  s.name        = "microservices"
  s.version     = Microservices::VERSION
  s.authors     = ["Michael Klein", "Jessie Keck", "Bess Sadler"]
  s.email       = ["mbklein@stanford.edu"]
  s.homepage    = "https://github.com/sul-dlss/microservices"
  s.summary     = %q{Ruby implementation of CDL curation microservices}
  s.description = %q{Ruby implementation of CDL curation microservices <https://confluence.ucop.edu/display/Curation/Home> }

  s.rubyforge_project = "microservices"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency "rake", ">=0.8.7"
  s.add_development_dependency "rcov"
  s.add_development_dependency "rdoc"
  s.add_development_dependency "rspec"
  s.add_development_dependency "yard"
end
