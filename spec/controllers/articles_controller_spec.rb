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


describe 'PATCH #update' do
    before do
     @article = create(:article, user_id: subject.current_user.id)
   end
    it 'should update article and redirect to article' do
      patch :update, params: { id: subject.current_user.id, article: { title: 'Lolka' } }
    #  expect(subject.current_user.article.title).to eq('Lolka')
      expect(response).to redirect_to @article
    end
end


  describe "GET #show" do
   it "has a 200 status code" do
   expect(response.status).to eq(200)
  end

  it "responds to html by default" do
   expect(response.content_type)=="text/html"
  end
 end

 context "without render_views" do
   describe "GET index" do
     it "renders the RSpec generated template" do
       get :index
       expect(response.body).to eq("")
     end
   end
 end

end
