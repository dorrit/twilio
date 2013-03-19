#initialize sender phone number (constant)
#validate phone number
require 'active_model'

class Phone
  include ActiveModel::Validations

  attr_accessor :phone_number

  validates :phone_number, :presence => true,
                           :format => {:with => /\(?[0-9]{3}\)?[-. ]?[0-9]{3}[-. ]?[0-9]{4}[ ]*\z/}

  def initialize(options={})
    @phone_number = options[:phone_number]
  end
end