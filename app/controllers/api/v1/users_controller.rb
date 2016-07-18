require 'correios-cep'

class Api::V1::UsersController < ApplicationController

  def current
    @user = current_api_v1_user
  end

  def get_address
    @address = Correios::CEP::AddressFinder.get(params[:zip_code])
  end
end
