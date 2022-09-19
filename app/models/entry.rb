class Entry < ApplicationRecord
  belongs_to :event
  belongs_to :user
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: 'Full-width characters' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true,format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } do
    validates :last_name_kata
    validates :first_name_kata
  end

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone, format: { with: /\A\d{11}\z/, message: 'number Input only number' }
    validates :address
    validates :user_id
    validates :event_id
  end
end
