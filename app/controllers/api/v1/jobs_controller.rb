class Api::V1::JobsController < ApplicationController

  before_action :authenticate_api_v1_user!, only: [:buy]

  def index
    @jobs = Job.where(nil)

    @jobs = @jobs.text_search(params[:search]) if params[:search]
    @jobs.order!(params[:order])
    @jobs = @jobs.paginate(page: params[:page])
  end

  def info
    @info = {max: Job.maximum(:until_salary), min: Job.minimum(:start_salary)}
  end

  def find
    @job = Job.friendly.find(params[:slug])
  end
end
