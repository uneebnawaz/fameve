class AddAttributesToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :like, :boolean, default: false
    add_column :services, :ratings, :float
    add_column :services, :reviews, :int
  end
end
