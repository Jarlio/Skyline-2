# for more information see the content model
class ContentsController < ApplicationController
  def create
    @content = Content.new(content_params)
    @article = Article.find(params[:article_id])

    if @article.user == current_user
      @content.article = @article

      if @content.save
        redirect_to article_path(@article.id)
      else
        redirect_to error_path('The content could not be created!')
      end
    else
      redirect_to error_path('The content could not be created!')
    end
  end

  def update
    @article = Article.find(params[:article_id])
    @content = @article.contents.find(params[:id])

    if @article.user == current_user
      if @content.update(content_params)
        redirect_to article_path(@article.id)
      else
        redirect_to error_path('The content could not be updated!')
      end
    else
      redirect_to error_path('The content could not be updated!')
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @content = @article.contents.find(params[:id])

    if @article.user == current_user
      if @content.destroy
        redirect_to article_path(@article.id)
      else
        redirect_to error_path('The content could not be deleted!')
      end
    else
      redirect_to error_path('The content could not be deleted!')
    end
  end

  private

  def content_params
    params.require(:content).permit(:title, :paragraph, :chart, :article_id, :c_type)
  end

end
