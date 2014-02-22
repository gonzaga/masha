require './lib/base_parser'

class HamlParser < BaseParser
  def self.extension
    "haml"
  end

  def self.convert_to_code(text)
    Haml::Engine.new(text).precompiled()
  end
end
