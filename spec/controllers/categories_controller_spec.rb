require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

    context 'GET #index' do
     it 'should success and render to index page' do
        get :index
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
     end
    end

  context 'GET #show' do
    let!(:category) { create :category}

  it 'should success and render to edit page' do
       get :show, params: { id: category.id }
       expect(response).to have_http_status(200)
       expect(response).to render_template :show
    end
  end

  context 'GET #edit' do
    let!(:category) { create :category }

  it 'should success and render to edit page' do
     get :edit, params: { id: category.id }
     expect(response).to have_http_status(200)
     expect(response).to render_template :edit
  end
  end

  context 'PUT #update' do
  let!(:category) { create :category}

  it 'should update category info' do
   params = {
    name: 'a'
   }

   put :update, params: { id: category.id, category: params }
   category.reload
   params.keys.each do |key|
    expect(category.attributes[key.to_s]).to eq params[key]
   end
  end
  end

  context 'DELETE #destroy' do
  let!(:category) { create :category}

  it 'should delete category' do
   expect { delete :destroy, params: { id: category.id } }.to change(Category, :count).by(-1)
  end
end
end
