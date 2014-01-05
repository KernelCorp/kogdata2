class CreateSkillsUsers < ActiveRecord::Migration
  def change
    create_table :skills_users, id: false do |t|
      t.references :user,  index: true
      t.references :skill, index: true
    end
    add_index :skills_users, [:user_id, :skill_id]
  end
end
