require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))


#name
  crypto_names = []
  page.xpath('//div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[2]/div/a[1]').each do |node| #on regarde tous les textes de la page et a chaque fois qu'on en trouve on l'affiche
  crypto_names.push(node.text)
  end
  #puts "les noms sont #{crypto_names}"
  #return crypto_names

#valeur
  crypto_value = []
  page.xpath('//div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a[1]').each do |node|
  crypto_value.push(node.text)
  end
  #puts "les valeurs sont #{crypto_value}"
  #return crypto_value



#hash méthode 1

hash = Hash[crypto_names.zip(crypto_value)]
puts hash

#hash méthode 2

  # hash = {}
  # i = 0
  # crypto_names.each do |name|
  # hash[name] = crypto_value[i]
  # i = i+1
  # end
  # puts hash

#methode pour les pages suivantes
  #page = []
  #2.times do |i|
  #page.push(Nokogiri::HTML(open("https://coinmarketcap.com/?page=#{i}")))
  #i += i
  #end
  #return page

# plusieurs page
#   page = []
#   2.times do |i|
#   page.push(Nokogiri::HTML(open("https://coinmarketcap.com/?page=#{i}")))
#   i += i
#   end
#   return page