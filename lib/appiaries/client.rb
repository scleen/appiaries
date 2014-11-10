# -*- encoding : utf-8 -*-

require 'logger'

module Appiaries
  class Client
    attr_accessor :host
    attr_accessor :application_token
    attr_accessor :session_token
    attr_accessor :max_retries
    attr_accessor :logger
    attr_accessor :quiet

    def initialize(data = {}, &blk)
      @host           = data[:host] || Protocol::HOST
      @application_token = data[:application_token]
      @session_token  = data[:session_token]
      @max_retries    = data[:max_retries] || 3
      @logger         = data[:logger] || Logger.new(STDERR).tap{|l| l.level = Logger::INFO}
      @quiet          = data[:quiet] || false

      options = {:request => {:timeout => 30, :open_timeout => 30}}

    end
  end
end
