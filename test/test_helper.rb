require 'simplecov'
require 'webmock'
require 'webmock/fixtures'
require 'webmock/test_unit'

require 'rubygems'
require 'bundler'
require 'test/unit'
require 'cropster'

module SimpleCov::Configuration
  def clean_filters
    @filters = []
  end
end

SimpleCov.configure do
  clean_filters
  load_profile 'test_frameworks'
end

SimpleCov.start

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

class Test::Unit::TestCase; end

def cropster_client
  Cropster::Client.new({
    api_key: "foo",
    api_secret: "bar",
    test_mode: true,
    group_code: "CROR"
  })
end

def load_fixture(fixture)
  WebMock::Fixtures::Manager.run([fixture])
end

def register_fixture(fixture, operation, url)
  file = "test/fixtures/#{fixture.to_s}.json"
  WebMock::Fixtures::Manager.
    register_fixture_file(fixture, operation, url, file)
end

def fixture_url(url)
  "https://foo:bar@private-anon-e2e6946d27-cropstercore.apiary-mock.com/api/v2/#{url}"
end
