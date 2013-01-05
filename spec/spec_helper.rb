Dir[File.join(File.dirname(__FILE__), '../lib/**.rb')].each{|f| require f }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end


require 'ostruct'

def mocked_response
  o = OpenStruct.new
  o.body = File.read "#{File.dirname(__FILE__)}/response_mock.html"
  o.status = 200
  o
end
