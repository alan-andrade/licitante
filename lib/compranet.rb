require 'patron'
require './lib/compranet/page.rb'

module Compranet
  @@connection = Patron::Session.new
  @@connection.connect_timeout = 5
  @@connection.handle_cookies
  @@connection.base_url = 'https://compranet.funcionpublica.gob.mx'

  def self.fetch
    Page.new request '/esop/guest/go/public/opportunity/current'
  end

  private

  def self.request( url )
    begin
      @@connection.get url
    rescue TimeoutError
      p 'retrying...'
      @@connection.connect_timeout = @@connect_timeout.connect_timeout + 1
      retry
    end
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
