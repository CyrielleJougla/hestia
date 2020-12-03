class AddScoreToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :score, :integer
  end
end
