class ChatGroupsController < ApplicationController
  before_action :set_chat_group, only: [:show, :edit, :update, :destroy]

  def index
    @chat_groups = ChatGroup.all
  end

  def new
    @chat_group = ChatGroup.new
  end

  def edit
  end

  def create
    @chat_group = ChatGroup.new(chat_group_params)

    respond_to do |format|
      if @chat_group.save
        format.html { redirect_to @chat_group, notice: 'Chat group was successfully created.' }
        format.json { render :show, status: :created, location: @chat_group }
      else
        format.html { render :new }
        format.json { render json: @chat_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chat_group.update(chat_group_params)
        format.html { redirect_to @chat_group, notice: 'Chat group was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat_group }
      else
        format.html { render :edit }
        format.json { render json: @chat_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chat_group.destroy
    respond_to do |format|
      format.html { redirect_to chat_groups_url, notice: 'Chat group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_group
      @chat_group = ChatGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_group_params
      params.fetch(:chat_group, {})
    end
end
