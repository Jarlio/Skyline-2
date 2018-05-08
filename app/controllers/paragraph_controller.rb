# paragraph controller
class ParagraphController < ApplicationController
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

  private

  def paragraph_params
    params.require(:paragraph).permit(:title, :content)
  end
end
