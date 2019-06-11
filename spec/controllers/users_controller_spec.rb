require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { build(:user) }

 login_user

    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end


    #describe "GET #show" do
    #  it "has a 200 status code" do
    #    expect(response.status).to eq(200)
    #  end
    #  it "responds to html by default" do
    #    expect(response.content_type)=="content/html"
    #  end
    #end

    describe "GET #show" do
   it "returns http success" do
     get :show, params: {id: subject.current_user.id}
     expect(response).to have_http_status(:success)
   end
 end


end
