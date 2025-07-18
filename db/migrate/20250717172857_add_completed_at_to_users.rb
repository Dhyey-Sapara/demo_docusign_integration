class AddCompletedAtToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :completed_at, :datetime
  end
end
