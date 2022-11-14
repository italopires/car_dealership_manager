require 'rails_helper'

RSpec.describe DealershipsController do
  let(:user) { create(:user, kind: :admin)}
  before { sign_in user }

  describe 'GET #index' do
    let!(:dealership1) { create(:dealership) }
    let!(:dealership2) { create(:dealership) }

    before { get :index }

    it 'assigns objects' do
      expect(assigns(:objects)).to include dealership1, dealership2
    end

    it "render index template" do
      expect(response).to render_template("dealerships/index")
    end

    it 'returns status 200' do
      expect(response.status).to eql 200
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns object' do
      expect(assigns(:object)).to be_a_new(Dealership)
    end

    it 'render new template' do
      expect(response).to render_template('dealerships/new')
    end

    it 'returns status 200' do
      expect(response.status).to eql 200
    end
  end

  describe 'POST #create' do
    let(:params) { attributes_for(:dealership) }

    it 'creates a new Dealership' do
      expect { post :create, params: { dealership: params } }.to change(Dealership, :count).by(1)
    end

    it 'redirects to dealerships_path', aggregate_failures: true do
      post :create, params: { dealership: params }

      expect(response.status).to eql 302
      expect(response).to redirect_to dealerships_path
    end
  end

  describe 'GET #edit' do
    let!(:dealership1) { create(:dealership) }
    before { get :edit, params: { id: dealership1.id } }

    it 'render new template' do
      expect(response).to render_template('dealerships/edit')
    end

    it 'returns status 200' do
      expect(response.status).to eql 200
    end
  end

  describe 'PUT #update' do
    let(:dealership1) { create(:dealership) }
    let(:params) { attributes_for(:dealership, name: 'Test Dealership') }

    it 'updates an existent Dealership' do
      expect { put(:update, params: { id: dealership1.id, dealership: params }); dealership1.reload }.to change(dealership1, :attributes)
    end

    it 'redirects to dealerships_path' do
      put(:update, params: { id: dealership1.id, dealership: params })

      expect(response.status).to eql 302
      expect(response).to redirect_to dealerships_path
    end
  end

  describe 'DELETE #destroy' do
    let!(:dealership1) { create(:dealership) }

    it 'destroy an existent Dealership' do
      expect { delete :destroy, params: { id: dealership1.id } }.to change(Dealership, :count).by(-1)
    end

    it 'redirects to dealerships_path' do
      delete :destroy, params: { id: dealership1.id }

      expect(response.status).to eql 302
      expect(response).to redirect_to dealerships_path
    end
  end
end