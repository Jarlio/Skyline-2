# paragraph controller
class ParagraphController < ApplicationController

  # TODO: middleware
  # - just author of the article can use this controller

  def create
    @article = Article.find(params[:article_id])

    paragraph = @article.paragraphs.create(paragraph_params)

    if paragraph.valid?
      redirect_to article_path(@article)
    else
      render 'layouts/error'
    end
  end

  def update
    @paragraph = Paragraph.find(params.id)

    if @paragraph.update(paragraph_params)
      redirect_to @paragraph.article
    else
      render 'layouts/error'
    end
  end

  def destroy
    @paragraph = Paragraph.find(params[:id])
    id = @paragraph.article.id
    @paragraph.destroy


    respond_to do |format|
      format.html { redirect_to article_path(id) }
      # render paragraph/destroy.js.erb
      # TODO: fix this error: the file will not load
      format.js { render action: 'destroy' }
    end
  end

  private

  def paragraph_params
    params.require(:paragraph).permit(:title, :content)
  end
end
