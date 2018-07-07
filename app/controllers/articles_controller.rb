# articles controller
class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def search_tag
    @articles = Article.joins(:tags).where("name LIKE ? ", "%#{params[:name]}%").distinct
    render :json => @articles
  end

  def search_title
    @articles = Article.where("title LIKE ?", "%#{params[:title]}%")
    render :json => @articles
  end

  def show
    @article = Article.find(params[:id])

    @contents = []
    @contents += @article.paragraphs
    @contents += @article.galleries
    @contents.sort_by! {|content| content.position }
  end

  def destroy
    @article = Article.find(params[:id])

    if @article.destroy
      redirect_to user_profile_path(current_user.username)
    else
      redirect_to error_path('The article could not be deleted')
    end
  end

  def create
    @article = Article.new(article_params)

    # no other user should be able to make articles for this user
    @article.user = current_user

    if @article.save
      redirect_to @article
    else
      render '/error'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.user == current_user
      if @article.update(article_params)
        redirect_to @article
      else
        redirect_to error_path('Article could not be updated')
      end
    else
      redirect_to error_path('Article could not be updated')
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :user_id, :intro)
  end

end
