# -*- encoding : utf-8 -*-
require 'test/unit'
require 'appiaries'
require 'yaml'

class AppiariesQueryTest < Test::Unit::TestCase
  def setup
    @config = YAML.load(File.open(File.join(File.dirname(__FILE__), 'config.yml')).read)
  end
  def teardown
  end
  
  def test_eq
    query = Appiaries::Query.new()
    query.eq("key","value")
    c = query.to_cond
    assert_equal "-;key.eq.value;", c
  end
  def test_neq
    query = Appiaries::Query.new()
    query.neq("key","value")
    c = query.to_cond
    assert_equal "-;key.neq.value;", c
  end
  def test_is
    query = Appiaries::Query.new()
    query.is("key","value")
    c = query.to_cond
    assert_equal "-;key.is.value;", c
  end
  def test_is_null
    query = Appiaries::Query.new()
    query.is("key",nil)
    c = query.to_cond
    assert_equal "-;key.is.null;", c
  end
  def test_isn
    query = Appiaries::Query.new()
    query.isn("key","value")
    c = query.to_cond
    assert_equal "-;key.isn.value;", c
  end
  def test_isn_null
    query = Appiaries::Query.new()
    query.isn("key",nil)
    c = query.to_cond
    assert_equal "-;key.isn.null;", c
  end
  def test_lt
    query = Appiaries::Query.new()
    query.lt("key","value")
    c = query.to_cond
    assert_equal "-;key.lt.value;", c
  end
  def test_lte
    query = Appiaries::Query.new()
    query.lte("key","value")
    c = query.to_cond
    assert_equal "-;key.lte.value;", c
  end
  def test_gt
    query = Appiaries::Query.new()
    query.gt("key","value")
    c = query.to_cond
    assert_equal "-;key.gt.value;", c
  end
  def test_gte
    query = Appiaries::Query.new()
    query.gte("key","value")
    c = query.to_cond
    assert_equal "-;key.gte.value;", c
  end
  def test_sw
    query = Appiaries::Query.new()
    query.sw("key","value")
    c = query.to_cond
    assert_equal "-;key.sw.value;", c
  end
  def test_nsw
    query = Appiaries::Query.new()
    query.nsw("key","value")
    c = query.to_cond
    assert_equal "-;key.nsw.value;", c
  end
  def test_in
    query = Appiaries::Query.new()
    query.in("key","value")
    c = query.to_cond
    assert_equal "-;key.in.value;", c
  end
  def test_in_array
    query = Appiaries::Query.new()
    query.in("key",["value1","value2"])
    c = query.to_cond
    assert_equal "-;key.in.value1,value2;", c
  end
end