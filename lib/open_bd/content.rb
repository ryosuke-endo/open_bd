module OpenBd
  class Content
    attr_reader :source

    def initialize(source)
      @source = source
    end

    def content
      value = source.find { |x| x["TextType"] == "02" }
      if !value.nil?
        value["Text"]
      end
    end

    def content_detail
      value = source.find { |x| x["TextType"] == "03" }
      if !value.nil?
        value["Text"]
      end
    end

    def table_of_contents
      value = source.find { |x| x["TextType"] == "04" }
      if !value.nil?
        value["Text"]
      end
    end
  end
end
