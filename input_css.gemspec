# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "input_css/version"

Gem::Specification.new do |s|
  s.name        = "input_css"
  s.version     = InputCSS::VERSION
  s.authors     = ["Ryan Heath", "Micah Geisel"]
  s.email       = ["rpheath@gmail.com", "micah@botandrose.com"]
  s.homepage    = "https://github.com/botandrose/input_css"
  s.summary     = %q{Adds CSS classes for Rails input tags}
  s.description = %q{This plugin taps into Rails tag helpers and adds a CSS class equal to the type attribute for all ‘input’ fields.}

  s.rubyforge_project = "input_css"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "rails"

  s.add_development_dependency "rspec"
  s.add_development_dependency "equivalent-xml"
end
