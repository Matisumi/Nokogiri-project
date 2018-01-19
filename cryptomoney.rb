#gems required to make the code work
require 'rubygems'
require 'nokogiri'
require 'open-uri'


def crypto_grid()
	#asking nokogiri to get the html code of the named site
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	
	#creating a new hash
	cryptomancer = Hash.new
	#puting the location of the information I want in a variable
	cash = page.css('a.price')
	money = page.css('a.currency-name-container')
	
	#infinite loops so the program never stops
	while true
		i = 0   #counter for the while
		puts "generating the crypto money grid" #status message
		while i < 1448 #1448 'cause there is 1448 currencies listed on the site

			#gives to the tab the hash id  contained in money and its value contained in cash
			cryptomancer[money[i]['href'][12...-1]] = cash[i]['data-usd'] + " $"
			
			#add 1 to the i value that is used to switch currency and price at each while loop
			i += 1 
		end

		puts cryptomancer #print the list of currencies and their prices 
		puts "\n"  #empty line
		puts "Cryptocurrencie's values at #{Time.now}" #tell us when the grid was checked
		puts "------------------" #separating line
		puts "sleeping 1h"   #inform
		sleep(3600) #put program on hold for 1h (3600 seconds)
	end
end
