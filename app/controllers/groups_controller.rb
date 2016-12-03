class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      flash[:notice] = "グループを作成しました"
      redirect_to :root
    else
      flash[:alert] = "グループを作成できませんでした"
      redirect_to new_group_path
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    if group.user_id == current_user.id
        group.update(create_params)
    end
  end

  private

  def create_params
    params.require(:group).permit(:name)
  end
end
