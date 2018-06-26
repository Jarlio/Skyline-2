class TagsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @tag = @article.tags.create(tag_params)

    respond_to do |format|
      format.html {redirect_to @article}
      format.js
    end
  end


  def destroy
    @article = Article.find(params[:article_id])
    @tag = @article.tags.find(params[:id])

    @tag.destroy

    respond_to do |format|
      format.html {redirect_to @article}
      format.js
    end
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
