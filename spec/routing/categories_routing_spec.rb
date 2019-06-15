require 'rails_helper'

 describe 'routing' do

  it 'routes to #index' do
   expect(get: '/categories').to route_to('categories#index')
  end

  it 'routes to #show' do
   expect(get: '/categories/1').to route_to('categories#show', id: '1')
  end

  it 'routes to #new' do
   expect(get: '/categories/new').to route_to('categories#new')
  end

  it 'routes to #update via PUT' do
   expect(put: '/categories/1').to route_to('categories#update', id: '1')
  end

  it 'routes to #update via PATCH' do
   expect(patch: '/categories/1').to route_to('categories#update', id: '1')
  end
  it "routes /categories to categories#create" do
    expect(post: "/categories").to route_to(
      controller: "categories",
      action: "create"
    )
  end
end
