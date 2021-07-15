require 'nokogiri'
require 'open-uri'

#programme récupérer mail

puts "renseigne l'url ici"
lien = gets.chomp.to_s
page = Nokogiri::HTML(open("#{lien}"))

all_emails_links = page.xpath('//a[contains(@href, "mailto")]')
all_emails_links.each do |email_link|
    puts "voici les emails : #{email_link.text}"
  end

programme récupérer numéros de tel

puts "renseigne l'url ici"
lien = gets.chomp
page = Nokogiri::HTML(open("#{lien}"))

 all_num = page.xpath('//a[contains(text(), "+33 6")]') || page.xpath('//a[contains(text(), "+33 7")]') || page.xpath('//a[contains(text(), "06")]') || page.xpath('//a[contains(text(), "07")]')
 all_num.each do |num|
    puts "voici les numéros : #{num.text}"
  end