# frozen_string_literal: true

require_relative '../lib/parse.rb'
require_relative '../lib/interactions.rb'

run = Interaction.new
run.ask_name
run.cagada_talks
run.explain_program

cagadas = Parse.new
cagadas.catch_cagadas
cagadas.organize_cagadas