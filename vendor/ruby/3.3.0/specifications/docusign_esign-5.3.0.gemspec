# -*- encoding: utf-8 -*-
# stub: docusign_esign 5.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "docusign_esign".freeze
  s.version = "5.3.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["DocuSign".freeze]
  s.date = "2025-07-14"
  s.description = "The Docusign package makes integrating Docusign into your apps and websites a super fast and painless process. The library is open sourced on GitHub, look for the docusign-esign-ruby-client repository. Join the eSign revolution!".freeze
  s.email = ["devcenter@docusign.com".freeze]
  s.homepage = "https://github.com/docusign/docusign-esign-ruby-client".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9".freeze)
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Docusign eSignature REST API Ruby Gem".freeze

  s.installed_by_version = "3.5.16".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<jwt>.freeze, ["~> 2.2".freeze, ">= 2.2.1".freeze])
  s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.7".freeze, ">= 2.7.0".freeze])
  s.add_runtime_dependency(%q<typhoeus>.freeze, ["~> 1.0".freeze, ">= 1.0.1".freeze])
  s.add_runtime_dependency(%q<json>.freeze, ["~> 2.1".freeze, ">= 2.1.0".freeze])
  s.add_development_dependency(%q<rspec-mocks>.freeze, ["~> 3.8".freeze, ">= 3.8.0".freeze])
  s.add_development_dependency(%q<rspec-expectations>.freeze, ["~> 3.8".freeze, ">= 3.8.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4".freeze, ">= 3.4.0".freeze])
  s.add_development_dependency(%q<vcr>.freeze, ["~> 3.0".freeze, ">= 3.0.1".freeze])
  s.add_development_dependency(%q<webmock>.freeze, ["~> 1.24".freeze, ">= 1.24.3".freeze])
  s.add_development_dependency(%q<autotest>.freeze, ["~> 4.4".freeze, ">= 4.4.6".freeze])
  s.add_development_dependency(%q<autotest-rails-pure>.freeze, ["~> 4.1".freeze, ">= 4.1.2".freeze])
  s.add_development_dependency(%q<autotest-growl>.freeze, ["~> 0.2".freeze, ">= 0.2.16".freeze])
  s.add_development_dependency(%q<autotest-fsevent>.freeze, ["~> 0.2".freeze, ">= 0.2.11".freeze])
end
