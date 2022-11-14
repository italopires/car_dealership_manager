require 'rails_helper'

RSpec.describe CarsController do
  let(:kind) { :admin }
  let(:user) { create(:user, kind: kind) }
  
  before { sign_in user }

  describe 'GET #index' do
    let!(:car1) { create(:car) }
    let!(:car2) { create(:car) }

    before { get :index }

    context 'when user is kind of admin' do
      it 'assigns objects' do
        expect(assigns(:objects)).to include car1, car2
      end

      it "render index template" do
        expect(response).to render_template("cars/index")
      end

      it 'returns status 200' do
        expect(response.status).to eql 200
      end
    end

    context 'when user is kind of user' do
      let(:kind) { :user }

      it 'assigns objects' do
        expect(assigns(:objects)).to include car1, car2
      end

      it "render index template" do
        expect(response).to render_template("cars/index")
      end

      it 'returns status 200' do
        expect(response.status).to eql 200
      end
    end
  end

  describe 'GET #new' do
    before { get :new }

    context 'when user is kind of admin' do
      it 'assigns object' do
        expect(assigns(:object)).to be_a_new(Car)
      end

      it 'render new template' do
        expect(response).to render_template('cars/new')
      end

      it 'returns status 200' do
        expect(response.status).to eql 200
      end
    end

    context 'when user is kind of user' do
      let(:kind) { :user }

      it 'redirect to root_path' do
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'POST #create' do
    let(:dealership1) { create(:dealership) }
    let(:params) { attributes_for(:car, dealership_id: dealership1.id) }

    context 'when user is kind of admin' do
      it 'creates a new Car' do
        expect { post :create, params: { car: params } }.to change(Car, :count).by(1)
      end

      it 'redirects to cars_path', aggregate_failures: true do
        post :create, params: { car: params }

        expect(response.status).to eql 302
        expect(response).to redirect_to cars_path
      end
    end

    context 'when user is kind of user' do
      let(:kind) { :user }

      it 'redirect to root_path' do
        post :create, params: { car: params }

        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'GET #edit' do
    let!(:car1) { create(:car) }
    before { get :edit, params: { id: car1.id } }

    context 'when user is kind of admin' do
      it 'render new template' do
        expect(response).to render_template('cars/edit')
      end

      it 'returns status 200' do
        expect(response.status).to eql 200
      end
    end

    context 'when user is kind of user' do
      let(:kind) { :user }

      it 'redirect to root_path' do
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'PUT #update' do
    let(:car1) { create(:car) }
    let(:params) { attributes_for(:car, name: 'Test Car') }

    context 'when user is kind of admin' do
      it 'updates an existent Car' do
        expect { put(:update, params: { id: car1.id, car: params }); car1.reload }.to change(car1, :attributes)
      end

      it 'redirects to cars_path', aggregate_failures: true do
        put(:update, params: { id: car1.id, car: params })

        expect(response.status).to eql 302
        expect(response).to redirect_to cars_path
      end
    end

    context 'when user is kind of user' do
      let(:kind) { :user }

      it 'redirect to root_path' do
        put(:update, params: { id: car1.id, car: params })

        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:car1) { create(:car) }

    context 'when user is kind of admin' do
      it 'destroy an existent Car' do
        expect { delete :destroy, params: { id: car1.id } }.to change(Car, :count).by(-1)
      end

      it 'redirects to cars_path' do
        delete :destroy, params: { id: car1.id }

        expect(response.status).to eql 302
        expect(response).to redirect_to cars_path
      end
    end

    context 'when user is kind of user' do
      let(:kind) { :user }

      it 'redirect to root_path' do
        delete :destroy, params: { id: car1.id }

        expect(response).to redirect_to root_path
      end
    end
  end
end