TEST_ACCOUNT_SID = 'AC7529b4d8b0e86d345eded1d9b0c139a1'
TEST_AUTH_TOKEN = '0ac7586e91e08ee4d27f2901f855a413'
 

require 'faraday'
require 'base64'
  
post_response = Faraday.post do |request|
  request.url "https://api.twilio.com/2010-04-01/Accounts/#{TEST_ACCOUNT_SID}/SMS/Messages.json"
  request.headers['Authorization'] = "Basic " + Base64.strict_encode64("#{TEST_ACCOUNT_SID}:#{TEST_AUTH_TOKEN}")
  request.body = URI.encode_www_form({'From' => '+15102284957', 'To' => '+15104955432', 'Body' => 'you are nice!'})
end