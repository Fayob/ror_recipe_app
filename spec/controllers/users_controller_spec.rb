require './spec/rails_helper'

describe UsersController, type: :request do
  describe 'test for home page' do
    before(:each) do
      get '/'
    end

    it 'should test for request status index method' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render home template' do
      expect(response).to render_template(:home)
    end

    it 'should test for response body' do
      expect(response.body).to include('Welcome')
    end
  end
end
