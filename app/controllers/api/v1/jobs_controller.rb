class Api::V1::JobsController < ApplicationController

  before_action :authenticate_api_v1_user!, only: [:buy, :create]

  def index
    @jobs = Job.where(nil)

    @jobs = @jobs.text_search(params[:search]) if params[:search]
    @jobs = @jobs.where('start_salary >= ?', params[:min]).where('until_salary <= ?', params[:max]) if params[:max] and params[:min]
    @jobs.order!(params[:order])
    @jobs = @jobs.paginate(page: params[:page])
  end

  def info
    @info = {max: Job.maximum(:until_salary), min: Job.minimum(:start_salary)}
  end

  def find
    @job = Job.friendly.find(params[:slug])
  end

  def create
    @job = Job.new(user_job_params)
    @job.company = current_api_v1_user.profile
    render status: :bad_request unless @job.save
  end

  def user_job_params
    params.require(:job).permit(:name, :small_description, :start_salary, :until_salary)
  end
end
