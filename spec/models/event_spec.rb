require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end
  describe 'イベントデータの保存' do
    context '保存できる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@event).to be_valid
      end
    end
    context '保存できない時' do
      it 'eventが空だと保存できない' do
        @event.event = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("イベント名/大会名を入力してください")
      end
      it 'categoryが空だと保存できない' do
        @event.category = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("シングルスかダブルスを入力してください")
      end
      it 'dateが空だと保存できない' do
        @event.date = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("日程を入力してください")
      end
      it 'prefecturesが空だと保存できない' do
        @event.prefectures = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'venueが空だと保存できない' do
        @event.venue = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("会場を入力してください")
      end
      it 'feeが空だと保存できない' do
        @event.fee = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("参加費を入力してください")
      end
      it 'deadlineが空だと保存できない' do
        @event.deadline = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("応募締め切りを入力してください")
      end
      it 'explanationが空だと保存できない' do
        @event.explanation = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("説明を入力してください")
      end
      it 'imageが空だと保存できない' do
        @event.image = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("画像を入力してください")
      end
    end
  end
end
