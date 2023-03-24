class CreatePostRequest < ActiveRecord::Migration[6.1]
  def change
    create_table :post_requests do |t|
      t.integer :user_id
      t.datetime :event_date
      t.string :city
      t.string :address
      t.string :phone
      t.string :tittle
      t.text :description
      t.text :reply
      t.timestamps
    end
  end
end
