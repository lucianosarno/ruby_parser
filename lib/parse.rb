# frozen_str_literal: true

require 'nokogiri'
require 'open-uri'
require 'date'

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
    year = 0
    month_i = 0
    day_i = 0
    @cagadas[0..10].each do |cagada|
      cagada_str = cagada.to_s
      title = ''
      if cagada_str.include? ' DE '
        if cagada_str.include? "2020"
          year = 2020
        elsif cagada_str.include? "2019"
          year = 2019
        end
        month_str = cagada_str[0, cagada_str.length - 8]
        month_i = portuguese_months[month_str.to_sym]
      elsif cagada_str.include? 'Dia'
        day_i = cagada_str[-2, cagada_str.length - 1].to_i
        date = Date.new(year,month_i,day_i)
      else
        title = cagada_str
      end
      puts cagada_str
      puts "#{date} | #{title}" unless date == nil || title == ''
    end
  end
end
