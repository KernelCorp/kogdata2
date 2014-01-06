class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :attachment
      t.references :photographer, index: true

      t.timestamps
    end
  end
end
