class Integrations::BaseController < ApplicationController

  layout false

  rescue_from ActionController::ParameterMissing, with: :render_bad_request
  rescue_from NoMethodError,                      with: :render_bad_request

  def render_bad_request
    head :bad_request
  end
end
