class GalleriesController < ApplicationController

  def create
    @article = Article.find(params[:article_id])

    if @article.user = current_user
      @gallery= @article.galleries.create(gallery_params)
      redirect_to @article
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @gallery = @article.galleries.find(params[:id])
    @gallery.destroy
    redirect_to article_path(@article)
  end

  def gallery_params
    params.require(:gallery).permit(:title, :description, :position)
  end

end
