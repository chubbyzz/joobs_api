require 'rails_helper'

RSpec.describe Api::V1::JobsController, type: :controller do


  describe 'GET #index' do
    let(:jobs) {create_list :job, 20}

    it 'gets first page' do
      get :index, format: :json
      expect(assigns(:jobs)).to eq jobs.first 10
      expect(response).to have_http_status(:success)
    end

    it 'gets the second page' do
      get :index, format: :json, page: 2
      expect(assigns(:jobs)).to eq jobs.last 10
      expect(response).to have_http_status(:success)
    end

    it 'should search by name' do
      job = create :job, name: 'test search by this'
      get :index, format: :json, search: 'search by'
      expect(assigns(:jobs)).to eq [job]
    end

    it 'should order the jobs' do
      jobs = []
      jobs << create(:job, start_salary: 10, until_salary: 100, name: 'abc')
      jobs << create(:job, start_salary: 50, until_salary: 500, name: 'bca')
      jobs << create(:job, start_salary: 100, until_salary: 1000, name: 'cba')

      get :index, format: :json, order: 'start_salary'
      expect(assigns(:jobs)).to eq jobs
      get :index, format: :json, order: 'start_salary desc'
      expect(assigns(:jobs)).to eq jobs.reverse

      get :index, format: :json, order: 'until_salary'
      expect(assigns(:jobs)).to eq jobs
      get :index, format: :json, order: 'until_salary desc'
      expect(assigns(:jobs)).to eq jobs.reverse

      get :index, format: :json, order: 'name'
      expect(assigns(:jobs)).to eq jobs
      get :index, format: :json, order: 'name desc'
      expect(assigns(:jobs)).to eq jobs.reverse
    end
  end

  describe 'GET #info' do
    it 'gets max and min from jobs' do
      create :job, start_salary: 10, until_salary: 100
      create_list :job, 3, start_salary: 50, until_salary: 500
      create :job, start_salary: 90, until_salary: 900

      get :info, format: :json
      expect(assigns(:info)).to eq({max: 900, min: 10})
    end
  end

  describe 'GET #find' do
    it 'gets max and min from jobs' do
      job = create :job, name: 'fínd-fRoM-SLugged'
      get :find, format: :json, slug: 'find-from-slugged'
      expect(assigns(:job)).to eq job
    end
  end
end
