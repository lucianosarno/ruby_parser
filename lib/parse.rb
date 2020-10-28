# frozen_str_literal: true

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
      cagada_str = cagada.to_s
      year = 0
      if cagada_str.include? ' DE '
        if cagada_str.include? "2020"
          year = 2020
        elsif cagada_str.include? "2019"
          year = 2019
        end
        month_str = cagada_str[0, cagada_str.length - 8]
        month_int = portuguese_months[month_str.to_sym]
      end
      month = 0
      day = 0
      title = ''

    end
  end
end
