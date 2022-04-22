class Event < ApplicationRecord
  has_one_attached :image
  with_options presence: true do
    validates :event
    validates :category
    validates :date
    validates :prefectures
    validates :venue
    validates :fee
    validates :deadline
    validates :explanation
  end
end
