class TagsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @tag = Tag.new
  end

  def create
    @article = Article.find(params[:article_id])
    @tag = Tag.find_by(name: tag_params[:name])
    unless @tag.nil?
      if @article.tags.include? @tag
        return respond_to do |format|
          format.html {redirect_to @article}
          format.js { render :error }
        end
      end

      @article.tags << @tag
    else
      tag_params_temp = tag_params
      tag_params_temp[:name].downcase!
      @tag = @article.tags.create(tag_params_temp)
    end

    respond_to do |format|
      format.html {redirect_to @article}
      format.js
    end
  end


  def destroy
    @article = Article.find(params[:article_id])
    @tag = @article.tags.find(params[:id])
    @article.tags.delete(@tag)

    @tag.destroy if @tag.articles.length == 0

    respond_to do |format|
      format.html {redirect_to @article}
      format.js
    end
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
