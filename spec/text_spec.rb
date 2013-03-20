require 'spec_helper'

describe Text do
  context '.create' do 
    it 'should send a request to text message a number' do
      options = { 'Body' => "yo dude", 'From' => "#{DORRIT}", 'To' => '510-495-5333'}
      stub = stub_request(:post, "https://#{ACCOUNT_SID}:#{AUTH_TOKEN}@api.twilio.com/2010-04-01/Accounts/#{ACCOUNT_SID}/SMS/Messages.json").to_return(:status => 200)
      Text.create(options)
      stub.should have_been_requested
    end
  end
end