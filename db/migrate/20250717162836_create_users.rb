class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :username
      t.text :envelope_id
      t.text :email

      t.timestamps
    end
  end
end
