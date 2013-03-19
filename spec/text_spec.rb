require 'spec_helper'


account_sid = 'AC7529b4d8b0e86d345eded1d9b0c139a1'
auth_token = '0ac7586e91e08ee4d27f2901f855a413'
options = {'Body' => 'Mike\'s cat is nefarious',
           'From' => '3124504610',
           'To' => '5102284957'}

describe Text do
  context '#initialize' do 
    it 'initializes an instance of Text' do 
      text = Text.new(options)
      text.should be_an_instance_of Text
    end
  end

  context '.create' do 
    it 'should send a request to text message a number' do
      stub = stub_request(:post, "https://#{account_sid}:#{auth_token}@api.twilio.com/2010-04-01/Accounts/#{account_sid}/SMS/Messages.json").to_return(:status => 200)
      Text.create(options)
      stub.should have_been_requested
    end
  end
end