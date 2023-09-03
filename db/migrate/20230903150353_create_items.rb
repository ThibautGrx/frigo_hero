class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.text :descriptionm, null: false
      t.datetime :date
      t.string :address, null: false
      t.float :latitude
      t.float :longitude
      t.references :user, null: false, foreign_key: true
      t.string :category

      t.timestamps
    end
  end
end
