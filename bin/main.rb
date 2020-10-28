# frozen_string_literal: true

require_relative '../lib/parse.rb'
require_relative '../lib/interactions.rb'

run = Interaction.new
name = run.ask_name
know_cagada = run.ask_y_or_n(name)
run.cagada_talks(know_cagada)
run.explain_program

cagadas = Parse.new
cagadas.catch_cagadas
cagadas.organize_cagadas