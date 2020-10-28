# frozen_string_literal: true

# frozen_str_literal: true
# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity, Layout/LineLength

require 'nokogiri'
require 'open-uri'
require 'date'

# this class is responsible for the methods that catches the information from 'cagometro.com' and organize in a structured way
class Parse
  def initialize
    @cagometro = Nokogiri::HTML(URI.open('http://www.cagometro.com/'))
  end

  def catch_cagadas
    @cagadas = @cagometro.xpath('//p[contains(.,"2020") or contains(.,"2019")]//text() | //p[contains(.,"Dia")]//a//text() | //p[contains(.,"2020") or contains(.,"2019")]//a//text()')
  end

  def organize_cagadas
    portuguese_months = { 'JANEIRO': 1, 'FEVEREIRO': 2, 'MARÇO': 3, 'ABRIL': 4, 'MAIO': 5, 'JUNHO': 6, 'JULHO': 7, 'AGOSTO': 8, 'SETEMBRO': 9, 'OUTUBRO': 10, 'NOVEMBRO': 11, 'DEZEMBRO': 12 }
    year = 0
    month_i = 0
    day_i = 0
    @cagadas.each do |cagada|
      cagada_str = cagada.to_s
      next if cagada_str.length < 5

      title = ''
      if cagada_str.include? ' DE 20'
        if cagada_str.include? '2020'
          year = 2020
        elsif cagada_str.include? '2019'
          year = 2019
        end
        month_str = cagada_str[0, cagada_str.length - 8]
        month_i = portuguese_months[month_str.to_sym]
      elsif cagada_str.include? 'Dia'
        day_i = cagada_str.gsub(/[^0-3|0-9]/, '').to_i
        @date = Date.new(year, month_i, day_i)
      else
        title = cagada_str
      end
      puts "#{@date} | #{title}" unless @date.nil? || title == ''
    end
  end
end
# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity, Layout/LineLength
