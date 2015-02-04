
class String_Surf

  EMPTY = ''.freeze

  class Pos

    attr_reader :pos

    def initialize surf
      @pos   = 0
      @surf  = surf
      @cache = {}
      @scan  = String_Surf.scan @surf.origin
      @fin   = @scan.size - 1
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
        when :word_bound
          if char.strip == EMPTY
            found = true
            start = start + 1
          end
        end
      end while !found && start >= @start && char != target

      return 0 if target == :word_bound && !found
      return nil if char != target && target.is_a?(String)
      start
    end

    def start_at_and_find pos, target
      if target.is_a?(String)
        return nil if pos < @start || pos >= @fin

        # Add one to position because we do not want to
        # search the char of the cursor.
        return @surf.origin.index(target, pos + 1)
      end

      return nil if pos < @start || pos > @fin

      found = false
      char = nil
      begin
        pos = pos + 1
        char = @surf.origin[pos]
        case target
        when :word_bound
          if char.strip == EMPTY
            found = true
            pos = pos - 1
          end
        end
      end while !found && pos < @fin

      return nil unless found
      pos
    end

    def word
      @scan[@pos][0]
    end

    def next_word
      return nil if @pos >= @fin
      i = @pos
      found_word = nil
      begin
        i = i + 1
        found_word = @scan[i].first
        if !found_word
          return nil if @scan[i].last
        end
      end while i < @fin && !found_word
      found_word
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

    def scan s
      s.scan(/(\S+)|([^\n\S]+)|(\n)/)
    end

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
