require 'rails_helper'

 describe 'routing' do

  it 'routes to #index' do
   expect(get: '/searches').to route_to('searches#index')
  end

  it 'routes to #show' do
   expect(get: '/searches/1').to route_to('searches#show', id: '1')
  end

  it 'routes to #new' do
   expect(get: '/searches/new').to route_to('searches#new')
  end

  it 'routes to #update via PUT' do
   expect(put: '/searches/1').to route_to('searches#update', id: '1')
  end

  it 'routes to #update via PATCH' do
   expect(patch: '/searches/1').to route_to('searches#update', id: '1')
  end
  it "routes /searches to searches#create" do
    expect(post: "/searches").to route_to(
      controller: "searches",
      action: "create"
    )
  end
end
