class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
  end

  def create
    Group.create(create_params)
    redirect_to :root
  end

  private
  def create_params
    params.require(:group).permit(:name)
  end
end
