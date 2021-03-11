class ChangeTitleOfIdeaToNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column :ideas, :title, :string, null: false
  end
end
