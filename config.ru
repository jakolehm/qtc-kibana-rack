require 'kibana/rack'
require_relative 'lib/kibana/rack/web'

Kibana.configure do |config|
  config.elasticsearch_host = ENV['ES_HOST']
  #config.kibana_dashboards_path = File.expand_path('../path/to/dashboards', __FILE__)
  #config.kibana_default_route = '/dashboard/file/default.json'
  #config.kibana_index = 'kibana-int'
end

map '/kibana' do
  use Rack::Auth::Basic, 'Restricted Access' do |username, password|
    username == ENV['USERNAME'] && password == ENV['PASSWORD']
  end

  run Kibana::Rack::Web
end
