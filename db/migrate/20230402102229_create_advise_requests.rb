class CreateAdviseRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :advise_requests do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :description
      t.timestamps
    end
  end
end
