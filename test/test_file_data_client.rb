# -*- encoding : utf-8 -*-
require 'test/unit'
require 'appiaries'
require 'yaml'

APP_ID       = 'smilein5sec'
DATASTORE_ID = '_sandbox'
COLLECTION_ID= 'thumbnails'

class JsonDataClientTest < Test::Unit::TestCase
  def setup
    @config = YAML.load(File.open(File.join(File.dirname(__FILE__), 'config.yml')).read)
    @apptoken = @config['appiaries_app_token']
    puts "#{@apptoken} is ready"
  end
  def test_json_data_client_get
    collection_id = "sample_json_data"
    client = Appiaries::JsonDataClient.new(:application_token => @apptoken, :application_id => APP_ID, :datastore_id => DATASTORE_ID, :collection_id => collection_id)
    res = client.get("sample")
    assert_equal "sample", res["_id"]
    assert_equal "sample", res["name"]
  end
  def test_json_data_client_create
    # TODO implement
  end
  def test_json_data_client_update
    # TODO implement
  end
  def test_json_data_client_update_field
    # TODO implement
  end
  def test_json_data_client_update_delete
    # TODO implement
  end
  def test_json_data_client_update_query
    # TODO implement
  end
end