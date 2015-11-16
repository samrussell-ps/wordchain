class WordNode
  attr_reader :word

  def initialize(word, word_list)
    @word = word
    @word_list = word_list
  end

  def neighbors
    @word_list.select { |word_from_list| one_letter_different?(word_from_list) }
      .map { |word_from_list| WordNode.new(word_from_list, @word_list) }
  end

  def ==(other)
    @word == other.word
  end

  def eql?(other)
    self == other
  end

  def hash
    @word.hash
  end

  private

  def one_letter_different?(word_from_list)
    return false if word_from_list.length != @word.length

    number_of_different_chars = @word.chars.zip(word_from_list.chars).count { |pair| pair[0] != pair[1] }

    number_of_different_chars == 1
  end
end
