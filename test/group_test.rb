require 'test_helper'

class Cropster::GroupTest < Test::Unit::TestCase
  def test_group_success
    register_fixtures
    load_fixture(:get_group_success)
    group = Cropster::Group.new(cropster_client).group("CROR")
    assert_match(/Cropster Roasting/, group.name)
  end

  def test_groups_success
    register_fixtures
    load_fixture(:get_groups_success)
    groups = Cropster::Group.new(cropster_client).groups
    assert_equal 1, groups.length
  end

  def register_fixtures
    url = fixture_url("groups/CROR")
    register_fixture(:get_group_success, :get, url)

    url = fixture_url("groups?filter[groups][group]=CROR")
    register_fixture(:get_groups_success, :get, url)
  end
end
