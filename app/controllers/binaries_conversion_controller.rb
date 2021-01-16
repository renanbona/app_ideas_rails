class BinariesConversionController < ApplicationController
  def index
    converted_number = BinToDec.call(binary_number)

    render json: { "converted_number": converted_number }
  end

  private

  def binary_number
    params['binary']
  end
end
