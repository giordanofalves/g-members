# frozen_string_literal: true

module Bitly
  class API
    attr_reader :token

    def initialize
      @token = 'd1911342bcb4c737b97d2c6eefcf2834c1101e88'
    end

    def shorten(uri)
      response = connect(build_api, uri)
      json     = JSON.parse(response.body)
      json['link']
    end

    private

    def build_api
      URI::HTTPS.build(host: 'api-ssl.bitly.com', path: '/v4/bitlinks')
    end

    def connect(api, uri)
      https  = Net::HTTP.new(api.host, api.port)
      req    = Net::HTTP::Post.new(api.path,
                                   'Content-Type' => 'application/json',
                                   'Authorization' => "Bearer #{token}")
      req.body      = { "domain": 'bit.ly', "long_url": uri }.to_json
      https.use_ssl = true
      https.request(req)
    end
  end
end
