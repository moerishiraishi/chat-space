class UsersController < ApplicationController
  def edit
  end

  def search
    @users = User.where('name LIKE(?)',"%#{params[:keyword]}%").order('name ASC')
    respond_to do |format|
      format.any
      format.json { render json: @users }
    end
  end
end
