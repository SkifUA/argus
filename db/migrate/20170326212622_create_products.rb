class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.text :seo_words
      t.text :seo_description
      t.text :description
      t.text :features
      t.text :mini_description
      t.text :mini_features
      t.string :photo
      t.string :passport
      t.string :certificate
      t.integer :brand_id
      t.integer :purveyor_id
      t.integer :type_id
      t.integer :kind_id
      t.timestamps
    end
  end
end
