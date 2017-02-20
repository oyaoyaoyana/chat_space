require 'rails_helper'
describe Message do
  describe '#create' do
    context 'with full attributes' do
      it "is valid with group_id, user_id and body" do
        message = build(:message)
        expect(message).to be_valid
      end
    end

    context 'lack of attribute' do
      it "is invalid without body" do
        message = build(:message, body:"")
        message.valid?
        expect(message.errors[:body]).to include("を入力してください")
      end

      it "is invalid without user_id" do
        message = build(:message, user_id: "")
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end

      it "is invalid without group_id" do
        message = build(:message, group_id: "")
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")
      end
    end
  end
  describe "show_time method" do
    context "nomal case " do
      it "is not null" do
        message = create(:message)
        message_time = message.show_time
        expect(message_time).not_to be_nil
      end
      it "is same as expectation" do
        message = create(:message, created_at: "Mon, 20 Feb 2017 13:16:10 JST +09:00")
        message_time = message.show_time
        expect(message_time).to eq ("02/20/17 13:16:10")
      end
    end
  end
end
