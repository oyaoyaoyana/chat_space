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
end
