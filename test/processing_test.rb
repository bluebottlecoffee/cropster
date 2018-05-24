require 'test_helper'

class Cropster::ProcessingTest < Test::Unit::TestCase
  def test_initialize
    processing = Cropster::Processing.new(cropster_client)
    assert_not_nil processing
  end

  def test_processings
    register_fixtures
    load_fixture(:get_processings_success)
    processings = Cropster::Processing.new(cropster_client).processings
    assert_equal 1, processings.length
    processing = processings.first
    assert_equal "John Doe", processing.worker
  end

  def test_processing
    register_fixtures
    load_fixture(:get_processing_success)
    processing = Cropster::Processing.new(cropster_client).processing("AA")
    assert_equal("John Doe", processing.worker)
    assert_match(/processing notes/, processing.notes)
  end

  def register_fixtures
    url = fixture_url("processings/AA")
    register_fixture(:get_processing_success, :get, url)

    # url = fixture_url("processings][profile?filter[processings][group]=CROR&sort[processings][startDate]=desc")
    url = fixture_url("processings?filter[processings][group]=CROR")
    register_fixture(:get_processings_success, :get, url)
  end
end
