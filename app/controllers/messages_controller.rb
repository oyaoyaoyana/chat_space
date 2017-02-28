class MessagesController < ApplicationController
  before_action :set_group, only: %i( index create)
  before_action :set_messages, only: %i( index create)
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: 'チャットグループが更新されました'}
        format.json
      end
    else
      flash.now[:alert] = 'メッセージが作製されませんでした'
      render 'index'
    end
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_messages
    @messages = Message.where(group_id: @group).order('created_at ASC')
  end
end
