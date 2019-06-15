require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  let!(:user){ build(:user, email: "test@test.com")}

  login_user

 it "should have a current_user" do
  expect(subject.current_user).to_not eq(nil)
 end

    let!(:article){ build(:article,user: user)}

 describe 'GET #new' do
   it "should find user and open form for create article" do
   get :new
   expect(subject.current_user.first_name).to eq("firstname")
   expect(subject.current_user.email).to_not eq(user.email)
   expect(response).to have_http_status(200)
  end
  end

#  describe 'GET #edit' do
#    it "should find current_user and open form for edit article" do
#    get :edit, params: {article: subject.article.id}
#    expect(subject.current_user.first_name).to eq("firstname")
#    expect(subject.current_user.email).to_not eq(user.email)
#    expect(response).to have_http_status(200)
#   end
#   end


  context 'PUT #update' do
  let!(:article) { create :article, user: user }

  it 'should update article info' do
   params = {
    title: 'a',
    content: 'c'
   }

   put :update, params: { id: article.id, article: params }
   article.reload
   params.keys.each do |key|
    expect(article.attributes[key.to_s]).to eq params[key]
   end
  end
  end


describe 'before actions' do
  describe 'set_article' do
    it 'is expected to define before action' do
      is_expected.to use_before_action(:set_article)
    end
  end
end


  context 'GET #index' do
   it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
   end
  end

#    context 'GET #show' do
#    let!(:article) { create :article, user: user }
#
#    it 'should success and render to edit page' do
#       get :show, params: { id: article.id }
#       expect(response).to have_http_status(200)
#       expect(response).to render_template :show
#    end
#  end

#  context 'GET #edit' do
#  let!(:article) { create :article, user: user }
#
#  it 'should success and render to edit page' do
#     get :edit, params: { id: article.id }
#     expect(response).to have_http_status(200)
#     expect(response).to render_template :edit
#  end
#  end

#  context 'PUT #update' do
#  let!(:article) { create :article, user: user }

#  it 'should update article info' do
#   params = {
#    title: 'a',
#    content: 'c'
#   }
#
#   put :update, params: { id: article.id, article: params }
#   article.reload
#   params.keys.each do |key|
#    expect(article.attributes[key.to_s]).to eq params[key]
#   end
#  end
#  end

#  context 'DELETE #destroy' do
#  let!(:article) { create :article, user: user }
#
#  it 'should delete article' do
#   expect { delete :destroy, params: { id: article.id } }.to change(Article, :count).by(-1)
#  end
#end


end
