class Interaction
  def initialize
  end
  def ask_name
    puts 'Welcome dear visitor!'
    puts 'What is your name?'
    @name = ''
    while @name == ''
      puts '(Type your name and ENTER please!)'
      @name = gets.chomp
    end
    @name    
  end
  def ask_enter
    puts '(please type ENTER to continue)'
    gets.chomp    
  end
  def cagada_talks
    know_cagada = ''
    unless know_cagada == 'Y' || know_cagada == 'N'
      puts "#{@name}, tell me: do you know what means 'cagada'?"
      puts '(Please type Y or N)'
      know_cagada = gets.chomp
    end
    cagada_definition = "he literal translation to english is 'shit', but is popularly used to name as 'cagada' some very bad thing that happened or a very bad mistake someone did."
    cagada_importance = "ar away worst than use something that sounds a bad word, is to have a president that do tons of terrible mistakes, all of them fairly called 'cagadas', and these mistakes have serious consequences to people in real world, particularly in our country."
    if know_cagada == 'N' || know_cagada == 'n'
      puts "T#{cagada_definition}"
      ask_enter
      puts "F#{cagada_importance}"
      ask_enter
    else
      puts "Okay, you already knows that t#{cagada_definition}"
      ask_enter
      puts "I also presume you already knows that, f#{cagada_importance}"
      ask_enter      
    end
  end
end