class ContentsController < ApplicationController
  def create

  end

  def update
  end

  def destroy
  end

  private

  def content_params
    params.require(:content).permit(:title, :paragraph, :para)
  end
end
