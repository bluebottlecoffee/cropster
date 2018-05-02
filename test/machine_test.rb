require 'test_helper'

class Cropster::MachineTest < Test::Unit::TestCase
  def test_machines_success
    register_fixtures
    load_fixture(:machines_success)
    machines = Cropster::Machine.new(cropster_client).machines
    assert_equal 1, machines.length
  end

  def test_machine_success
    register_fixtures
    load_fixture(:machine_success)
    machine = Cropster::Machine.new(cropster_client).machine("AA")
    assert_match(/AA/, machine.id)
  end

  def register_fixtures
    url = fixture_url("machines?filter[machines][group]=CROR")
    register_fixture(:machines_success, :get, url, "get_machines_success.json")
    url = fixture_url("machines/AA")
    register_fixture(:machine_success, :get, url, "get_machine_success.json")
  end
end
