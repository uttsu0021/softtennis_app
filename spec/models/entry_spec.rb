require 'rails_helper'

RSpec.describe Entry, type: :model do
  before do
    user = FactoryBot.create(:user)
    event = FactoryBot.create(:event)
    @entry = FactoryBot.build(:entry, user_id: user.id, event_id: event.id)
    sleep(0.1)
  end
  describe '申し込み機能の保存' do
    context 'イベントの申し込みができる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@entry).to be_valid
      end
      it 'groupは空でも保存できること' do
        @entry.group = ''
        expect(@entry).to be_valid
      end
      it 'battle_recordは空でも保存できること' do
        @entry.battle_record = ''
        expect(@entry).to be_valid
      end
    end
    context 'イベントの申し込みができない時' do
        it 'last_nameが空だと保存できないこと' do
          @entry.last_name = ''
          @entry.valid?
          expect(@entry.errors.full_messages).to include("名字を入力してください")
        end
        it 'last_nameが全角で(漢字・ひらがな・カタカナ)でないと登録できない' do
          @entry.last_name = 'yamada'
          @entry.valid?
          expect(@entry.errors.full_messages).to include("名字を全角文字にしてください")
        end
        it 'first_nameが空だと保存できないこと' do
          @entry.first_name = ''
          @entry.valid?
          expect(@entry.errors.full_messages).to include("名前を入力してください")
        end
        it 'first_nameが全角で(漢字・ひらがな・カタカナ)でないと登録できない' do
          @entry.first_name = 'taro'
          @entry.valid?
          expect(@entry.errors.full_messages).to include("名前を全角文字にしてください")
        end
        it 'last_name_kataが空だと保存できないこと' do
          @entry.last_name_kata = ''
          @entry.valid?
          expect(@entry.errors.full_messages).to include("名字カタカナを入力してください")
        end
        it 'last_name_kataが全角(カタカナ)でないと登録できない' do
          @entry.last_name_kata = 'やまだ'
          @entry.valid?
          expect(@entry.errors.full_messages).to include("名字カタカナを全角カタカナにしてください")
        end
        it 'first_name_kataが空だと保存できないこと' do
          @entry.first_name_kata = ''
          @entry.valid?
          expect(@entry.errors.full_messages).to include("名前カタカナを入力してください")
        end
        it 'first_name_kataが全角(カタカナ)でないと登録できない' do
          @entry.first_name_kata = 'たろう'
          @entry.valid?
          expect(@entry.errors.full_messages).to include("名前カタカナを全角カタカナにしてください")
        end
        it 'postal_codeが空だと保存できないこと' do
          @entry.postal_code = ''
          @entry.valid?
          expect(@entry.errors.full_messages).to include("郵便番号を入力してください")
        end
        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @entry.postal_code = '1234567'
          @entry.valid?
          expect(@entry.errors.full_messages).to include("郵便番号は無効です。ハイフンを含めてください")
        end
        it 'addressが空だと保存できないこと' do
          @entry.address = ''
          @entry.valid?
          expect(@entry.errors.full_messages).to include("住所を入力してください")
        end
        it 'phoneが空だと保存できないこと' do
          @entry.phone = ''
          @entry.valid?
          expect(@entry.errors.full_messages).to include("電話番号を入力してください")
        end
        it 'phoneは半角数字以外だと保存できないこと' do
          @entry.phone = '０９０１２３４５６７８'
          @entry.valid?
          expect(@entry.errors.full_messages).to include("電話番号は半角数字のみ入力してください")
        end
        it '電話番号は英数字混合では保存できないこと' do
          @entry.phone = '090aaaa1234'
          @entry.valid?
          expect(@entry.errors.full_messages).to include("電話番号は半角数字のみ入力してください")
        end
        it ' 電話番号は12桁以上では保存できないこと' do
          @entry.phone = '09012345678912'
          @entry.valid?
          expect(@entry.errors.full_messages).to include("電話番号は半角数字のみ入力してください")
        end
        
        it 'event_idがないと保存できないこと' do
          @entry.event_id = nil
          @entry.valid?
          expect(@entry.errors.full_messages).to include("Eventを入力してください")
        end
        it 'user_idがないと保存できないこと' do
          @entry.user_id = nil
          @entry.valid?
          expect(@entry.errors.full_messages).to include("Userを入力してください")
        end
    end
  end
end
