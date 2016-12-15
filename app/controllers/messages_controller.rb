class MessagesController < ApplicationController

  def index
    @groups = Group.all
    @group = Group.find(params[:group_id])
    @messages = @group.messages
    @message = Message.new
  end

  def new
  end

  def create
    @message = current_user.messages.new(create_params)
    if @message.save
      flash[:notice] = "メッセージを送信しました"
    else
      flash[:alert] = "メッセージを送信できませんでした"
    end
    redirect_to group_messages_path
  end

  private

  def create_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end

end

