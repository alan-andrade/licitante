require 'Faraday'
require 'nokogiri'

Faraday.default_adapter = :patron

class Compranet

  def initialize(page)
    # html.search('tr.table_cnt_body_a,tr.table_cnt_body_b').each{ |r| p r.search('a').first.attributes["onclick"].text.scan(/\d+/).first }
    @page = Nokogiri::HTML page
  end

  def all
    @page.search('tr.table_cnt_body_a,
                  tr.table_cnt_body_b')
  end

  def links
    all.each{ |r| p r.search('a').first.attributes["onclick"].text.scan(/\d+/).first }
  end

  class << self

    def fetch
      do_request('/esop/guest/go/public/opportunity/current')
    end


    private

    def do_request(url)
      set_cookies
      connection.get(url){|r| r.headers[:Cookie] = @cookies }
    end

    def connection
      @connection ||=
        Faraday::Connection.new 'https://compranet.funcionpublica.gob.mx',
          request: {
            ssl:    { version: :SSLv3 },
            options:{  timeout:      100,
                       open_timeout: 100
                    }
                   }
    end

    def set_cookies
      @cookies ||= dummy_request.headers['Set-Cookie']
    end

    def dummy_request
      connection.get '/esop/guest/go/public/opportunity/current'
    end
  end # << self

end
