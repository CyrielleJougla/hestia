class ChangeNullToTrueInTasks < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :user_id, :bigint, null: true
  end
end
