require './spec/rails_helper'
require_relative '../support/devise'

describe FoodsController, type: :controller do
  login_user
  describe 'test for index method' do
    before do
      get :index
    end

    it 'should test for request status index method' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render index' do
      expect(response).to render_template(:index)
    end
  end

  describe 'test for show method' do
    before do
      get :new
    end

    it 'should test for request status index method' do
      expect(response).to be_successful
    end

    it 'should render show' do
      expect(response).to render_template(:new)
    end
  end
end
