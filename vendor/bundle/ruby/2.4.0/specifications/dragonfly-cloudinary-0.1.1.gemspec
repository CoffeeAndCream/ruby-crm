# -*- encoding: utf-8 -*-
# stub: dragonfly-cloudinary 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "dragonfly-cloudinary".freeze
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Anton Dieterle".freeze]
  s.date = "2014-04-14"
  s.description = "Simple cloudinary data store for Dragonfly".freeze
  s.email = ["antondie@gmail.com".freeze]
  s.homepage = "".freeze
  s.rubygems_version = "2.6.12".freeze
  s.summary = "Simple cloudinary data store for Dragonfly".freeze

  s.installed_by_version = "2.6.12" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>.freeze, [">= 0.9"])
      s.add_runtime_dependency(%q<dragonfly>.freeze, [">= 0.9"])
      s.add_runtime_dependency(%q<cloudinary>.freeze, [">= 1.0"])
    else
      s.add_dependency(%q<rake>.freeze, [">= 0.9"])
      s.add_dependency(%q<dragonfly>.freeze, [">= 0.9"])
      s.add_dependency(%q<cloudinary>.freeze, [">= 1.0"])
    end
  else
    s.add_dependency(%q<rake>.freeze, [">= 0.9"])
    s.add_dependency(%q<dragonfly>.freeze, [">= 0.9"])
    s.add_dependency(%q<cloudinary>.freeze, [">= 1.0"])
  end
end
