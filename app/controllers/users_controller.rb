class UsersController < ApplicationController
  def show
  	@user = User.friendly.find(params[:id])
  	@user_articles = @user.articles
  end

 

end
