# frozen_string_literal: true

require_relative '../lib/parse.rb'
require_relative '../lib/interactions.rb'

run = Interaction.new
run.communicate('a', 'a')
run.ask_name
run.cagada_talks
