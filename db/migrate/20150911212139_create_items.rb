class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.float :price
      t.integer :count

      t.timestamps null: false
    end
  end
end
