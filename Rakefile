require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

path = File.expand_path(__dir__)
Dir.glob("#{path}/lib/word_generator/tasks/**/*.rake").each { |f| import f }
