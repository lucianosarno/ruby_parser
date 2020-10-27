require 'nokogiri'
require 'open-uri'
cagometro = Nokogiri::HTML(URI.open('http://www.cagometro.com/'))

cagadas = cagometro.xpath('//p[contains(.,"2020") or contains(.,"DE 2019")]//text() | //p[contains(.,"Dia")]//a//text() | //p[contains(.,"2020") or contains(.,"DE 2019")]//a//text()')
# puts cagadas.content
cagadas.each do |link|
  puts '---'
  puts link
end
