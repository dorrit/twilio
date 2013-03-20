require 'active_model'
require 'faraday'
require 'json'
require 'base64'

class Text
  include ActiveModel::Validations

  def self.create(options)
   post_response = Faraday.post do |request|
    request.url "https://api.twilio.com/2010-04-01/Accounts/#{ACCOUNT_SID}/SMS/Messages.json"
    request.headers['Authorization'] = "Basic " + Base64.strict_encode64("#{ACCOUNT_SID}:#{AUTH_TOKEN}")
    request.body = URI.encode_www_form(options) 
   end
  end
end




