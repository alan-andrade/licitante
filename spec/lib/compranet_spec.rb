require 'spec_helper'

describe Compranet do

  describe 'connection' do

    it 'should connect to the server' do
      response = Compranet.fetch
      response.status.should eq 200
      response.body.should_not be_nil
    end

  end

end
