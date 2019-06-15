require 'rails_helper'

 describe 'routing' do
   it 'routes to #index' do
    expect(get: '/about').to route_to('pages#about')
   end
 end
