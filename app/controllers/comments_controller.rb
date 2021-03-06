class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])

    @comment = @article.comments.create(comment_params.merge(:user_id => current_user.id))
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    @comment.destroy if current_user == @article.user || current_user = @comment.user
    redirect_to article_path(@article)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
