class CreateAdvise < ActiveRecord::Migration[6.1]
  def change
    create_table :advises do |t|
      t.integer :user_id
      t.string :subject
      t.string :description
      t.string :advise
      t.timestamps
    end
  end
end
