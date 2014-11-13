# -*- encoding : utf-8 -*-
require 'appiaries/protocol'

require 'logger'
require 'uri'

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
        query['get'] = true
      else
        query = {}
        query['get'] = true
      end
      uri += "?" + URI.escape(query.collect{|k,v| "#{k}=#{v}"}.join('&'))
      # puts "execute=>" + uri
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
  end # Client
  
  class JsonData < Client
    attr_accessor :collection_id
    attr_accessor :datastore_id
    attr_accessor :application_id
    def initialize(data = {}, &blk)
      super(data)
      @collection_id  = data[:collection_id]
      @datastore_id   = data[:datastore_id]
      @application_id = data[:application_id]
    end
    def create(body = {})
      uri = "https://" + self.host + Appiaries::Protocol.jsondata_uri(@datastore_id, @application_id, @collection_id, nil)
      post(uri, body.to_json)
    end
    def get(cond)
      # TODO if cond.is_a String, tehn get one, otherwise search and find
      uri = "https://" + self.host + Appiaries::Protocol.jsondata_uri(@datastore_id, @application_id, @collection_id, objectid)
      super(uri)
    end
    def update(objectid, json = {})
      # TODO implementation
    end
    def updateField(objectid, json = {})
      # TODO implementation
    end
    def delete(objectid)
      uri = "https://" + self.host + Appiaries::Protocol.jsondata_uri(@datastore_id, @application_id, @collection_id, objectid)
      super(uri)
    end
  end # JsonData
end
