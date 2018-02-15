module OpenBD
  class Title
    attr_reader :source

    def initialize(source)
      @source = source
    end

    def title
      if sub_title.nil?
        return main_title
      end

      "#{main_title} #{sub_title}"
    end

    def main_title
      source.dig("TitleDetail", "TitleElement", "TitleText", "content")
    end

    def sub_title
      source.dig("TitleDetail", "TitleElement", "Subtitle", "content")
    end
  end
end
