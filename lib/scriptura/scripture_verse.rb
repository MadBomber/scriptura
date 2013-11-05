module Scriptura
  class ScriptureVerse
    attr_accessor :scripture_chapter
    attr_accessor :number

    def initialize *args
      case
      when args.count == 1 && args[0].is_a?(Fixnum)
        raise ArgumentError, 'normalized value of scripture verse cannot be converted to an integer' unless args[0].respond_to?(:to_i)
        book_number, chapter_number, verse_number = de_normalize(args[0]) 
      when args.count == 3 
        book_number, chapter_number, verse_number = args
      end
      @scripture_chapter = ScriptureChapter.new(book_number, chapter_number)
      raise ArgumentError, 'verse number cannot be converted to an integer' unless verse_number.respond_to?(:to_i)
      raise 'verse number does not exist' unless (1..@scripture_chapter.number_of_verses).cover? verse_number.to_i
      @number = verse_number.to_i
    end

    def scripture_book
      @scripture_chapter.scripture_book
    end

    def normalize
      scripture_book.number * 1000000 + scripture_chapter.number * 1000 + @number
    end

    private 

    def de_normalize number
      quotient, verse_number = number.divmod(1000) 
      book_number, chapter_number = quotient.divmod(1000) 
      [book_number, chapter_number, verse_number]
    end

  end
end