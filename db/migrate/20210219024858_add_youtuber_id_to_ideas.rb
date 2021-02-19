class AddYoutuberIdToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_reference :ideas, :you_tuber, foreign_key: true
  end
end
