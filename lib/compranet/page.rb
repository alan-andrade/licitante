require 'nokogiri'
require 'forwardable'

module Compranet

  class Page
    extend Forwardable

    attr_reader :content

    def_delegators :@response, :status, :body

    def initialize(response)
      @response = response
      @content = Nokogiri::HTML response.body
    end

    def rows
      @content.search('tr.table_cnt_body_a, tr.table_cnt_body_b')
    end
  end

end
