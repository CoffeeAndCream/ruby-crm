# -*- encoding: utf-8 -*-
# stub: nilify_blanks 1.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "nilify_blanks"
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.4") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ben Hughes"]
  s.date = "2015-04-12"
  s.description = "Often times you'll end up with empty strings where you really want nil at the database level.  This plugin automatically converts blanks to nil and is configurable."
  s.email = "ben@railsgarden.com"
  s.homepage = "http://github.com/rubiety/nilify_blanks"
  s.rubyforge_project = "nilify_blanks"
  s.rubygems_version = "2.5.1"
  s.summary = "Auto-convert blank fields to nil."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_development_dependency(%q<rake>, ["~> 10.0.3"])
      s.add_development_dependency(%q<rspec>, ["~> 2.13"])
      s.add_development_dependency(%q<appraisal>, ["~> 1.0.2"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3.6"])
    else
      s.add_dependency(%q<activesupport>, [">= 3.0.0"])
      s.add_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_dependency(%q<rake>, ["~> 10.0.3"])
      s.add_dependency(%q<rspec>, ["~> 2.13"])
      s.add_dependency(%q<appraisal>, ["~> 1.0.2"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3.6"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 3.0.0"])
    s.add_dependency(%q<activerecord>, [">= 3.0.0"])
    s.add_dependency(%q<rake>, ["~> 10.0.3"])
    s.add_dependency(%q<rspec>, ["~> 2.13"])
    s.add_dependency(%q<appraisal>, ["~> 1.0.2"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3.6"])
  end
end
