# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from StandardError, with: :render_errors

  private

  def render_errors(err)
    render json: {
      message: err.to_s
    }, status: :unprocessable_entity
  end
end
