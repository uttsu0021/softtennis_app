class Event < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :entries
  belongs_to :user

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
