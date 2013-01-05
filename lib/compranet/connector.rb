require 'patron'

module Connector

  @@connection = Patron::Session.new
  @@connection.connect_timeout = 5
  @@connection.handle_cookies
  @@connection.base_url = 'https://compranet.funcionpublica.gob.mx'

  private

  def request( url )
    begin
      @@connection.get url
    rescue Patron::TimeoutError
      @@connection.connect_timeout = @@connect_timeout.connect_timeout + 1
      retry
    end
  end

end
