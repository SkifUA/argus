class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :note
      t.belongs_to :product, index: true
      t.belongs_to :user, index: true
      t.boolean :active, default: false
      t.boolean :new, default: true


      t.timestamps
    end
  end
end
