require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "goodreads"
    gem.summary = "Uses the Goodreads API to grab your book reviews"
    gem.description = "Uses the Goodreads API to grab your book reviews. Takes all the standard Goodreads arguments. This gem is currently just a baby, and will may include more features over time. For now, it's mainly meant to allow folks to show their books and reviews on a website/blog."
    gem.email = "mark@sitesteaders.com"
    gem.homepage = "http://github.com/ideaoforder/goodreads"
    gem.authors = ["Mark Dickson"]
    gem.add_dependency('httparty', '>= 0.4.4')
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end

rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end




task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "goodreads #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

