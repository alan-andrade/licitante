require 'nokogiri'
require 'forwardable'

module Compranet
  class Page
    extend Forwardable

    attr_reader :document

    def_delegators :@response, :status, :body

    def initialize(response)
      @response = response
      @document = Nokogiri::HTML response.body
    end

    def rows
      @document.search('tr.table_cnt_body_a, tr.table_cnt_body_b')
    end

    #all.each{ |r| p r.search('a').first.attributes["onclick"].text.scan(/\d+/).first }
  end
end
