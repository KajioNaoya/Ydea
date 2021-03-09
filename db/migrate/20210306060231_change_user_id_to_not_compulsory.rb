class ChangeUserIdToNotCompulsory < ActiveRecord::Migration[5.2]
  def up
    change_column_null :ideas, :user_id, true
  end

  def down
    change_column_null :ideas, :user_id, false
  end
end
