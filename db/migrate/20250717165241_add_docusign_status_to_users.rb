class AddDocusignStatusToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :docusign_status, :string
  end
end
