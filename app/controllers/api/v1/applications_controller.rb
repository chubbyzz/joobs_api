class Api::V1::ApplicationsController < ApplicationController
  before_action :authenticate_api_v1_user!


  def apply
    @application = Application.new(jobseeker: current_api_v1_user.profile, job: Job.friendly.find(params['slug']))
    @application.save
  end

  def index
    @orders = current_api_v1_user.applications.includes(:jobs)
  end

  def update
  	@application = Application.find(params[:id])
  	
  	render status: :bad_request unless @application.send params[:act_method].to_sym
  end
end
