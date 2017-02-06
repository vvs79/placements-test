include ActionView::Helpers::TextHelper

class UsersController < ApplicationController
  # respond_to :json, :html
  before_action :check_if_admin

  def index
    @users = User.all
    @users = @users.paginate(page: params[:page] || 1, per_page: 20).order(updated_at: :desc)
    # respond_with User.all
  end

  def show
    # respond_with User.find params[:id]
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'User does not exist!'
    redirect_to users_path
  end
end
