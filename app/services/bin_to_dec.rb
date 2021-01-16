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
    show_result
  end

  private

  def formatted_number
    return @formatted_number ||= number.reverse if number.is_a? String

    @formatted_number ||= number
  end

  def validate_binary_number(number)
    number != '0' && number != '1'
  end

  def update_invalid_input(num)
    @invalid_input += num
  end

  def calculate
    formatted_number.size.times do |n|
      num = formatted_number[n]

      if validate_binary_number(num)
        update_invalid_input(num)
        next
      else
        @result += (2**n) * num.to_i
      end
    end
  end

  def show_result
    return @result if @invalid_input.empty?

    raise StandardError, "The input is invalid because it has the following characters: #{@invalid_input}"
  end
end
