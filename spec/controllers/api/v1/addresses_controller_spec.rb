require 'rails_helper'

RSpec.describe Api::V1::AddressesController, type: :controller do

  describe "GET #:state" do
    it "returns http success" do
      get ::state
      expect(response).to have_http_status(:success)
    end
  end

end
