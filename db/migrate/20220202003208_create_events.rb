class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event,       null: false
      t.string :category,    null: false
      t.string :date,       null: false
      t.string :prefectures, null: false
      t.string :venue,       null: false
      t.string :fee,        null: false
      t.string :deadline,   null: false
      t.text :explanation,   null: false
      t.references :user,    foreign_key: true
      t.timestamps
    end
  end
end
