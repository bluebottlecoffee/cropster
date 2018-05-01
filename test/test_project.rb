require 'test_helper'

class Cropster::ProjectTest < Test::Unit::TestCase
  def test_project_success
    register_project_fixture
    load_fixture(:project_success)
    project = Cropster::Project.new(cropster_client).project("AA")
    assert_match(/AA/, project.id)
    assert_match(/My Project/, project.name)
    assert_match(/More project details/, project.description)
  end

  def test_projects_success
    register_projects_fixture
    load_fixture(:projects_success)
    projects = Cropster::Project.new(cropster_client).projects
    assert_equal 1, projects.length
  end

  def register_project_fixture
    url = "https://foo:bar@private-anon-e2e6946d27-cropstercore.apiary-mock.com/api/v2/projects/AA"
    WebMock::Fixtures::Manager.register_fixture_file(
      :project_success, :get, url, "test/fixtures/project_success.json"
    )
  end

  def register_projects_fixture
    url = "https://foo:bar@private-anon-e2e6946d27-cropstercore.apiary-mock.com/api/v2/projects?filter[projects][group]=CROR"
    WebMock::Fixtures::Manager.register_fixture_file(
      :projects_success, :get, url, "test/fixtures/projects_success.json"
    )
  end
end
