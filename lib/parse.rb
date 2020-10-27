require 'nokogiri'
require 'open-uri'

class Parse
  def initialize
    cagometro = Nokogiri::HTML(URI.open('http://www.cagometro.com/'))
  end

  # def catch_cagadas
  #   cagadas = cagometro.xpath('//p[contains(.,"2020") or contains(.,"DE 2019")]//text() | //p[contains(.,"Dia")]//a//text() | //p[contains(.,"2020") or contains(.,"DE 2019")]//a//text()')
  # end
end
