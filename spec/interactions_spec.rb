require '../lib/interactions.rb'

describe Interaction do
  describe '#communicate' do
  inter = Interaction.new
    it "communicate('abc','a') should puts 'abc'" do
      expect {inter.communicate('abc','a')}.to output("abc\n").to_stdout
    end
  end
end
