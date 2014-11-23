module Kibana
  module Rack
    class Web < Sinatra::Base
      def proxy
        es_host = settings.elasticsearch_host
        es_port = settings.elasticsearch_port
        if @proxy.nil?
          @proxy = Faraday.new(url: "https://#{es_host}")
          @proxy.basic_auth(ENV['ES_USER'], ENV['ES_PASSWORD'])
        end
        @proxy
      end
    end
  end
end
