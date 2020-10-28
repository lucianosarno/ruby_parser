require '../lib/interactions.rb'

describe Interaction do
  describe '#communicate' do
  inter = Interaction.new
    it "communicate('abc','a') should puts 'abc'" do
      expect do
        Interaction.new.communicate('abc','a')
      end.to output('abc').to_stdout
    end
  end
end
