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
    puts "#{@apptoken} is ready"
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
    host = Appiaries::Protocol::HOST
    collection_id = "sample_json_data"
    uri = "https://" + host + Appiaries::Protocol.jsondata_uri(DATASTORE_ID, APP_ID, collection_id, nil)
    client = Appiaries::Client.new(:application_token => @apptoken)
    res = client.post(uri, {"my_name_is" =>"appiaries"}.to_json)
    assert_equal "appiaries", res["my_name_is"]
  end
  def test_jsondata_create_update
    host = Appiaries::Protocol::HOST
    collection_id = "sample_json_data"
    uri = "https://" + host + Appiaries::Protocol.jsondata_uri(DATASTORE_ID, APP_ID, collection_id, nil)
    client = Appiaries::Client.new(:application_token => @apptoken)
    res = client.post(uri, {"my_name_is" =>"to be updated"}.to_json)
    assert_equal "to be updated", res["my_name_is"]
    
    newbody = {"my_name_is" => "SAYAKA", "greeting" => "hello"}
    res = client.post(uri, newbody.to_json)
    assert_equal "SAYAKA", res["my_name_is"]
    assert_equal "hello", res["greeting"]
  end
  def test_jsondata_create_delete
    host = Appiaries::Protocol::HOST
    collection_id = "sample_json_data"
    uri = "https://" + host + Appiaries::Protocol.jsondata_uri(DATASTORE_ID, APP_ID, collection_id, nil)
    client = Appiaries::Client.new(:application_token => @apptoken)
    res = client.post(uri, {"my_name_is" =>"to be deleted"}.to_json)
    assert_equal "to be deleted", res["my_name_is"]
    
    objectid = res['_id']
    uri = "https://" + host + Appiaries::Protocol.jsondata_uri(DATASTORE_ID, APP_ID, collection_id, objectid)
    res = client.delete(uri)
    # TODO assert
  end
  def test_jsondata_query
    # TODO
  end
  def test_jsondataclient_get
    collection_id = "sample_json_data"
    client = Appiaries::JsonDataClient.new(:application_token => @apptoken, :application_id => APP_ID, :datastore_id => DATASTORE_ID, :collection_id => collection_id)
    res = client.get("sample")
    assert_equal "sample", res["_id"]
    assert_equal "sample", res["name"]
  end
end