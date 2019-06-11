require 'rails_helper'

 describe 'routing' do

  it 'routes to #index' do
   expect(get: '/articles').to route_to('articles#index')
  end

  it 'routes to #show' do
   expect(get: '/articles/1').to route_to('articles#show', id: '1')
  end

  it 'routes to #new' do
   expect(get: '/articles/new').to route_to('articles#new')
  end

  it 'routes to #update via PUT' do
   expect(put: '/articles/1').to route_to('articles#update', id: '1')
  end

  it 'routes to #update via PATCH' do
   expect(patch: '/articles/1').to route_to('articles#update', id: '1')
  end
  it "routes /articles to articles#create" do
    expect(post: "/articles").to route_to(
      controller: "articles",
      action: "create"
    )
  end
end
