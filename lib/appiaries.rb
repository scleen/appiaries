# -*- encoding : utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require "appiaries/version"
require 'rest-client'
require 'json'

cwd = Pathname(__FILE__).dirname
$:.unshift(cwd.to_s) unless $:.include?(cwd.to_s) || $:.include?(cwd.expand_path.to_s)

require 'appiaries/object'
require 'appiaries/protocol'
require 'appiaries/query'

