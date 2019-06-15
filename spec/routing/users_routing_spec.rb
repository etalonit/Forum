require 'rails_helper'

 describe 'routing' do
   it 'routes to #show' do
    expect(get: '/users/1').to route_to('users#show', id: '1')
   end
 end
