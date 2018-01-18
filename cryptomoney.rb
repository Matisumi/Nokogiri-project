require 'rubygems'
require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

cryptomancer = Hash.new

cash = page.css('a.price')
money = page.css('a.currency-name-container')

while true
	i = 0
	puts "generating the crypto money grid"
	while i < 1448


		cryptomancer[money[i]['href'][12...-1]] = cash[i]['data-usd'] + " $"
		
		i += 1 
	end

	puts cryptomancer
	puts "------------------"
	puts "sleping 60sec"
	sleep(3600)
end

