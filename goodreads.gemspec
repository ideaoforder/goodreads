# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{goodreads}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Dickson"]
  s.date = %q{2009-08-06}
  s.description = %q{Uses the Goodreads API to grab your book reviews. Takes all the standard Goodreads arguments. This gem is currently just a baby, and will may include more features over time. For now, it's mainly meant to allow folks to show their books and reviews on a website/blog.}
  s.email = %q{mark@sitesteaders.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/goodreads.rb",
     "test/goodreads_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/ideaoforder/goodreads}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Uses the Goodreads API to grab your book reviews}
  s.test_files = [
    "test/goodreads_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0.4.4"])
    else
      s.add_dependency(%q<httparty>, [">= 0.4.4"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0.4.4"])
  end
end
