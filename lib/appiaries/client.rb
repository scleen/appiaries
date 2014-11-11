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
    
    # Perform an HTTP request for the given uri and method
    # with common basic response handling. 
    def request(uri, method = :get, payload = nil, query = nil, content_type = nil)
      headers = {}

      {
        "Content-Type"                    => content_type || 'application/json',
        "User-Agent"                      => 'Appiaries for Ruby, 0.0',
        Protocol::HEADER_APPIARIES_TOKEN  => @application_token,
      }.each do |key, value|
        headers[key] = value if value
      end
      
      if !query.nil?
        uri += query.to_param
      end
      JSON.parse RestClient::Request.execute(
            :method => method,
            :url => uri,
            :payload => payload,
            :headers => headers
          )
    end

    def get(uri)
      request(uri)
    end

    def post(uri, body)
      request(uri, :post, body)
    end

    def put(uri, body)
      request(uri, :put, body)
    end

    def delete(uri)
      request(uri, :delete)
    end
  end
end
