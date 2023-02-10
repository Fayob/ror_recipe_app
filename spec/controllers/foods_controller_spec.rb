require './spec/rails_helper'
require_relative '../support/devise'

describe FoodsController, type: :controller do
  describe 'test for index method' do
    login_user
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
end
