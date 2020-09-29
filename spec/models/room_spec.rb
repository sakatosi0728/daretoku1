require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'ルームの保存' do
    context "ルームが保存できる場合" do
      it "画像とテキストがあればルームは保存される" do
        expect(@room).to be_valid
      end
    end
    context "ルームが保存できない場合" do
      it "テキストがないとルームは保存できない" do
        @room.text = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("テキストを入力してください")
      end
      it "画像がないとツイートは保存できない" do
        @room.image = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("画像を入力してください")
      end 
      it "ユーザーが紐付いていないとルームは保存できない" do
        @room.user = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end