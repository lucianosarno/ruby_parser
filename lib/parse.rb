# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

#this class is responsible for the methods that catches the information from 'cagometro.com' and organize in a structured way
class Parse
  def initialize
    @cagometro = Nokogiri::HTML(URI.open('http://www.cagometro.com/'))
  end

  def catch_cagadas
    @cagadas = @cagometro.xpath('//p[contains(.,"2020") or contains(.,"2019")]//text() | //p[contains(.,"Dia")]//a//text() | //p[contains(.,"2020") or contains(.,"2019")]//a//text()')
  end

  def organize_cagadas
    portuguese_months = {'JANEIRO': 1, 'FEVEREIRO': 2, 'MARÇO': 3, 'ABRIL': 4, 'MAIO': 5, 'JUNHO': 6, 'JULHO': 7, 'AGOSTO': 8, 'SETEMBRO': 9, 'OUTUBRO': 10, 'NOVEMBRO': 11, 'DEZEMBRO': 12}
    @cagadas.each do |cagada|
      cagada_string = cagada.to_s
      year = 0
      if cagada_string.include? '2020' || cagada_string.include? '2020'
      if cagada_string.include? "2020"
        year = 2020
      elsif cagada_string.include? "2019"
        year = 2019
      end
      puts cagada if cagada_string.include? "2020"
      month = 0
      day = 0
      title = ''

    end
  end
end
