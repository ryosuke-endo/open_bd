module OpenBD
  class Paper
    attr_reader :source

    def initialize(source)
      @source = source
    end

    def size
      source.dig("ProductForm")
    end

    def size_detail
      source.dig("ProductFormDetail")
    end

    def height
      values = source.dig("Measure")
      if !values.empty?
        value = values.find { |v| v["MeasureType"] == "01" }
        value["Measurement"]
      end
    end

    def width
      values = source.dig("Measure")
      if !values.empty?
        value = values.find { |v| v["MeasureType"] == "00" }
        value["Measurement"]
      end
    end
  end
end
