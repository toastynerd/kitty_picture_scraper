require "mechanize"
class KittenScraper < ActiveRecord::Base
  def self.scrape
    agent = Mechanize.new
    page =  agent.get('http://images.google.com')
    google_form = page.form('f')
    google_form.q = 'kittens'
    page = agent.submit(google_form)
    (1..100).each do |number|
      my_links = page.links
      my_links.each do |link|
        text_link = link.href
        final_text_link = text_link.match(/http:\/\/.*\.jpg/).to_s
        @kitten = Kitten.new(:link => final_text_link)
        @kitten.save
      end
      page = agent.page.link_with(:text => "Next").click
     end
  end
  
end
