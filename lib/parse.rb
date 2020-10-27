# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

#this class is responsible for the methods that catches the information from 'cagometro.com' and organize in a structured way
class Parse
  def initialize
    @cagometro = Nokogiri::HTML(URI.open('http://www.cagometro.com/'))
  end

  def catch_cagadas
    @cagadas = @cagometro.xpath('//p[contains(.,"2020") or contains(.,"DE 2019")]//text() | //p[contains(.,"Dia")]//a//text() | //p[contains(.,"2020") or contains(.,"DE 2019")]//a//text()')
  end

  def organize_cagadas
    @cagadas.each do |cagada|
      year = 0
      if cagada.include?("2020")
        year = 2020
      elsif cagada.include?("2019")
        year = 2019
      end
      puts year
      month = 0
      day = 0
      title = ''

    end
  end
end
