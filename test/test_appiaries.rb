# -*- encoding : utf-8 -*-
require 'test/unit'
require 'appiaries'
require 'yaml'

APP_ID       = 'smilein5sec'
DATASTORE_ID = '_sandbox'
COLLECTION_ID= 'thumbnails'

class AppiariesTest < Test::Unit::TestCase
  
  def setup
    @config = YAML.load(File.open(File.join(File.dirname(__FILE__), 'config.yml')).read)
    @apptoken = @config['appiaries_app_token']
    #puts "#{@apptoken} is ready"
    @to_be_deleted_on_teardown = []
  end
  
  def teardown
    client = Appiaries::Client.new(:application_token => @apptoken)
    collection_id = "sample_json_data"
    @to_be_deleted_on_teardown.each do |object_id|
      uri = "https://" + Appiaries::Protocol::HOST + Appiaries::Protocol.jsondata_uri(DATASTORE_ID, APP_ID, collection_id, object_id)
      client.delete(uri)
    end
  end
  
  def test_appiaries_client_initialize
    Appiaries::Client.new()
  end
  def test_protocol_uri
    host = Appiaries::Protocol::HOST
    uri = "https://" + host + Appiaries::Protocol.jsondata_uri(DATASTORE_ID, APP_ID, COLLECTION_ID, nil)
    assert_equal "https://api-datastore.appiaries.com/v1/dat/_sandbox/smilein5sec/thumbnails", uri
  end
  def test_jsondata_get
    assert_not_nil @apptoken
    host = Appiaries::Protocol::HOST
    collection_id = "sample_json_data"
    uri = "https://" + host + Appiaries::Protocol.jsondata_uri(DATASTORE_ID, APP_ID, collection_id, "sample")
#    puts uri
    client = Appiaries::Client.new(:application_token => @apptoken)
    res = client.get(uri)
    assert_equal "sample", res["_id"]
    assert_equal "sample", res["name"]
  end
  def test_jsondata_create
    assert_not_nil @apptoken
    host = Appiaries::Protocol::HOST
    collection_id = "sample_json_data"
    uri = "https://" + host + Appiaries::Protocol.jsondata_uri(DATASTORE_ID, APP_ID, collection_id, nil)
    client = Appiaries::Client.new(:application_token => @apptoken)
    res = client.post(uri, {"my_name_is" =>"appiaries"}.to_json)
    assert_equal "appiaries", res["my_name_is"]
    @to_be_deleted_on_teardown.push(res["_id"])
  end
  def test_jsondata_create_update
    assert_not_nil @apptoken
    host = Appiaries::Protocol::HOST
    collection_id = "sample_json_data"
    uri = "https://" + host + Appiaries::Protocol.jsondata_uri(DATASTORE_ID, APP_ID, collection_id, nil)
    client = Appiaries::Client.new(:application_token => @apptoken)
    res = client.post(uri, {"my_name_is" =>"to be updated"}.to_json)
    assert_equal "to be updated", res["my_name_is"]
    
    objectid = res['_id']
    uri = "https://" + host + Appiaries::Protocol.jsondata_uri(DATASTORE_ID, APP_ID, collection_id, objectid)
    newbody = {"my_name_is" => "SAYAKA", "greeting" => "hello"}
    res = client.put(uri, newbody.to_json)
    assert_equal "SAYAKA", res["my_name_is"]
    assert_equal "hello", res["greeting"]
    @to_be_deleted_on_teardown.push(res["_id"])
  end
  def test_jsondata_create_delete
    assert_not_nil @apptoken
    host = Appiaries::Protocol::HOST
    collection_id = "sample_json_data"
    uri = "https://" + host + Appiaries::Protocol.jsondata_uri(DATASTORE_ID, APP_ID, collection_id, nil)
    client = Appiaries::Client.new(:application_token => @apptoken)
    res = client.post(uri, {"my_name_is" =>"to be deleted"}.to_json)
    assert_equal "to be deleted", res["my_name_is"]
    
    objectid = res['_id']
    uri = "https://" + host + Appiaries::Protocol.jsondata_uri(DATASTORE_ID, APP_ID, collection_id, objectid)
    client.delete(uri)
  end
  def test_jsondata_query
    # TODO
  end
end