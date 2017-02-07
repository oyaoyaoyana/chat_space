class GroupsController < ApplicationController
  before_action :set_group, only: :edit

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: 'グループが作成されました'
    else
      render action: :new, alert: 'グループが作成されませんでした'
    end
  end

  def edit
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループが更新されました'
    else
      render :action => 'edit', alert: 'グループが更新されませんでした'
    end
  end

  private

  def group_params

    params_user << current_user.id unless params_user.include?("#{current_user.id}")
    strong_params
  end

  #paramsのuser_id部分
  def params_user
    params[:group][:user_ids]
  end

  def strong_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
