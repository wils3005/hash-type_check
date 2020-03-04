# frozen_string_literal: true

require_relative 'lib/hash/type_check'

task :default do
  system 'rake -T'
end

desc 'Build'
task :build do
  system 'gem build hash-type_check.gemspec'
end

desc 'Install'
task :install do
  Rake::Task['build'].invoke
  system "gem install hash-type_check-#{Hash::TypeCheck::VERSION}.gem"
end

desc 'Deploy'
task :deploy do
  system 'git fetch'
  system 'git reset --hard origin/master'
  Rake::Task['install'].invoke
end
