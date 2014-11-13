# -*- encoding : utf-8 -*-
require 'test/unit'
require 'appiaries'
require 'yaml'

APP_ID       = 'smilein5sec'
DATASTORE_ID = '_sandbox'

class JsonDataClientTest < Test::Unit::TestCase
  def setup
    @config = YAML.load(File.open(File.join(File.dirname(__FILE__), 'config.yml')).read)
    apptoken = @config['appiaries_app_token']
    collection_id = "sample_json_data"
    @client = Appiaries::JsonDataClient.new(:application_token => apptoken, :application_id => APP_ID, :datastore_id => DATASTORE_ID, :collection_id => collection_id)
    puts "#{apptoken} is ready"
  end
  def test_json_data_client_get
    res = @client.get("sample")
    assert_equal "sample", res["_id"]
    assert_equal "sample", res["name"]
  end
  def test_json_data_client_create
    body = {"my_name_is" =>"appiaries"}
    @client.create(body)
    assert_equal "appiaries", res["my_name_is"]
  end
  def test_json_data_client_update
    body = {"my_name_is" =>"to be updated"}
    @client.create(body)
    assert_equal "to be updated", res["my_name_is"]
    object_id = res["_id"]
    
    newbody = {"my_name_is" => "SAYAKA", "greeting" => "hello"}
    @client.update(object_id, newbody)
    assert_equal "SAYAKA", res["my_name_is"]
    assert_equal "hello", res["greeting"]
  end
  def test_json_data_client_update_field
    body = {"my_name_is" =>"to be field updated", "stay" => "no change", "replace_me" => "please"}
    @client.create(body)
    assert_equal "please", res["replace_me"]
    object_id = res["_id"]
    
    new_field = {"replace_me" => "completed"}
    @client.update(object_id, newbody)
    assert_equal "completed", res["replace_me"]
  end
  def test_json_data_client_update_delete
    body = {"my_name_is" =>"to be deleted"}
    @client.create(body)
    assert_equal "to be deleted", res["my_name_is"]
    object_id = res["_id"]
    
    @client.delete(object_id)
    # TODO assert
  end
  def test_json_data_client_update_query
    # TODO implement
  end
end