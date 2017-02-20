require 'rails_helper'

RSpec.describe MessagesController, :type => :controller do
  let(:group) { create(:group, user_ids: @user.id)}
  context "When user is log in" do
    login_user
    describe "GET #index" do
      before do
        get :index,  params: { group_id: group }
      end

      it "has @messages same as messages" do
        messages = create_list(:message, 3, group_id: group.id )
        expect(assigns(:messages)).to eq messages
      end

      it "has @group same as params" do
        expect(assigns(:group)).to eq group
      end

      it "has empty instance" do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end

    describe "POST #create " do
      context "when it is valid" do
        before do
          post :create,  params: { group_id: group , message: attributes_for(:message)}
        end
        it "saves the new message in the database" do
          expect{
            post :create,  params: { group_id: group , message: attributes_for(:message)}
          }.to change(Message, :count).by(1)
        end

        it "redirects to articles#index" do
          expect(response).to redirect_to group_messages_path
        end

        it "has flash message notice" do
          expect(flash[:notice]).not_to be_empty
        end
      end

      context "when it is invalid" do
        before do
          post :create,  params: { group_id: group , message: attributes_for(:message, body: "")}
        end
        it "doesn't save the new message in the database" do
          expect{
            post :create,  params: { group_id: group , message: attributes_for(:message, body: "")}
          }.not_to change(Message, :count)
        end

        it "render index" do
          expect(response).to render_template :index
        end

        it "has flash message alert" do
          expect(flash[:alert]).not_to be_empty
        end
      end
    end
  end

  context "when user is not login" do
    let(:user) { create(:user, email: "test@gmail.com")}
    let(:group) { create(:group, user_ids: user.id)}

    describe "when access to #index" do
      it "is redirect to new_user_session_path" do
        get :index, params: { group_id: group }
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "when access to #create" do
      it "is redirect to new_user_session_path" do
        post :create,  params: { group_id: group , message: attributes_for(:message)}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
