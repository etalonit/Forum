class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  
  def index
      if params.has_key?(:category)
        @category = Category.find_by_name(params[:category])
        @articles = Article.where(category: @category)
      else
        @articles = Article.search(params[:search]).order(:title).page(params[:page])
      end
  end


  
  def show
    @comments = Comment.where(article_id: @article).order("created_at DESC")
  end

  
  def new
    @article = current_user.articles.build
  end

  
  def edit
  end

  
  def create
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    end
  end

  def upvote
    @article.upvote_from current_user
    redirect_to article_path
  end

  def downvote
    @article.downvote_from current_user
    redirect_to article_path
  end

  private
   
    def set_article
      @article = Article.find(params[:id])
    end

   
    def article_params
      params.require(:article).permit(:title, :content, :user_id, :image, :audio, :category_id)
    end
end
