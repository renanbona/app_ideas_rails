class BinariesConversionController < ApplicationController
  def index
    converted_number = BinToDec.call(binary_number)

    render json: { "anwser": converted_number }
  end

  private

  def binary_number
    params.dig('binaries_conversion', 'binary')
  end
end
