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
	puts "\n"
	puts "Cryptocurrencie's values at #{Time.now}"
	puts "------------------"
	puts "sleping 1h"
	sleep(3600)
end

