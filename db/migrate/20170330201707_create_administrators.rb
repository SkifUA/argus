class CreateAdministrators < ActiveRecord::Migration[5.0]
  def change
    create_table :administrators do |t|
      t.belongs_to :user, index: true
      t.string :role
      t.timestamps
    end
  end
end
