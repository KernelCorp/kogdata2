class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :city
      t.date :date
      t.string :time
      t.references :event_type, index: true
      t.integer :budget
      t.references :customer, index: true

      t.timestamps
    end
  end
end
