require_relative '../lib/parse.rb'
require_relative '../lib/interactions.rb'

run = Interaction.new
name = run.ask_name
know_cagada_str = run.know_cagada_str(name)
puts know_cagada_str
know_cagada_bool = run.know_cagada_bool(know_cagada_str)
run.cagada_talks(know_cagada_bool)
run.explain_program

cagadas = Parse.new
cagadas.catch_cagadas
cagadas.organize_cagadas
