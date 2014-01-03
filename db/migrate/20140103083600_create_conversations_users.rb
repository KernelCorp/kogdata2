class CreateConversationsUsers < ActiveRecord::Migration
  def change
    create_table :conversations_users, id: false do |t|
      t.references :user, index: true
      t.references :conversation, index: true
      t.timestamps
    end
    add_index :conversations_users, [:user_id, :conversation_id]
  end
end
