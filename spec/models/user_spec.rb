require 'rails_helper'

describe User do
  describe '#create' do

    it 'name,email,password,password_confirmationが存在すれば登録できること' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'nameがない場合は登録できないこと' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'emailがない場合は登録できないこと' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'passwordがない場合は登録できないこと' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'passwordpassが存在してもword_confirmationがない場合は登録できないこと' do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("don't match password")
    end

    it 'passwordが6文字以上であれば登録できること' do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end