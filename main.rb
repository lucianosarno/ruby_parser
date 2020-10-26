
require 'Nokogiri'
require 'open-uri'
cagometro = Nokogiri::HTML(URI.open("http://www.cagometro.com/"))
cagadas = cagometro.css("a")
puts cagadas[5..cagadas.length - 9]