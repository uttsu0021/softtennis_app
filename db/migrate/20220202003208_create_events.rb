class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event,       null: false
      t.string :category,    null: false
      t.integer :date,       null: false
      t.integer :prefectures, null: false
      t.string :venue,       null: false
      t.integer :fee,        null: false
      t.integer :deadline,   null: false
      t.text :explanation,   null: false
      t.references :user,    foreign_key: true
      t.timestamps
    end
  end
end
