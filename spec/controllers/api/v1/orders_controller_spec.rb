require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :controller do
  before do
    allow(controller).to receive(:authenticate_api_v1_user!).and_return(true)
  end
  describe "GET #create" do
    it 'create a new order' do
      product = create :product
      user = create :user
      order = create :order, product: product, user: user, quantity: 2

      expect(controller).to receive(:current_api_v1_user).and_return(user)
      get :create, format: :json, product: product.slug, quantity: order.quantity

      order.id += 1

      expect(response).to have_http_status(:success)
      expect(assigns(:order)).to eq order
    end

    it 'list current orders' do
      user = create :user
      expect(controller).to receive(:current_api_v1_user).and_return(user)

      orders = create_list :order, 10, user: user
      create_list :order, 5, user: create(:user)

      get :index, format: :json

      expect(assigns(:orders)).to eq orders
    end
  end

  describe 'test responce' do
    render_views
    let(:json) { JSON.parse(response.body) }
    it 'return the errors new orders' do
      product = create :product
      user = create :user
      order = build :order, product: product, user: user, quantity: 'a'

      expect(controller).to receive(:current_api_v1_user).and_return(user)
      get :create, format: :json, product: product.slug, quantity: 'a'

      order.valid?

      expect(json)
          .to eq({'errors' => order.errors.messages.stringify_keys})
    end


    it 'returns a new order' do
      product = create :product
      user = create :user
      order = create :order, product: product, user: user, quantity: 2

      expect(controller).to receive(:current_api_v1_user).and_return(user)
      get :create, format: :json, product: product.slug, quantity: order.quantity

      order.id += 1

      expect(json)
          .to eq({'id' => order.id, 'quantity' => order.quantity, 'unit_price' => order.product.price, 'total' => order.quantity * order.product.price, 'product' => order.product.name, 'user' => {'name' => order.user.name, 'email' => order.user.email}})
    end

    it 'returns a new order' do
      user = create :user
      expect(controller).to receive(:current_api_v1_user).and_return(user)

      orders = create_list :order, 10, user: user
      create_list :order, 5, user: create(:user)

      get :index, format: :json

      expect(json).to eq(orders.map{|order| {id: order.id, product: order.product.name, status: order.status, quantity: order.quantity, unit_price: order.product.price, total: order.quantity * order.product.price}.stringify_keys});
    end
  end

end
