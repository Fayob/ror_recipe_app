require './spec/rails_helper'

describe 'Routes for recipe', type: :routing do
  it 'routes get / to the users controller' do
    expect(get('/')).to route_to('users#home')
  end
end
