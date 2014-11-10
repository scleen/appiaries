# -*- encoding : utf-8 -*-
module Parse
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
    HEADER_APP_ID   = "X-APPIARIES-TOKEN"
    
    # URI Helpers
    # ----------------------------------------

    # Construct a uri referencing a given Appiaries JSON Data
    def Protocol.jsondata_uri(datastore_id, application_id, collection_id, object_id = nil)
      if object_id
        "/v#{VERSION}/dat/#{datastore_id}/#{application_id}/#{collection_id}/#{object_id}"
      else
        "/v#{VERSION}/dat/#{datastore_id}/#{application_id}/#{collection_id}"
      end
    end

    # Construct a uri referencing a given Appiaries File (Binary) Data
    # class or instance (of object_id is non-nil).
    def Protocol.filedata_uri(datastore_id, application_id, collection_id, object_id = nil)
      if object_id
        "/v#{VERSION}/bin/#{datastore_id}/#{application_id}/#{collection_id}/#{object_id}"
      else
        "/v#{VERSION}/bin/#{datastore_id}/#{application_id}/#{collection_id}"
      end
    end
  end
end