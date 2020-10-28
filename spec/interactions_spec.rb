require '../lib/interactions.rb'

describe Interaction do
  inter = Interaction.new
  describe '#communicate' do
    it "communicate('abc','a') should puts 'abc'" do
      expect {inter.communicate('abc','a')}.to output("abc\n").to_stdout
    end  
  end
  describe '#ask_name' do
    it 'gets the name inputed by user' do
      allow_any_instance_of(Interaction).to receive(:gets).and_return('class')
      expect(inter.ask_name).to eq('class')
    end 
  end
  describe '#ask_enter' do
    it 'gets the ENTER inputed by user' do
      allow_any_instance_of(Interaction).to receive(:gets).and_return('class')
      expect(inter.ask_enter).to eq('class')
    end 
  end  
  describe '#ask_y_or_n' do
    it 'gets the ENTER inputed by user' do
      allow_any_instance_of(Interaction).to receive(:gets).and_return('class')
      expect(inter.ask_y_or_n).to eq('class')
    end 
  end  
  describe '#cagada_talks' do
    it "cagada_talks should return true" do
      expect(inter.cagada_talks).to eql(true)
    end  
  end  
end
