class UsersController < ApplicationController
  def edit
  end

  def search
    @users = User.where('name LIKE(?)', "%#{params[:user][:text]}%")
    respond_to do |format|
      format.any
      format.json { render json: @users }
    end
  end
end
