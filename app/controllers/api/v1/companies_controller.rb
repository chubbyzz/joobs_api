class Api::V1::CompaniesController < ApplicationController
  before_action :set_company_user, only: [:create]

  def create
    if @user.save
      sign_in(@user, scope: :user)
    else
      render status: :bad_request
    end
  end

  def set_company_user
    company_user = user_company_params
    @company = Company.new company_user[:company]
    @address = Address.new company_user[:address]
    @company.address = @address
    @user = User.new company_user[:user]
    @user.profile = @company
  end

  def user_company_params
    params.require(:user_company).permit(
      user: [:email, :password, :password_confirmation],
      company: [:name],
      address: [:city_id, :zipcode, :district, :street, :number]
      )
  end
end
