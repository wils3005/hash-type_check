# frozen_string_literal: true

require_relative 'lib/hash/type_check'

Gem::Specification.new do |it|
  it.name                  = 'hash-type_check'
  it.version               = Hash::TypeCheck::VERSION
  it.date                  = '2020-03-04'
  it.author                = ['Jack Wilson']
  it.email                 = ['wils3005@gmail.com']
  it.summary               = 'A simple key and type checking method for ruby hashes.'
  it.homepage              = 'https://github.com/wils3005/hash-type_check'
  it.license               = 'MIT'
  it.required_ruby_version = '>= 2.4.5'

  it.description = <<~HEREDOC
    hash-type_check deep compares a receiver hash with a schema hash argument,
    raises a KeyError if a key in the schema is not found in the receiver, or a
    TypeError if there is a type mismatch on the values for a key.
  HEREDOC

  it.files = Dir.
             glob(File.join(Dir.pwd, '**', '*.rb')).
             map { |str| str[%r{(?<=#{Dir.pwd}/).+}] }
end
