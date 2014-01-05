class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.references :user, index: true
      t.references :conversation, index: true

      t.timestamps
    end
  end
end
