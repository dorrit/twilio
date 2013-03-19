require './lib/text'
require './lib/phone'
require 'active_model'
require 'Base64'
require 'json'
require 'faraday'

ACCOUNT_SID = 'AC7529b4d8b0e86d345eded1d9b0c139a1'
AUTH_TOKEN = '0ac7586e91e08ee4d27f2901f855a413'
DORRIT = '+15102284957'

def welcome
  puts "Welcome to the Twilio text messager."
  create
end

def create
  phone_numbers = []
  puts "What message would you like to send?"
  message = gets.chomp
  if message == ''
    puts "Please enter a valid message"
    create
  end
  choice = nil
  until choice == 'x'
    puts "Please enter a phone number of a person you would like to text. "
    number = gets.chomp
    phone_number = Phone.new(:phone_number => number)
    if phone_number.valid?
      puts "'#{number}' has been added."
      phone_numbers << number
    else
      puts "That wasn't a valid number:"
      phone_number.errors.full_messages.each {|message| puts message}
    end
      puts "What would you like to do next?"
      puts "Press 'x' to send to all your added contact phone numbers or any other key to add another number."
      choice = gets.chomp
  end
      phone_numbers.map do |numba| 
      p Text.create({ 'Body' => "#{message}", 'From' => "#{DORRIT}", 'To' => numba})
    
  end 
  puts "Thanks for using the Twilio text messager!"
end

welcome
