class CreateAdministrators < ActiveRecord::Migration[5.0]
  def change
    create_table :administrators do |t|
      t.integer :user_id
      t.string :role
      t.timestamps
    end
  end
end
