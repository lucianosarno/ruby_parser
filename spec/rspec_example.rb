class ConsoleInterface
  def initialize(input: $stdin, output: $stdout)
    @input = input
    @output = output
  end
  def ask_question
    @output.puts "Would you like to continue? [yN]"
  end
  def answer
    @input.gets.chomp.downcase
  end
end
RSpec.describe ConsoleInterface do
  describe '#ask_question' do
    it 'sends a prompt question to output' do
      output = StringIO.new
      console_interface = ConsoleInterface.new(output: output)
      console_interface.ask_question
      expect(output.string).to include("continue?")
    end
  end
  describe '#answer' do
    it 'returns a formatted string received from input' do
      input = StringIO.new("iNPut\n")
      console_interface = ConsoleInterface.new(input: input)
      expect(console_interface.answer).to eq("input")
    end
  end
end