class CreateEventRequests < ActiveRecord::Migration
  def change
    create_table :event_requests do |t|
      t.references :event, index: true
      t.references :photographer, index: true

      t.timestamps
    end
  end
end
