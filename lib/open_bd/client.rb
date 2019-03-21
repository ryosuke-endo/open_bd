require "faraday"
require "faraday_middleware"

module OpenBD
  class Client
    BASE_URL = "https://api.openbd.jp/".freeze
    VERSION = "v1".freeze
    URL = "#{BASE_URL}#{VERSION}".freeze
    SEARCH_PATH = "get"
    COVERAGE_PATH = "coverage"

    def search(isbns: [])
      query = [*isbns].join(',')
      response = connection.get(SEARCH_PATH, isbn: query)
      OpenBD::Response.new(response)
    end

    def coverage
      response = connection.get(COVERAGE_PATH)
      response.body
    end

    private

    def connection
      @connection ||= Faraday.new(URL) do |connection|
        connection.response :json
        connection.adapter Faraday.default_adapter
      end
    end
  end
end
