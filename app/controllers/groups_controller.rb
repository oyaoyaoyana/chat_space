class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: 'グループが作成されました'
    else
      redirect_to new_group_path, alert: 'グループが作成されませんでした'
    end
    
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
