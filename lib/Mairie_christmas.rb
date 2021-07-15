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
  mairie_end_links = page.css('td > p > a.lientxt').map { |link| link['href'].delete_prefix(".") }
  #page.xpath('//a[contains(text(), "./95/")]').each do |node|
  #page.xpath('//*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[2]/p/a').each do |node|
  #url.push(node.text)
  #puts url
  #end
  return mairie_end_links
end

def get_all_emails
  emails = []                          
  url = get_townhall_urls
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{url}")). each do |node| 
  emails.push(node.text)                                           
  end
  emails.each do |email_link|
  email_link = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
  return email_link.text
  end
end

get_all_emails
