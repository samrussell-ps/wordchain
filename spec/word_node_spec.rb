require 'spec_helper'
require './lib/word_node'
require './lib/word_list'

describe WordNode do
  let(:word_list) { WordList.new }
  let(:word) { 'cat' }
  subject(:word_node) { WordNode.new(word, word_list) }

  it 'exposes "word"' do
    expect(word_node.word).to eq(word)
  end

  it 'is equal to another instance with the same word' do
    other_word_node = WordNode.new(word, word_list)

    expect(word_node).to eq(other_word_node)
    expect(word_node.hash).to eq(other_word_node.hash)
  end

  describe '#neighbors' do
    let(:neighbor_words) {
      [
        'bat',
        'eat',
        'fat',
        'gat',
        'hat',
        'kat',
        'jat',
        'lat',
        'mat',
        'nat',
        'oat',
        'pat',
        'rat',
        'sat',
        'tat',
        'vat',
        'wat',
        'yat',
        'zat',
        'cit',
        'cot',
        'cut',
        'cab',
        'cad',
        'cag',
        'cal',
        'cam',
        'can',
        'cap',
        'car',
        'caw',
        'cay'
      ]
    }
    let(:neighbors) { 
      neighbor_words.map do |word|
        WordNode.new(word, word_list)
      end
    }

    it 'finds all the neighbor word nodes' do
      expect(word_node.neighbors).to contain_exactly(*neighbors)
    end
  end
end
