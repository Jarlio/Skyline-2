class ParagraphsController < ApplicationController

  def edit
    @article = Article.find(params[:article_id])
    @paragraph = @article.paragraphs.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @article = Article.find(params[:article_id])
    @paragraph = @article.paragraphs.find(params[:id])

    if @article.user == current_user

      @paragraph.update(paragraph_params)
      respond_to do |format|
        format.html {redirect_to @article}
        format.js
      end

    else

      respond_to do |format|
        format.html {redirect_to error_path("problem with the creation of paragraph!")}
        format.js {  render "alert('paragraph controller')"}
      end

    end
  end

  def create
    @article = Article.find(params[:article_id])

    if @article.user == current_user
      @paragraph = @article.paragraphs.create(paragraph_params)
      redirect_to @article
    else
      redirect_to error_path("problem with the creation of paragraph!")
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @paragraphs = @article.paragraphs.find(params[:id])
    @paragraphs.destroy
    redirect_to article_path(@article)
  end

  def paragraph_params
    params.require(:paragraph).permit(:title, :text, :position)
  end

end
