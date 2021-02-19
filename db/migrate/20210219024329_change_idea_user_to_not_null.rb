class ChangeIdeaUserToNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column :ideas, :user_id, :integer, null: false
  end
end
