# -*- encoding: utf-8 -*-
# stub: nilify_blanks 1.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "nilify_blanks".freeze
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.4".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ben Hughes".freeze]
  s.date = "2015-04-12"
  s.description = "Often times you'll end up with empty strings where you really want nil at the database level.  This plugin automatically converts blanks to nil and is configurable.".freeze
  s.email = "ben@railsgarden.com".freeze
  s.homepage = "http://github.com/rubiety/nilify_blanks".freeze
  s.rubyforge_project = "nilify_blanks".freeze
  s.rubygems_version = "2.6.12".freeze
  s.summary = "Auto-convert blank fields to nil.".freeze

  s.installed_by_version = "2.6.12" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 3.0.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0.3"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.13"])
      s.add_development_dependency(%q<appraisal>.freeze, ["~> 1.0.2"])
      s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.3.6"])
    else
      s.add_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
      s.add_dependency(%q<activerecord>.freeze, [">= 3.0.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0.3"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.13"])
      s.add_dependency(%q<appraisal>.freeze, ["~> 1.0.2"])
      s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3.6"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<activerecord>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.13"])
    s.add_dependency(%q<appraisal>.freeze, ["~> 1.0.2"])
    s.add_dependency(%q<sqlite3>.freeze, ["~> 1.3.6"])
  end
end
