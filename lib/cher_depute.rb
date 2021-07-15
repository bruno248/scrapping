require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://www.handi-mais-pas-que.com/pages/administratif-de-l-association/trouver-un-mail-de-depute.html/"))

#all_emails = page.xpath('//a[contains(text(), "@")]')
#all_emails.each do |email_link|
#puts "voici les emails : #{email_link.text}"
#end

all_emails = []
all_emails = page.xpath('//*[@id="cell-5cfa97a6c7cd56e53ac"]/p[2]/text()').each do |node|
all_emails.push(node.text)
end
puts all_emails

