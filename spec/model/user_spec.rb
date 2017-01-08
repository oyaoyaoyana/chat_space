require 'rails_helper'
describe User do
  describe '#create' do
    context 'with full attributes' do
      it "is valid with name, email, password and password_confirmation" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "is valid when passward 8 characters" do
        user = build(:user, password: "12345678", password_confirmation: "12345678")
        expect(user).to be_valid
      end

      it "is valid when passward 20 characters" do
        user = build(:user, password: "12345678901234567890", password_confirmation: "12345678901234567890")
        expect(user).to be_valid
      end

    end

    context 'lack of attribute' do
      it "is invalid without name" do
        user = build(:user, name: "")
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end

      it "is invalid without password" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      it "is invalid doesn't match password_confirmation" do
        user = build(:user, password_confirmation: "22222222")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end

      it "is invalid when passward within 8 characters" do
        user = build(:user, password: "123457", password_confirmation: "123457")
        user.valid?
        expect(user.errors[:password]).to include("は8文字以上で入力してください")
      end

      it "is invalid when passward over 21 characters" do
        user = build(:user, password: "123456789012345678901", password_confirmation: "123456789012345678901")
        user.valid?
        expect(user.errors[:password]).to include("は20文字以内で入力してください")
      end

      it "is invalid when an email is already token" do
        user1 = create(:user, email: "kkk@gmail.com")
        user2 = build(:user, email: "kkk@gmail.com")
        user2.valid?
        expect(user2.errors[:email]).to include("はすでに存在します")
      end
    end
  end
end
