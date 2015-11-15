class WordList
  WORD_FILE = '/usr/share/dict/words'

  def initialize
    load_words
  end

  def include?(word)
    @words.include?(word)
  end

  def exclude?(word)
    !@words.include?(word)
  end

  def select(&block)
    @words.select &block
  end

  private

  def load_words
    File.open(WORD_FILE) do |word_file|
      @words = word_file.readlines.map { |line| line.downcase.chomp }
    end
  end
end
