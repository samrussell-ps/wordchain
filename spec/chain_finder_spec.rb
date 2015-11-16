require 'spec_helper'
require './lib/word_list'
require './lib/word_node'
require './lib/chain_finder'

describe ChainFinder do
  let(:word_list) { WordList.new }
  let(:initial) { WordNode.new('cat', word_list) }
  let(:target) { WordNode.new('dog', word_list) }
  subject(:chain_finder) { ChainFinder.new(initial) }

  it 'finds a chain from cat to dog' do
    expect(chain_finder.find(target)).to_not eq([])
  end
end
