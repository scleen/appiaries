# -*- encoding : utf-8 -*-
require 'test/unit'
require 'appiaries'
require 'yaml'

APP_ID       = 'smilein5sec'
DATASTORE_ID = '_sandbox'

class JsonDataClientQueryTest < Test::Unit::TestCase
  def setup
    @config = YAML.load(File.open(File.join(File.dirname(__FILE__), 'config.yml')).read)
    apptoken = @config['appiaries_app_token']
    collection_id = "json_for_query_test"
    @client = Appiaries::JsonDataClient.new(:application_token => apptoken, :application_id => APP_ID, :datastore_id => DATASTORE_ID, :collection_id => collection_id)
    # puts "#{apptoken} is ready"
  end
  
  def test_json_data_client_query_eq
    query = Appiaries::Query.new()
    query.eq("name","Kyoko")
    res = @client.get(query)
    assert_equal 1, res['_objs'].length
  end
  def test_json_data_client_query_eq_numeric
    query = Appiaries::Query.new()
    query.eq("age",20)
    res = @client.get(query)
    assert_equal 1, res['_objs'].length
  end
end