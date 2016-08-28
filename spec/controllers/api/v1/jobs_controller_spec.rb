require 'rails_helper'

RSpec.describe Api::V1::JobsController, type: :controller do


  describe 'GET #index' do
    let(:jobs) {create_list :product, 20}

    it 'gets first page' do
      get :index, format: :json
      expect(assigns(:jobs)).to eq products.first 10
      expect(response).to have_http_status(:success)
    end

    it 'gets the second page' do
      get :index, format: :json, page: 2
      expect(assigns(:jobs)).to eq products.last 10
      expect(response).to have_http_status(:success)
    end

    it 'should search by name' do
      product = create :product, name: 'test search by this'
      get :index, format: :json, search: 'search by'
      expect(assigns(:jobs)).to eq [product]
    end

    it 'should get medium price jobs' do
      cheep_product = create :product, price: 10
      product = create :product, price: 50
      expensive_product = create :product, price: 100
      get :index, format: :json, min: 40, max: 60
      expect(assigns(:jobs)).to include product
      expect(assigns(:jobs)).not_to include cheep_product
      expect(assigns(:jobs)).not_to include expensive_product
    end

    it 'should order the jobs' do
      products = []
      products << create(:product, price: 10, name: 'abc')
      products << create(:product, price: 50, name: 'bca')
      products << create(:product, price: 100, name: 'cba')

      get :index, format: :json, order: 'price'
      expect(assigns(:jobs)).to eq products
      get :index, format: :json, order: 'price desc'
      expect(assigns(:jobs)).to eq products.reverse

      get :index, format: :json, order: 'name'
      expect(assigns(:jobs)).to eq products
      get :index, format: :json, order: 'name desc'
      expect(assigns(:jobs)).to eq products.reverse
    end
  end
  describe 'GET #info' do
    it 'gets max and min from jobs' do
      create :product, price: 10
      create_list :product, 3, price: 50
      create :product, price: 90
      get :info, format: :json
      expect(assigns(:info)).to eq({max: 90, min: 10})
    end
  end
  describe 'GET #find' do
    it 'gets max and min from jobs' do
      product = create :product, name: 'fínd-fRoM-SLugged'
      get :find, format: :json, slug: 'find-from-slugged'
      expect(assigns(:product)).to eq product
    end
  end
  describe 'test responce' do
    render_views
    let(:json) { JSON.parse(response.body) }
    it 'should list jobs' do
      products = create_list :product, 20
      get :index, format: :json
      expect(json).to eq products.first(10).map{|product| {'name' => product.name, 'price' => product.price, 'discount' => product.discount, 'slug' => product.friendly_id}}
    end

    it 'should print max end min from jobs' do
      create :product, price: 10
      create_list :product, 3, price: 50
      create :product, price: 90
      get :info, format: :json
      expect(json).to eq({'max' => 90, 'min' => 10})
    end

    it 'should find a product details' do
      product = create :product, name: 'fínd-fRoM-SLugged', images: create_list(:image, 3)
      get :find, format: :json, slug: product.slug
      expect(json).to eq({'name' => product.name, 'price' => product.price, 'small_description' => product.small_description, 'star' => product.star, 'images' => product.images.map{|img| {'path' => img.path}} })
    end
  end
end
