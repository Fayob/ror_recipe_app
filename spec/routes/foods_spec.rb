require './spec/rails_helper'

describe 'Routes for foods', type: :routing do

  it 'routes get /foods to the foods controller' do
    expect(get foods_path).to route_to("foods#index")
  end

  it 'routes post /foods to the foods controller' do
    expect(post foods_path).to route_to("foods#create_food")
  end

  it 'routes get foods/:id to the foods controller' do
    expect(get '/foods/1').to route_to("foods#show", id: '1')
  end

  it 'routes delete foods/:id to the foods controller' do
    expect(delete '/foods/1').to route_to("foods#destroy", id: '1')
  end

  it 'routes get /foods/new to the foods controller' do
    expect(post '/foods').to route_to("foods#create_food")
  end
end