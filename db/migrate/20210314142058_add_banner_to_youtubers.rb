class AddBannerToYoutubers < ActiveRecord::Migration[5.2]
  def change
    add_column :you_tubers, :banner, :string
  end
end
