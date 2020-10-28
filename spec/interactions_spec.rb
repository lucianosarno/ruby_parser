require '../lib/interactions.rb'

describe Interaction do
  describe '#communicate' do
  inter = Interaction.new
    it 'communicate return nil' do
      expect(inter.communicate('abc','question')).to eql(nil)
    end
  end
end