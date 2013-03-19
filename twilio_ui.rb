require './lib/text'
require './lib/phone'
require 'active_model'

def welcome
  puts "Welcome to the Twilio text messager."
  create
end


def create
  number = nil
  puts "What message would you like to send?"
  message = gets.chomp
  if message == ''
    puts "Please enter a valid message"
    create
  else

    until number == 's'
      puts "Please enter a phone number you would like to text from our messager or press 's' to send"
      number = gets.chomp
      phone_number = Phone.new(:phone_number => number)
      if phone_number.valid?
        puts "'#{number}' has been added."
      else
        puts "That wasn't a valid number:"
        phone_number.errors.full_messages.each {|message| puts message}
      end
      phone_numbers = []
      phone_numbers << phone_number
    end
      
    # numbers = [2345678901, 23456778]
    Text.create(:Body => message, :To => phone_numbers)
    puts "Thanks for using the Twilio text messager!"
  end
end
  

  # Gist.create(:public => public_attribute, :description => description, :files => files)

welcome