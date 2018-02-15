module OpenBD
  class Contributor
    attr_reader :source

    ROLE_MAP = {
      "A01" => "著者",
      "B06" => "翻訳者"
    }.freeze

    def initialize(source)
      @source = source
    end

    def description
      source.dig("BiographicalNote")
    end

    def kana_name
      source.dig("PersonName", "collationkey")
    end

    def name
      source.dig("PersonName", "content")
    end

    def role
      roles.first
    end

    def roles
      source.dig("ContributorRole").map do |role|
        ROLE_MAP[role]
      end
    end
  end
end
