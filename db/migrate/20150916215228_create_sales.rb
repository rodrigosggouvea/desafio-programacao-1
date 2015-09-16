class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.float :income

      t.timestamps null: false
    end
  end
end
