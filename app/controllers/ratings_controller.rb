class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])

    @rating = @article.ratings.create(rating_params.merge(:user_id => current_user.id))
    redirect_to @article
  end

  def update
    @article = Article.find(params[:article_id])
    @rating = @article.ratings.find_by(user_id: current_user.id)

    @rating.update(paragraph_params)
    respond_to do |format|
      format.html {redirect_to @article}
      format.js
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @rating = @article.rating.find(params[:id])

    if current_user == @rating.user
      @rating.destroy
    end

    respond_to do |format|
      format.html {redirect_to @article}
      format.js
    end
  end

  def rating_params
    params.require(:rating).permit(:score)
  end
end
