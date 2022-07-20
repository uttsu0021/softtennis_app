class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :last_name,      null: false
      t.string :first_name,     null: false
      t.string :last_name_kata, null: false
      t.string :first_name_kata,null: false
      t.string :postal_code    ,null: false
      t.string :address,        null: false
      t.string :phone,          null: false
      t.string :group
      t.string :battle_record
      t.references :user,       null: false, foreign_key: true
      t.references :event,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
