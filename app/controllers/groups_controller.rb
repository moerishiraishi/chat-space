class GroupsController < ApplicationController

  before_action :set_group, only: [:edit, :update]
  def index
    @message = Message.new
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      redirect_to :root, flash[:notice] = { alert: "グループを作成できました" }
    else
      redirect_to new_group_path, flash[:alert] = { alert: "グループを作成できませんでした" }
    end
  end

  def edit_group_path
  end

  def update
    if @group.update(create_params)
      redirect_to :root, flash[:notice] = { alert: "変更を登録しました" }
    else
      redirect_to edit_group_path, flash[:alert] = { alert: "変更を登録できませんでした" }
    end
  end

  private

  def create_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
   @group = Group.find(params[:id])
  end
end
