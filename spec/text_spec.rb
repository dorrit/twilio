require 'spec_helper'


account_sid = 'AC7529b4d8b0e86d345eded1d9b0c139a1'
auth_token = '0ac7586e91e08ee4d27f2901f855a413'
message = "Mike's cat is nefarious"

describe Text do
  context '#initialize' do 
    it 'initializes an instance of Text' do 
      text = Text.new(options={})
      text.should be_an_instance_of Text
    end
  end

  context 'validations' do 
    it {should validate_presence_of :Body}
    it {should validate_presence_of :To}
  end

  context '.create' do 
    it 'should send a request to text message a number' do
      stub = stub_request(:post, "https://#{account_sid}:#{auth_token}@api.twilio.com/2010-04-01/Accounts/#{account_sid}/SMS/Messages").with(:body => message.to_json).to_return(:status => 200)
      Text.create(message)
      stub.should have_been_requested
    end
  end
end