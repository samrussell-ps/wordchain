require 'spec_helper'
require './lib/word_list'

describe WordList do
  subject(:word_list) { WordList.new }
  let(:real_words) {
    [
      'mouse',
      'car',
      'bicycle'
    ]
  }
  let(:made_up_words) {
    [
      'auifenlkj',
      'tronkgjar'
    ]
  }

  it 'contains real words' do
    real_words.each do |real_word|
      puts "testing #{real_word}"
      expect(word_list.include?(real_word)).to be true
      expect(word_list.exclude?(real_word)).to be false
    end
  end

  it 'does not contain made up words' do
    made_up_words.each do |made_up_word|
      expect(word_list.include?(made_up_word)).to be false
      expect(word_list.exclude?(made_up_word)).to be true
    end
  end

  it 'passes select on to word_list' do
    expect(word_list.select { |word| word == 'banana' }).to contain_exactly('banana')
  end
end
