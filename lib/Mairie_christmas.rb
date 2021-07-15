require 'nokogiri'
require 'open-uri'

#obtenir une adresse mail en ayant le site de la mairie
def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))
  email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
  email.each do |email_link|
  puts email_link.text
  end
end


#obtenir une adresse mail en ayant l'url du département
def get_townhall_urls
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  url = [] 
  page.xpath('//a[contains(text(), "./95/")]').each do |node|
  #page.xpath('//*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[2]/p/a').each do |node|
  url.push(node.text)
  puts url
  end
end

get_townhall_urls



# def get_all_emails(global_url)
#   emails = [] 
#   global_url = "http://annuaire-des-mairies.com/"  
#   url = get_townhall_urls("http://annuaire-des-mairies.com/val-d-oise.html")                              
#   page = Nokogiri::HTML(open("#{global_url}/95/#{url}/.html")). each do |node| 
#   emails.push(node.text)                                           
#   puts emails
#   end
# end

#get_all_emails("http://annuaire-des-mairies.com")








