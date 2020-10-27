# frozen_string_literal: true

require 'colorize'
require 'tty-font'
#this class embraces all user interactions
class Interaction
  def initialize; end

  def communicate(phrase, _type = 'information')
    case _type
    when 'welcome', 'spotlight'
      font = TTY::Font.new(:standard)
      puts font.write(phrase).colorize(:green).to_s
    when 'information', 'question'
      puts phrase.colorize(:green).to_s
    when 'call_action'
      puts phrase.colorize(:yellow).to_s
    else
      puts phrase.colorize(:yellow).to_s
    end
  end

  def ask_name
    communicate('Welcome dear visitor!', 'welcome')
    communicate('What is your name?', 'question')
    @name = ''
    while @name == ''
      communicate('(Type your name and ENTER please!)', 'call_action')
      @name = gets.chomp
    end
    @name
  end

  def ask_enter
    communicate('(please type ENTER to continue)', 'call_action')
    gets.chomp
  end

  def cagada_talks
    know_cagada = ''
    until know_cagada == 'Y' || know_cagada == 'N'
      communicate("#{@name}, tell me: do you know what means 'cagada'?", 'question')
      communicate('(Please type Y or N)', 'call_action')
      know_cagada = gets.chomp
    end
    cagada_definition = "he literal translation to english is 'shit', but is popularly used to name as 'cagada' some very bad thing that happened or a very bad mistake someone did."
    cagada_importance = "ar away worst than use something that sounds a bad word, is to have a president that do tons of terrible mistakes, all of them fairly called 'cagadas', and these mistakes have serious consequences to people in real world, particularly in our country."
    if know_cagada == 'N' || know_cagada == 'n'
      communicate("T#{cagada_definition}", 'information')
      ask_enter
      communicate("F#{cagada_importance}", 'information')
      ask_enter
    else
      communicate("Okay, you already knows that t#{cagada_definition}", 'information')
      ask_enter
      communicate("I presume you also knows already that, f#{cagada_importance}", 'information')
      ask_enter
    end
  end

  def explain_program
    communicate("Okay, now we are already 'conceptual leveled'.", 'information')
    communicate("Let's go through...", 'information')
    ask_enter
    communicate('NUTS AND BOLTS!', 'spotlight')
    ask_enter
    communicate("This program has the job to catch information from a website called 'cagometro' (in English, it would be translated as some like 'shitometer').", 'information')
    communicate("This website, although unfortunately seems to be no longer being updated, catch from daily news all the (almost infinite) 'cagadas' from Brasil actual President Jair Bolsonaro.", 'information')
    ask_enter
    communicate("To be honest, while developing this program and looking the website, I'm remembering thousands of other and worst 'cagadas' done by our president that are not mentioned in the 'cagometro' website...", 'information')
    ask_enter
    communicate("...but I understand that catch all those things, would require a lot of effort!", 'information')
    ask_enter
    communicate('So much effort that only giant companies like Google, Facebook and few others could carry on!', 'information')
    ask_enter
    communicate('So much effort that only giant companies like Google, Facebook and few others could carry on!', 'information')
    ask_enter
    end
end