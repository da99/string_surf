
class String_Surf

  EMPTY = ''.freeze

  class Pos

    def initialize surf, start = 0, fin = nil
      @start = start
      @pos   = @start
      @surf  = surf
      @fin   = fin || (surf.origin.size - 1)
      @cache = {}
    end

    def word
      start_word = @pos
      return nil if @surf.origin[start_word].strip == EMPTY

      while start_word > @start && start_word <= @fin && @surf.origin[start_word - 1].strip != EMPTY
        start_word = start_word - 1
      end

      end_word = @pos
      while end_word < @fin && @surf.origin[end_word + 1].strip != EMPTY
        end_word = end_word + 1
      end

      length = (end_word - start_word) + 1
      return nil if length < 1
      @surf.origin[start_word, length]
    end

    def next_word
      start_word = @pos
      while start_word >= @start && start_word <= @fin && @surf.origin[start_word].strip != EMPTY
        start_word = start_word + 1
      end

      end_word = start_word
      while end_word >= @start && end_word <= @fin && @surf.origin[end_word].strip != EMPTY
        end_word = end_word + 1
      end

      length = end_word - start_word
      return nil if length < 1
      @surf.origin[start_word, length]
    end

    def first?
      @pos == @start
    end

    def last?
      @pos == @fin
    end

    def whitespace?
      char.strip == EMPTY
    end

    def char
      surf.origin[@pos]
    end

    def next!
      raise "End of text" if @pos >= @fin
      @pos = @pos + 1
    end

    def prev!
      raise "Start of text" if @pos <= @start
      @pos = @pos - 1
    end

  end # === class Pos ===

  class << self
  end # === class self ===

  attr_reader :origin

  def initialize str
    @origin = str
  end

  def describe *args
  end

  def run
  end

  def text
    @origin
  end

end # === class String_Surf ===
