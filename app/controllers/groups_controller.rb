class GroupsController < ApplicationController
  before_action :set_group, only: :edit

  def index
  end

  def new
    @group = Group.new
  end

  def create
    params[:group][:user_ids] << "#{current_user.id}"
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: 'グループが作成されました'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループが更新されました'
    else
      flash.now[:alert] = 'グループが更新されませんでした'
      render action: 'edit'
    end
  end

  def search
    @users = User.search_by(search_params[:name])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def search_params
    params.permit(:name)
  end

end
