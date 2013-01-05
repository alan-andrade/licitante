require 'patron'

module Compranet
  @@connection = Patron::Session.new
  @@connection.connect_timeout = 5
  @@connection.base_url = 'https://compranet.funcionpublica.gob.mx'
  @@connection.handle_cookies

  def self.fetch
    @@connection.get '/esop/guest/go/public/opportunity/current'
  end

end

#def initialize(page)
  ## html.search('tr.table_cnt_body_a,tr.table_cnt_body_b').each{ |r| p r.search('a').first.attributes["onclick"].text.scan(/\d+/).first }
  #@page = Nokogiri::HTML page
#end

#def all
  #@page.search('tr.table_cnt_body_a,
                #tr.table_cnt_body_b')
#end

#def links
  #all.each{ |r| p r.search('a').first.attributes["onclick"].text.scan(/\d+/).first }
#end
