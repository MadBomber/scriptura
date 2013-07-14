class ScriptureChapter
  def initialize book_number, chapter_number
    @scripture_book = ScriptureBook.new(book_number)
    raise ArgumentError, 'chapter number cannot be converted to an integer' unless chapter_number.respond_to?(:to_i)
    raise 'book number should be within 1-66' unless (1..66).cover?(book_number.to_i)
    @chapter_hash = @scripture_book.to_hash['chapters'].find{|chapter| chapter['number'] == chapter_number.to_i}
    raise 'chapter does not exist' if @chapter_hash.nil?
  end

  def number
    @chapter_hash['number']
  end

  def number_of_verses
    @chapter_hash['verses']
  end
end

