# -*- encoding : utf-8 -*-
module Appiaries
  # A module which encapsulates the specifics of Appiaries's REST API.
  module Protocol

    # Basics
    # ----------------------------------------

    # The default hostname for communication with the Appiaries API.
    HOST            = "api-datastore.appiaries.com"

    # The version of the REST API implemented by this module.
    VERSION         = 1
    
    # HTTP Headers
    # ----------------------------------------

    # The HTTP header used for passing your application TOKEN to the
    # Appiaries API.
    HEADER_APPIARIES_TOKEN   = "X-APPIARIES-TOKEN"
    
    # URI Helpers
    # ----------------------------------------

    # Construct a uri referencing a given Appiaries JSON Data
    def Protocol.jsondata_uri(datastore_id, application_id, collection_id, cond = nil)
      if cond.is_a? String
        "/v#{VERSION}/dat/#{datastore_id}/#{application_id}/#{collection_id}/#{cond}"
      elsif cond.is_a? Appiaries::Query
        "/v#{VERSION}/dat/#{datastore_id}/#{application_id}/#{collection_id}/#{cond.to_cond}"
      else
        "/v#{VERSION}/dat/#{datastore_id}/#{application_id}/#{collection_id}"
      end
    end

    # Construct a uri referencing a given Appiaries File (Binary) Data
    # class or instance (of object_id is non-nil).
    def Protocol.filedata_uri(datastore_id, application_id, collection_id, object_id = nil, binary = false)
      if object_id
        if binary
          "/v#{VERSION}/bin/#{datastore_id}/#{application_id}/#{collection_id}/#{object_id}/_bin"
        else
          "/v#{VERSION}/bin/#{datastore_id}/#{application_id}/#{collection_id}/#{object_id}"
        end
      else
        "/v#{VERSION}/bin/#{datastore_id}/#{application_id}/#{collection_id}"
      end
    end
  end
end