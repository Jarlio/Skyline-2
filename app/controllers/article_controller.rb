# article controller
class ArticleController < ApplicationController
  before_action :authenticate_user!

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to @article
    else
      render 'article/error'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :user_id, :intro)
  end
end
