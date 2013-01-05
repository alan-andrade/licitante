require 'spec_helper'

module Compranet
  describe Page do

    context 'delegate methods to response' do
      subject{ Page.new mocked_response }

      its( :body   ){ should be_a String }
      its( :status ){ should eq 200 }

      # this wont delegate
      its( :document ){ should be_a Nokogiri::HTML::Document }
      its( :rows ){ should be_a Nokogiri::XML::NodeSet }
    end

  end

end
