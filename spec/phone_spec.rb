require 'spec_helper'

describe Phone do
   context '#initialize' do 
    it 'initializes an instance of Phone' do 
      phone = Phone.new(options={})
      phone.should be_an_instance_of Phone
    end
  end

  context '#validations' do 
    it 'should be a 10 digit phone number' do
      phone_number = {:phone_number => '510-495-543'}
      phone = Phone.new(phone_number)
      p phone_number
      phone.should_not be_valid
    end
  end

    context '#validations' do 
    it 'should be a 10 digit phone number' do
      phone_number = {:phone_number => '510-495-5432'}
      phone = Phone.new(phone_number)
      phone.valid?.should be_true

    end
  end
end
