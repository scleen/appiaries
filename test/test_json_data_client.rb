# -*- encoding : utf-8 -*-
require 'test/unit'
require 'appiaries'
require 'yaml'

APP_ID       = 'smilein5sec'
DATASTORE_ID = '_sandbox'
COLLECTION_ID= 'thumbnails'

class FileDataClientTest < Test::Unit::TestCase
  def setup
    @config = YAML.load(File.open(File.join(File.dirname(__FILE__), 'config.yml')).read)
    @apptoken = @config['appiaries_app_token']
    puts "#{@apptoken} is ready"
  end
  def test_file_data_client_get
    # TODO implement
  end
  def test_file_data_client_get_binary
    # TODO implement
  end
  def test_file_data_client_create
    # TODO implement
  end
  def test_file_data_client_update
    # TODO implement
  end
  def test_file_data_client_update_field
    # TODO implement
  end
  def test_file_data_client_update_delete
    # TODO implement
  end
  def test_file_data_client_update_query
    # TODO implement
  end
end