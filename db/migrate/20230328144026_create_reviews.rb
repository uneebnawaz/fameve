class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :service_id
      t.text :description
      t.timestamps
    end
  end
end
