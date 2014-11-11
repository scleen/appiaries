require "bundler/gem_tasks"
require 'rake/testtask'

task :refresh => [:build] do |t|
  sh 'gem install pkg/appiaries-0.0.1.gem'
end


Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run tests"
task :default => :test