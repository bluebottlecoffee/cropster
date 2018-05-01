require 'test_helper'

class Cropster::ProjectTest < Test::Unit::TestCase
  def test_project_success
    register_fixtures
    load_fixture(:project_success)
    project = Cropster::Project.new(cropster_client).project("AA")
    assert_match(/AA/, project.id)
    assert_match(/My Project/, project.name)
    assert_match(/More project details/, project.description)
  end

  def test_projects_success
    register_fixtures
    load_fixture(:projects_success)
    projects = Cropster::Project.new(cropster_client).projects
    assert_equal 1, projects.length
  end

  def register_fixtures
    url = fixture_url("projects/AA")
    register_fixture(:project_success, :get, url, "project_success.json")
    url = fixture_url("projects?filter[projects][group]=CROR")
    register_fixture(:projects_success, :get, url, "projects_success.json")
  end
end
