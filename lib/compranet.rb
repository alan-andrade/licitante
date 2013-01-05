require './lib/compranet/page.rb'
require './lib/compranet/connector.rb'

module Compranet
  extend Connector

  def self.fetch
    Page.new request '/esop/guest/go/public/opportunity/current'
  end


end
