class CreateYouTubers < ActiveRecord::Migration[5.2]
  def change
    create_table :you_tubers do |t|
      t.string :name
      t.string :channel_id
      t.string :title
      t.text :detail
      t.date :due

      t.timestamps
    end
  end
end
