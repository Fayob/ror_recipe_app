require './spec/rails_helper'

describe 'Routes for recipe', type: :routing do
  it 'routes get /recipees to the recipees controller' do
    expect(get(recipees_path)).to route_to('recipees#index')
  end

  it 'routes post /recipees to the recipees controller' do
    expect(post(recipees_path)).to route_to('recipees#create_recipe')
  end

  it 'routes get recipees/:id to the recipees controller' do
    expect(get('/recipees/1')).to route_to('recipees#show', id: '1')
  end

  it 'routes delete recipees/:id to the recipees controller' do
    expect(delete('/recipees/1')).to route_to('recipees#destroy', id: '1')
  end

  it 'routes get /public_recipes to the recipees controller' do
    expect(get('/public_recipes')).to route_to('recipees#public')
  end

  it 'routes get /recipee/new to the recipees controller' do
    expect(post('/recipees')).to route_to('recipees#create_recipe')
  end
end
