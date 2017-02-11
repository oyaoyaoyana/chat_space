class MessagesController < ApplicationController
  before_action :set_group, only: :index
  def index
    @messages = Message.where(group_id: 2)
  end
  private
  def set_group
    @group = Group.find(params[:group_id])
  end
end
