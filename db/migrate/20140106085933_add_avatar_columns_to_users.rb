class AddAvatarColumnsToUsers < ActiveRecord::Migration
  def change
    add_attachment :user, :avatar
  end
end
