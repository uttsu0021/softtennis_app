class Entry < ApplicationRecord
  belongs_to :event
  belongs_to :user
  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name_kata
    validates :first_name_kata
    validates :postal_code
    validates :address
    validates :user_id
    validates :event_id
  end
end
