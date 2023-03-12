class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :tittle
      t.text :description
      t.string :price

      t.timestamps
    end
  end
end
