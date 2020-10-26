require 'nokogiri'
require 'open-uri'
cagometro = Nokogiri::HTML(URI.open('http://www.cagometro.com/'))

cagadas = cagometro.css('a')
cagadas[5..cagadas.length - 9].each do |link|
  puts link.content
end
