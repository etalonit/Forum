require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
    let!(:user) { build(:user) }

    login_user

    let!(:comment) { build(:comment) }

      it "should have a current_user" do
        expect(subject.current_user).to_not eq(nil)
      end


      describe "GET #show" do
        it "has a 200 status code" do
          expect(response.status).to eq(200)
        end
        it "responds to html by default" do
          expect(response.content_type)=="content/html"
        end
      end

      #describe "GET #create" do
      #  it "renders the 'new' template" do
    #      expect(response).to render_template("new")
    #    end
    #  end

      describe 'article #destroy' do
      	it "should not delete " do
      		expect(:delete => "/comments/1234").not_to be_routable
      	end
      end
  #  describe 'POST #create' do
  #  it "should create intstitution comment and redirect" do
  #    post :create, params: {article_comment: {content: "Test"}}
  #    expect(subject.article.comment.content).to eq("Test")
  #    expect(response).to redirect_to article_path(subject.article.id)
  #  end
  #end

#      describe 'PATCH update' do
#      	before do
#          @comment = create(:comment, user_id: subject.current_user.id, article_id: subject.article.id)
#        end
#        it "should update comment" do
#          patch :update, params: { id: subject.current_user.id, comment: {content: "Test123"}}
#          expect(@comment.content).to eq("Test123")
#        end
#        it "should redirect to article" do
#       	  patch :update, params: { id: subject.current_user.id, comment: {content: "Test123"}}
#          expect(response).to redirect_to article_path(@comment.article.id)
#        end
#    end
end
