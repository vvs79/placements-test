include ActionView::Helpers::TextHelper

class CommentsController < ApplicationController
  # respond_to :json, :html
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @comment = current_user.comments.new
  end

  def create
    # respond_with Place.create place_params
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to :back
    else
      flash[:danger] = 'Please, enter comments'
      redirect_to :back
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :place_id, :user_id, {images: []})
    end
end