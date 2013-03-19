require 'active_model'
require 'faraday'
require 'json'
require 'base64'

class Text
  include ActiveModel::Validations

ACCOUNT_SID = 'AC7529b4d8b0e86d345eded1d9b0c139a1'
AUTH_TOKEN = '0ac7586e91e08ee4d27f2901f855a413'
DORRIT = '+15102284957'

  attr_accessor :To, :Body

  def initialize(options)
    
  end


  def self.create(options)
      
   post_response = Faraday.post do |request|
    request.url "https://api.twilio.com/2010-04-01/Accounts/#{ACCOUNT_SID}/SMS/Messages.json"
    request.headers['Authorization'] = "Basic " + Base64.strict_encode64("#{ACCOUNT_SID}:#{AUTH_TOKEN}")
    request.body = URI.encode_www_form({:From => "#{DORRIT}"}) #options[:To], options[:Body])
   end
  end
end




# curl -X POST https://api.twilio.com/2010-04-01/Accounts/{AccountSid}/SMS/Messages \ 
# --data-urlencode "To=+14155551212" \ 
# --data-urlencode "From=+14158675309" \ 
# --data-urlencode "Body=Hello world" \ 
# -u {AccountSid}:{AuthToken}



# account_sid = 'AC7529b4d8b0e86d345eded1d9b0c139a1'
# auth_token = '0ac7586e91e08ee4d27f2901f855a413'
# @client = Twilio::REST::Client.new account_sid, auth_token
 
# message = @client.account.sms.messages.create(:body => "Jenny please?! I love you <3",
#     :to => "+14159352345",
#     :from => "+14158141829")
# puts message.sid



