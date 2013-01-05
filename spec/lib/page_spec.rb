require 'spec_helper'

module Compranet
  describe Page do

    it "should have a parsed body" do
      Page.new mocked_response
    end

  end

end
