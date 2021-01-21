# frozen_string_literal: true

class BinToDec
  attr_accessor :number

  def self.call(*args)
    new(*args).call
  end

  def initialize(number)
    @number = number
    @result = 0
    @invalid_input = ''
  end

  def call
    calculate
  end

  private

  def formatted_number
    return @formatted_number ||= number.reverse if number.is_a? String
  end

  def validate_binary_number(number)
    number != '0' && number != '1'
  end

  def calculate
    formatted_number.size.times do |n|
      num = formatted_number[n]

      if validate_binary_number(num)
        raise StandardError, "Enter either 0 or 1"
      else
        @result += (2**n) * num.to_i
      end
    end

    @result
  end
end
