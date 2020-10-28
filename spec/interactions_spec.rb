require '../lib/interactions.rb'

describe Interaction do
  inter = Interaction.new
  describe '#communicate' do
    it "communicate('abc','a') should puts 'abc'" do
      expect {inter.communicate('abc','a')}.to output("abc\n").to_stdout
    end  
  end
  describe '#ask_name' do
    it "gets name 'Joe' when user inputs 'Joe'" do
      allow_any_instance_of(Interaction).to receive(:gets).and_return('class')
      expect(inter.ask_name).to eq('class')
    end 
  end
end
