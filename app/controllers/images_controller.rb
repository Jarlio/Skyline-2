class ImagesController < ApplicationController

  def new
    @article = Article.find(params[:article_id])
    @gallery = @article.galleries.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    @article = Article.find(params[:article_id])
    @gallery = @article.galleries.find(params[:gallery_id])

    if @article.user = current_user
      @image = @gallery.images.create(image_params)
      redirect_to @article
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @gallery = @article.galleries.find(params[:gallery_id])
    @image = @gallery.images.find(params[:id])

    @image.destroy

    redirect_to @article
  end

  def image_params
    params.require(:image).permit(:image, :title, :description)
  end

end
