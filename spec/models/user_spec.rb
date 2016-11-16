require 'rails_helper'
  describe User do
    describe 'sign_up' do

        let(:user) { FactoryGirl.build(:user) }

        it "is valid with a name, email, password, password_confirmation" do
          expect(user).to be_valid
        end

        it "is invalid without a name" do
          user.name =  ""
          user.valid?
          expect(user.errors[:name]).to include("を入力してください。")
        end

        it "is invalid without an email" do
          user.email = ""
          user.valid?
          expect(user.errors[:email]).to include("を入力してください。")
        end

        it "is invalid without a password" do
          user.password = ""
          user.valid?
          expect(user.errors[:password]).to include("を入力してください。")
        end

        it "is invalid without a password_confirmation" do
          user.password_confirmation = ""
          user.valid?
          expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
        end

        it "is invalid with a duplicate email address" do
          user.save
          another_user = build(:user, email: user.email)
          another_user.valid?
          expect(another_user.errors[:email]).to include("はすでに存在します。")
        end

        it "is invalid with a password that has less than 6 characters " do
          user.password = "00000"
          user.password_confirmation = "00000"
          user.valid?
          expect(user.errors[:password][0]).to include("は6文字以上で入力してください。")
        end

    end
  end
