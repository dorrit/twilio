require './ui_helper'

def welcome
  puts "Welcome to the Twilio text messager."
  create
end

def create
  message = get_message
  phone_numbers = get_phone_numbers

  phone_numbers.map do |numba| 
    p Text.create({ 'Body' => "#{message}", 'From' => "#{DORRIT}", 'To' => numba})  
  end 
  puts "Thanks for using the Twilio text messager!"
end

def get_phone_numbers
  phone_numbers = []
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
  phone_numbers
end

def get_message
  puts "What message would you like to send?"
  message = gets.chomp
  if message == ''
    puts "Please enter a valid message"
    get_message
  end
  message
end

welcome
