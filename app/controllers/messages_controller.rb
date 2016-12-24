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
    message = @message.body
    if @message.save
      respond_to do |format|
        format.any
        format.json { render json: { message: { name: @message.user.name, created_at: @message.created_at, body: @message.body } } }
      end
      flash[:notice] = "メッセージを送信しました"
    else
      flash[:alert] = "メッセージを送信できませんでした"
    end
  end

  private

  def create_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end

end

