class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      redirect_to :root, flash[:notice] = "グループを作成しました"
    else
      redirect_to new_group_path, flash[:alert] = "グループを作成できませんでした"
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    if group.update(create_params)
      redirect_to :root, flash[:notice] = "変更を登録しました"
    else
      redirect_to edit_group_path, flash[:alert] = "変更を登録できませんでした"
  end

  private

  def create_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
