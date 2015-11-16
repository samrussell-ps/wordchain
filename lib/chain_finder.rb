require 'set'

class ChainFinder
  def initialize(initial)
    @initial = initial
  end

  def find(target)
    @target = target
    # breadth first search
    @tested_words = Set.new
    next_path = [ [@initial] ]

    find_path(next_path)
  end

  private

  def find_path(next_path)
    while true
      path = next_path.shift
      word = path.last
      puts "testing #{path.map { |word| word.word }}"
      return path if word == @target
      word.neighbors.each do |neighbor|
        unless @tested_words.include?(neighbor)
          @tested_words.add(neighbor)

          next_path << (path + [neighbor])
        end
      end
    end
  end
end
