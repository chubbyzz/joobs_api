class Api::V1::JobseekersController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:jobs]

  def create
    @user = User.new(user_jobseeker_params[:user])
    @user.profile = Jobseeker.new(user_jobseeker_params[:jobseeker])

    if @user.save
      sign_in(@user, scope: :user)
    else
      render status: :bad_request
    end
  end

  def applications
    @applications = current_api_v1_user.profile.applications.includes(:job, job:[:company])
  end

  def jobs
    @jobs = current_api_v1_user.profile.jobs.includes(:jobseekers)
  end

  def user_jobseeker_params
    params.require(:jobseeker).permit(
      user: [:email, :password, :password_confirmation, :name],
      jobseeker: [:linkedin]
      )
  end
end
