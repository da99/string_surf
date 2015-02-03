
require 'Bacon_Colored'
require 'string_surf'
require 'pry'

def trim str
  str.split("\n".freeze).map { |line|
    line.strip
  }.join "\n".freeze
end
