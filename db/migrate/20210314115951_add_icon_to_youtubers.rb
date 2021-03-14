class AddIconToYoutubers < ActiveRecord::Migration[5.2]
  def change
    add_column :you_tubers, :icon, :string
  end
end
