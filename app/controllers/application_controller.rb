class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::ImplicitRender


  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  def configure_permitted_parameters
    fields = [:name, :zip_code, :address, :city, :state, :number, :neighborhood]
    fields.each { |field| devise_parameter_sanitizer.for(:sign_up) << field}
  end
end

