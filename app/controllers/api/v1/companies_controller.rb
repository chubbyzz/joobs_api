class Api::V1::CompaniesController < ApplicationController
  before_action :set_company_user, only: [:create]
  before_action :authenticate_api_v1_user!, only: [:jobs]

  def create
    if @user.save
      sign_in(@user, scope: :user)
    else
      render status: :bad_request
    end
  end

  def jobs
    @jobs = current_api_v1_user.profile.jobs.includes(:jobseekers)
  end

  def job
    @job = current_api_v1_user.profile.jobs.includes(:applications ,applications: [:jobseeker]).friendly.find(params[:slug])
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
      user: [:email, :password, :password_confirmation, :name],
      address: [:city_id, :zipcode, :district, :street, :number]
      )
  end
end
