require 'rails_helper'

RSpec.describe Api::V1::CompaniesController, type: :controller do
  it do
    params = {user_company: params_for_user(build(:company_user))}
    should permit(user: [:email, :password, :password_confirmation],
    company: [:name],
    address: [:city_id, :zipcode, :district, :street, :number]).
      for(:create, params: params).
      on(:user_company)
  end

  it 'should create a new company with a valid address' do
    user = build :company_user

    post :create, format: :json, user_company: params_for_user(user)
    expected_user = assigns(:user)

    expect(expected_user.email).to eq user.email
    expect(expected_user.profile.name).to eq user.profile.name
    expect(expected_user.profile.address.street).to eq user.profile.address.street
    expect(response).to have_http_status(:success)

  end
end

def params_for_user user
  company = user.profile
  address = company.address

  {
    user: {email: user.email, password: user.password, password_confirmation: user.password},
    company: {name: company.name},
    address: address.attributes.symbolize_keys.slice(:zipcode, :city_id, :district, :street, :number)
  }
end
