require 'rails_helper'

describe Api::V1::UsersController, type: :controller do

  describe "GET #current" do
    let(:user) { create :user }
    it 'get current user' do
      expect(controller).to receive(:current_api_v1_user).and_return(user)
      get :current, format: :json
      expect(response).to have_http_status(:success)
      expect(assigns(:user)).to eq user
    end

    it 'should find address by zip code' do
      get :get_address, format: :json, zip_code: '18077-301'
      expect(assigns(:address)).to eq({:neighborhood=>"Jardim Santo André", :zipcode=>"18077301", :city=>"Sorocaba", :complement=>"", :address=>"Rua José Lamberti", :state=>"SP"})
    end

  end

  describe 'test responce' do
    render_views
    let(:json) { JSON.parse(response.body) }
    it 'should return nil if user is not logged in' do
      expect(controller).to receive(:current_api_v1_user).and_return(nil)
      get :current, format: :json
      expect(response).to have_http_status(:success)
      expect(json).to eq({'error' => 'no current user found'})
    end

    it 'should find address by zip code' do
      get :get_address, format: :json, zip_code: '18077-301'
      expect(json).to eq( {"address"=>"Rua José Lamberti", "neighborhood"=>"Jardim Santo André", "city"=>"Sorocaba", "state"=>"SP", "zipcode"=>"18077301", "complement"=>""})
    end

    it 'should return nil if user is not logged in' do
      user = create :user
      expect(controller).to receive(:current_api_v1_user).and_return(user)
      get :current, format: :json
      expect(response).to have_http_status(:success)
      expect(json).to eq({'email' => user.email, 'name' => user.name})
    end
  end
end
