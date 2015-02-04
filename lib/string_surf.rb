
class String_Surf

  EMPTY = ''.freeze

  class Pos

    attr_reader :pos

    def initialize surf, start = 0, fin = nil
      @start = start
      @pos   = @start
      @surf  = surf
      @fin   = fin || (surf.origin.size - 1)
      @cache = {}
    end

    def start_at_and_back_find pos, target
      return nil if target.is_a?(String) && (pos <= @start || pos > @fin)

      start = pos
      char = nil
      found = false
      begin
        start = start - 1
        char  = @surf.origin[start]
        case target
        when :black_start
          if char.strip == EMPTY
            found = true
            start = start + 1
          end
        end
      end while !found && start >= @start && char != target

      return 0 if target == :black_start && !found
      return nil if char != target && target.is_a?(String)
      start
    end

    def start_at_and_find pos, target
      return nil if pos < @start || pos >= @fin

      # Add one to position because we do not want to
      # search the char of the cursor.
      @surf.origin.index(target, pos + 1)
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

      if !whitespace? # then move cursor to next whitespace
        while start_word < @fin && @surf.origin[start_word + 1].strip != EMPTY
          start_word = start_word + 1
        end
      end

      # Move cursor to last non-whitespace
      while start_word < @fin && @surf.origin[start_word + 1].strip == EMPTY
        start_word = start_word + 1
      end

      # Move cursor to first non-whitespace
      start_word = start_word + 1

      # Return nil if cursor is at the end of text.
      return nil if start_word >= @surf.origin.size

      # Get position of last character in word.
      end_word = start_word
      while end_word < @fin && @surf.origin[end_word + 1].strip != EMPTY
        end_word = end_word + 1
      end

      length = (end_word - start_word) + 1
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
      @surf.origin[@pos]
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
