class RatingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def update
    @rating = Rating.find(params[:id])
    @article = @rating.article
    if @rating.update_attributes(score: params[:score])
      respond_to do |format|
        format.js
      end
    end
  end

end
