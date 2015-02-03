require "bundler/gem_tasks"
require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "firudo"
    gem.summary = %Q{Provides writing logs into files and filtering secure data for Sinatra based applications.}
    gem.description = %Q{A Sinatra extension that makes logging and filtering secure data easy.}
    gem.email = "otan256@gmail.com"
    gem.homepage = "https://github.com/ostaptan/firudo"
    gem.authors = ["ostaptan"]
    gem.add_dependency( "sinatra", "~> 1.4.0")
    gem.add_development_dependency( "rspec", "~> 3.0.0")
    gem.add_development_dependency( "sinatra-tests", ">= 0.1.6")
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

task :spec => :check_dependencies

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "firudo #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

namespace :docs do

  desc 'Remove rdoc products'
  task :remove => [:clobber_rdoc]

  desc 'Force a rebuild of the RDOC files'
  task :rebuild => [:rerdoc]

  desc 'Build docs, and open in browser for viewing (specify BROWSER)'
  task :open => [:docs] do
    browser = ENV["BROWSER"] || "safari"
    sh "open -a #{browser} doc/index.html"
  end

end
