class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.date :date, null: false
      t.datetime :time, null: false
      
      t.timestamps
    end
  end
end
