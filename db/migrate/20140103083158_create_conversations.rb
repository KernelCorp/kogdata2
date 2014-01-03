class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :theme
      t.references :owner

      t.timestamps
    end
  end
end
