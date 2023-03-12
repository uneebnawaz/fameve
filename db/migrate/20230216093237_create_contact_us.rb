class CreateContactUs < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_us do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :subject
      t.text :description
      t.timestamps
    end
  end
end
