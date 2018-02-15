module OpenBD
  class Response
    def initialize(response)
      @response = response
    end

    def body
      @response.body
    end

    def empty?
      @response.body.all?(&:nil?)
    end

    def resources
      body.map do |source|
        OpenBD::Resource.new(source)
      end
    end

    def status
      @response.status
    end
  end
end
