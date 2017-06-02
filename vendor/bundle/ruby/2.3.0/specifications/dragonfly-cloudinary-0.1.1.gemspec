# -*- encoding: utf-8 -*-
# stub: dragonfly-cloudinary 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "dragonfly-cloudinary"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Anton Dieterle"]
  s.date = "2014-04-14"
  s.description = "Simple cloudinary data store for Dragonfly"
  s.email = ["antondie@gmail.com"]
  s.homepage = ""
  s.rubygems_version = "2.5.1"
  s.summary = "Simple cloudinary data store for Dragonfly"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0.9"])
      s.add_runtime_dependency(%q<dragonfly>, [">= 0.9"])
      s.add_runtime_dependency(%q<cloudinary>, [">= 1.0"])
    else
      s.add_dependency(%q<rake>, [">= 0.9"])
      s.add_dependency(%q<dragonfly>, [">= 0.9"])
      s.add_dependency(%q<cloudinary>, [">= 1.0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0.9"])
    s.add_dependency(%q<dragonfly>, [">= 0.9"])
    s.add_dependency(%q<cloudinary>, [">= 1.0"])
  end
end
